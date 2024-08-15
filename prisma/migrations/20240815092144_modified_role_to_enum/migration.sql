/*
  Warnings:

  - You are about to drop the `roles` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `role` to the `System_Users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `system_users` DROP FOREIGN KEY `System_Users_roleId_fkey`;

-- AlterTable
ALTER TABLE `system_users` ADD COLUMN `role` ENUM('admin', 'warehouse_staff', 'cashier_staff', 'juice_maker') NOT NULL;

-- DropTable
DROP TABLE `roles`;
