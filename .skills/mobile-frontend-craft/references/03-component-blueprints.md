# 03: Component & Architecture Blueprints (Production-Ready)

Use these exact architectural patterns when implementing modern frontend and mobile features.

---

## 1. Validated Form with React Hook Form + Zod

```tsx
import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

export const PaymentSchema = z.object({
  recipient: z.string().min(5, 'Nama penerima minimal 5 karakter'),
  amount: z.coerce.number().min(10000, 'Minimal transfer Rp 10.000'),
  notes: z.string().max(100, 'Catatan maksimal 100 karakter').optional(),
});

export type PaymentFormData = z.infer<typeof PaymentSchema>;

export const QuickPaymentForm: React.FC<{ onSubmit: (data: PaymentFormData) => void }> = ({ onSubmit }) => {
  const {
    register,
    handleSubmit,
    formState: { errors, isSubmitting },
  } = useForm<PaymentFormData>({
    resolver: zodResolver(PaymentSchema),
  });

  return (
    <form onSubmit={handleSubmit(onSubmit)} class="space-y-4">
      <div>
        <label class="block text-xs font-bold text-slate-700 mb-1.5">Rekening / E-Wallet Tujuan</label>
        <input
          {...register('recipient')}
          class="w-full h-12 px-4 rounded-2xl bg-slate-100 border border-transparent focus:border-slate-900 focus:bg-white text-sm outline-none transition-all"
          placeholder="e.g. 081234567890 (GoPay)"
        />
        {errors.recipient && <p class="text-xs text-rose-500 mt-1 font-medium">{errors.recipient.message}</p>}
      </div>

      <div>
        <label class="block text-xs font-bold text-slate-700 mb-1.5">Nominal Transfer (Rp)</label>
        <input
          type="number"
          {...register('amount')}
          class="w-full h-12 px-4 rounded-2xl bg-slate-100 border border-transparent focus:border-slate-900 focus:bg-white text-sm tabular-nums outline-none transition-all"
          placeholder="50000"
        />
        {errors.amount && <p class="text-xs text-rose-500 mt-1 font-medium">{errors.amount.message}</p>}
      </div>

      <button
        type="submit"
        disabled={isSubmitting}
        class="w-full h-13 rounded-2xl bg-slate-950 text-white font-bold text-sm flex items-center justify-center transition-transform active:scale-[0.97]"
      >
        {isSubmitting ? 'Memproses...' : 'Kirim Sekarang'}
      </button>
    </form>
  );
};
```

---

## 2. Server State with TanStack Query + Ky

```typescript
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import ky from 'ky';

const api = ky.create({ prefixUrl: '/api' });

export interface WalletBalance {
  total: number;
  currency: string;
  monthlyGrowth: number;
}

export function useWallet() {
  return useQuery({
    queryKey: ['wallet-balance'],
    queryFn: () => api.get('wallet').json<WalletBalance>(),
    staleTime: 1000 * 60 * 3, // 3 mins cache
  });
}

export function useSendMoney() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (payload: { recipient: string; amount: number }) =>
      api.post('transfer', { json: payload }).json(),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['wallet-balance'] });
      queryClient.invalidateQueries({ queryKey: ['transactions'] });
    },
  });
}
```

---

## 3. Global Client State with Zustand

```typescript
import { create } from 'zustand';
import { persist } from 'zustand/middleware';

interface AppPreferenceState {
  isBalanceHidden: boolean;
  activeTheme: 'crisp-daylight' | 'obsidian-dark';
  toggleBalance: () => void;
  setTheme: (theme: 'crisp-daylight' | 'obsidian-dark') => void;
}

export const useAppStore = create<AppPreferenceState>()(
  persist(
    (set) => ({
      isBalanceHidden: false,
      activeTheme: 'crisp-daylight',
      toggleBalance: () => set((state) => ({ isBalanceHidden: !state.isBalanceHidden })),
      setTheme: (theme) => set({ activeTheme: theme }),
    }),
    { name: 'app-preferences' }
  )
);
```

---

## 4. Tactile Bottom Drawer with Motion (Framer Motion)

```tsx
import React from 'react';
import { motion, AnimatePresence } from 'framer-motion';

interface DrawerProps {
  isOpen: boolean;
  onClose: () => void;
  title: string;
  children: React.ReactNode;
}

export const TactileDrawer: React.FC<DrawerProps> = ({ isOpen, onClose, title, children }) => {
  return (
    <AnimatePresence>
      {isOpen && (
        <>
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            class="fixed inset-0 bg-black/50 z-40 backdrop-blur-xs"
          />
          <motion.div
            initial={{ y: '100%' }}
            animate={{ y: 0 }}
            exit={{ y: '100%' }}
            transition={{ type: 'spring', damping: 25, stiffness: 280 }}
            class="fixed bottom-0 left-0 right-0 max-w-[430px] mx-auto bg-white rounded-t-[36px] p-6 z-50 shadow-2xl border-t border-slate-100"
          >
            <div class="w-12 h-1.5 bg-slate-200 rounded-full mx-auto mb-4" />
            <h3 class="text-base font-bold text-slate-950 text-center mb-4">{title}</h3>
            {children}
          </motion.div>
        </>
      )}
    </AnimatePresence>
  );
};
```

---

## 5. Clean Analytics Chart with Recharts (Tabular Nums & Zero Slop)

```tsx
import React from 'react';
import { ResponsiveContainer, AreaChart, Area, XAxis, Tooltip } from 'recharts';

const data = [
  { day: 'Sen', amount: 1200000 },
  { day: 'Sel', amount: 850000 },
  { day: 'Rab', amount: 2100000 },
  { day: 'Kam', amount: 1400000 },
  { day: 'Jum', amount: 2900000 },
  { day: 'Sab', amount: 3800000 },
  { day: 'Min', amount: 1950000 },
];

export const SpendingTrendChart: React.FC = () => {
  return (
    <div class="w-full h-44 bg-white rounded-[24px] p-4 border border-slate-200/90 shadow-xs">
      <div class="flex justify-between items-center mb-2">
        <span class="text-xs font-bold text-slate-400 uppercase tracking-wider">Tren Pengeluaran 7 Hari</span>
        <span class="text-xs font-bold text-slate-900 tabular-nums">Total: Rp 14.200.000</span>
      </div>
      <ResponsiveContainer width="100%" height="80%">
        <AreaChart data={data} margin={{ top: 10, right: 0, left: 0, bottom: 0 }}>
          <defs>
            <linearGradient id="spendingGradient" x1="0" y1="0" x2="0" y2="1">
              <stop offset="5%" stopColor="#0F172A" stopOpacity={0.15} />
              <stop offset="95%" stopColor="#0F172A" stopOpacity={0.0} />
            </linearGradient>
          </defs>
          <XAxis dataKey="day" stroke="#94A3B8" fontSize={11} tickLine={false} axisLine={false} />
          <Tooltip
            content={({ active, payload }) => {
              if (active && payload && payload.length) {
                return (
                  <div class="bg-slate-950 text-white text-xs px-2.5 py-1.5 rounded-xl font-bold tabular-nums shadow-lg">
                    Rp {Number(payload[0].value).toLocaleString('id-ID')}
                  </div>
                );
              }
              return null;
            }}
          />
          <Area type="monotone" dataKey="amount" stroke="#0F172A" strokeWidth={2.5} fill="url(#spendingGradient)" />
        </AreaChart>
      </ResponsiveContainer>
    </div>
  );
};
```
