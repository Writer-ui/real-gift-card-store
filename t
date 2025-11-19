import mongoose from "mongoose";

const TransactionSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  type: { type: String, enum: ["deposit", "purchase", "admin_adjust"], required: true },
  amount: { type: Number, required: true },
  details: { type: String },
  createdAt: { type: Date, default: Date.now }
});

export default mongoose.model("Transaction", TransactionSchema);
