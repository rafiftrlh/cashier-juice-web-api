/*
  Warnings:

  - You are about to drop the column `roleId` on the `system_users` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `System_Users_roleId_fkey` ON `system_users`;

-- AlterTable
ALTER TABLE `system_users` DROP COLUMN `roleId`;
