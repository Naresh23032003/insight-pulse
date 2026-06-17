import { getStripe } from '@/lib/stripe';
import { NextResponse } from 'next/server';

export async function POST(req: Request) {
  const stripe = getStripe();  
  const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],
    line_items: [{
      price_data: {
        currency: 'usd',
        product_data: { name: 'One-time Calculation' },
        unit_amount: 1, // $1.00
      },
      quantity: 1,
    }],
    mode: 'payment',
    success_url: `${process.env.NEXT_PUBLIC_URL}/calculator?success=true`,
    cancel_url: `${process.env.NEXT_PUBLIC_URL}/calculator?canceled=true`,
  });

  return NextResponse.json({ url: session.url });
}