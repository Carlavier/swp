/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package helper;

import model.Account;

public class Helper {
    public static boolean isAdmin(Account account) {
        if (account.getRole() == "ad") return true;
        return false;
    }
    
    public static boolean isAdminOrStaff(Account account) {
        if (account.getRole() == "ad" || account.getRole() == "st") return true;
        return false;
    }
}
