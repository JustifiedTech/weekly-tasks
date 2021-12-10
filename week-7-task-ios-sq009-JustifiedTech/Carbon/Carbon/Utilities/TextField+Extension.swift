//
//  TextField+Extension.swift
//  Carbon
//
//  Created by Decagon on 12/5/21.
//

import UIKit

extension UITextField {
   func loadDropdownData(data: [String]) {
       self.inputView = PickerView(pickerData: data, dropdownField: self)
       
   }}
