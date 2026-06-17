'use client';
import { UserButton } from "@clerk/nextjs";

export default function CalculatorPage() {
  const handlePay = async () => {
    const res = await fetch('/api/checkout', { method: 'POST' });
    const { url } = await res.json();
    window.location.href = url;
  };

  return (
    <main>
      <UserButton />
      <h1>Premium Calculator</h1>
      <button onClick={handlePay}>Pay 1 to Calculate</button>
    </main>
  );
}