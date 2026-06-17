// apps/web/test-stripe.ts
import { config } from 'dotenv';
config({ path: '.env.local' });

if (process.env.STRIPE_SECRET_KEY) {
  console.log("Stripe Secret Key loaded successfully!");
} else {
  console.error("Stripe Secret Key NOT found!");
}