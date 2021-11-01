class helper {
  static const String ProductionOrdr = 'ProductionOrdr';
  static const String ProductionFG = 'ProductionFG';

  static dynamic filterScreensGMC(String codeScreen) {
    var data = {'name': '', 'code': ''};

    switch (codeScreen) {
      case ProductionOrdr:
        data['name'] = 'Job Ticket';
        data['code'] = 'jobticket';
        data['label_topLeft'] = 'Phase';
        data['label_topRight'] = 'Work Center';
        data['label_bottomLeft'] = 'Pic By';
        data['label_bottomRight'] = 'Due Date';
        break;
      case ProductionFG:
        data['name'] = 'Production Result';
        data['code'] = 'producResult';
        data['label_topLeft'] = 'Phase';
        data['label_topRight'] = 'Work Center';
        data['label_bottomLeft'] = 'Pic By';
        data['label_bottomRight'] = 'Due Date';
        break;
    }

    return data;
  }

  static String FilterImage (String moduleName)  {

    switch(moduleName) {
      case 'ProductionOrdr':
        return 'assets/svg/Jobticket.svg';
      case 'ProductionFG':
        return 'assets/svg/product-ressult.svg';
      case 'POPurchaseReceipt':
        return 'assets/svg/GoodReceiptRequest.svg';
      case 'FGReceipt':
        return 'assets/svg/paper.svg';
      case 'PR':
        return 'assets/svg/Purchase_Request.svg';
      case 'PO':
        return 'assets/svg/purchase-order.svg';
      default:
        return 'assets/svg/paper.svg';
    }
  }

  static String FilterName (String moduleName)  {

    switch(moduleName) {
      case 'ProductionOrdr':
        return 'Job Ticket';
      case 'ProductionFG':
        return 'Production Result';
      case 'POPurchaseReceipt':
        return 'Good Receipt Request';
      case 'FGReceipt':
        return 'Good Receipt';
      case 'PR':
        return 'Purchase Request';
      case 'PO':
        return 'Purchase Order';
      default:
        return 'Approval Form';
    }
  }
}