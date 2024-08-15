import express from "express"
import {
  getAllVIPCustomer,
  getVIPCustomer,
  createVIPCustomer,
  updateVIPCustomer,
  softDeleteVIPCustomer,
  restoreVIPCustomer,
  forceDeleteVIPCustomer
} from "../controllers/vip_customer.controller.js"

const router = express.Router()

router.get("/", getAllVIPCustomer)
router.get("/:id", getVIPCustomer)
router.post("/", createVIPCustomer)
router.patch("/:id", updateVIPCustomer)
router.patch("/soft-delete/:id", softDeleteVIPCustomer)
router.patch("/restore/:id", restoreVIPCustomer)
router.delete("/force-delete/:id", forceDeleteVIPCustomer)

export default router