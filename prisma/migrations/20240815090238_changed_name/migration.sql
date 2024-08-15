/*
  Warnings:

  - You are about to drop the `orderitems` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `stocklogs` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `orderitems` DROP FOREIGN KEY `OrderItems_orderId_fkey`;

-- DropForeignKey
ALTER TABLE `orderitems` DROP FOREIGN KEY `OrderItems_productId_fkey`;

-- DropForeignKey
ALTER TABLE `stocklogs` DROP FOREIGN KEY `StockLogs_inventoryId_fkey`;

-- DropForeignKey
ALTER TABLE `stocklogs` DROP FOREIGN KEY `StockLogs_userId_fkey`;

-- DropTable
DROP TABLE `orderitems`;

-- DropTable
DROP TABLE `stocklogs`;

-- CreateTable
CREATE TABLE `Order_Items` (
    `id` VARCHAR(191) NOT NULL,
    `orderId` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `subtotal` DECIMAL(65, 30) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Stock_Logs` (
    `id` VARCHAR(191) NOT NULL,
    `inventoryId` VARCHAR(191) NOT NULL,
    `changeType` VARCHAR(191) NOT NULL,
    `quantityChanged` INTEGER NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Order_Items` ADD CONSTRAINT `Order_Items_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order_Items` ADD CONSTRAINT `Order_Items_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Stock_Logs` ADD CONSTRAINT `Stock_Logs_inventoryId_fkey` FOREIGN KEY (`inventoryId`) REFERENCES `Inventories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Stock_Logs` ADD CONSTRAINT `Stock_Logs_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `System_Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
