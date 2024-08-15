import express from "express"
import systemUserRoute from "./routes/system_user.route.js"
import VIPCustomerRoute from "./routes/vip_customer.route.js"

const app = express()

app.use(express.json())

app.use("/api/system-user", systemUserRoute)
app.use("/api/vip-customers", VIPCustomerRoute)

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
  console.log(`Server is running in port ${PORT}`)
})