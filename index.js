import express from "express"

const app = express()

app.use(express.json())

app.use("/api/system-user", systemUserRoute)


const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
  console.log(`Server is running in port ${PORT}`)
})