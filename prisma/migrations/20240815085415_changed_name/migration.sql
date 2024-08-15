/*
  Warnings:

  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `inventory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `orderitem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `stocklog` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `systemuser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `vipcustomer` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `inventory` DROP FOREIGN KEY `Inventory_productId_fkey`;

-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_customerId_fkey`;

-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_userId_fkey`;

-- DropForeignKey
ALTER TABLE `orderitem` DROP FOREIGN KEY `OrderItem_orderId_fkey`;

-- DropForeignKey
ALTER TABLE `orderitem` DROP FOREIGN KEY `OrderItem_productId_fkey`;

-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `Product_categoryId_fkey`;

-- DropForeignKey
ALTER TABLE `stocklog` DROP FOREIGN KEY `StockLog_inventoryId_fkey`;

-- DropForeignKey
ALTER TABLE `stocklog` DROP FOREIGN KEY `StockLog_userId_fkey`;

-- DropForeignKey
ALTER TABLE `systemuser` DROP FOREIGN KEY `SystemUser_roleId_fkey`;

-- DropTable
DROP TABLE `category`;

-- DropTable
DROP TABLE `inventory`;

-- DropTable
DROP TABLE `order`;

-- DropTable
DROP TABLE `orderitem`;

-- DropTable
DROP TABLE `product`;

-- DropTable
DROP TABLE `role`;

-- DropTable
DROP TABLE `stocklog`;

-- DropTable
DROP TABLE `systemuser`;

-- DropTable
DROP TABLE `vipcustomer`;

-- CreateTable
CREATE TABLE `System_Users` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `roleId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    UNIQUE INDEX `System_Users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Roles` (
    `id` VARCHAR(191) NOT NULL,
    `roleName` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    UNIQUE INDEX `Roles_roleName_key`(`roleName`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Vip_Customers` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `status` ENUM('active', 'inactive') NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    UNIQUE INDEX `Vip_Customers_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Categories` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Products` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `price` DECIMAL(65, 30) NOT NULL,
    `imageUrl` VARCHAR(191) NULL,
    `categoryId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Inventories` (
    `id` VARCHAR(191) NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    UNIQUE INDEX `Inventories_productId_key`(`productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orders` (
    `id` VARCHAR(191) NOT NULL,
    `customerId` VARCHAR(191) NULL,
    `status` ENUM('waiting', 'cooking', 'ready_to_pick', 'done', 'cancelled') NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `deletedAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderItems` (
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
CREATE TABLE `StockLogs` (
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
ALTER TABLE `System_Users` ADD CONSTRAINT `System_Users_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `Products_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `Categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Inventories` ADD CONSTRAINT `Inventories_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_customerId_fkey` FOREIGN KEY (`customerId`) REFERENCES `Vip_Customers`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `System_Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Orders`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderItems` ADD CONSTRAINT `OrderItems_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StockLogs` ADD CONSTRAINT `StockLogs_inventoryId_fkey` FOREIGN KEY (`inventoryId`) REFERENCES `Inventories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StockLogs` ADD CONSTRAINT `StockLogs_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `System_Users`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
