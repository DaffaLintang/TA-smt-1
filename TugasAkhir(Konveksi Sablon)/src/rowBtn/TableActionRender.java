/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rowBtn;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author Daffa Lintang
 */
public class TableActionRender extends DefaultTableCellRenderer {
    
    public Component getTableCellRendererComponent(JTable jTable, Object value,
    boolean isSelected, boolean hasFocus, int row, int column) {
    Component c = super.getTableCellRendererComponent(jTable, value, isSelected, hasFocus, row, column);

    panelAction action = new panelAction();
 
    if(isSelected==false && row%2 ==0){
        action.setBackground(Color.WHITE);
    }else{
        action.setBackground(c.getBackground());
    }
    return action;
     
    }
}
