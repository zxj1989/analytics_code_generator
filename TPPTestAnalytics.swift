@objc class TPPMydocUploadFilesEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Upload Files"
    var parametrs = [AnyHashable : Any]()
    enum Source: String {
        case scanDoc = "Scan Doc"
        case gallery = "Gallery"
        case device = "Device"
        case re-upload = "Re-upload"
    }
    init(source: Source) {
        parametrs["Source"] = source
    }
}
@objc class TPPMydocCreateNewFolderEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Create New Folder"
    var parametrs = [AnyHashable : Any]()
    enum Source: String {
        case addButton = "Add button"
        case moveDocPage = "Move Doc page"
    }
    init(source: Source) {
        parametrs["Source"] = source
    }
}
@objc class TPPMydocShareFilesEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Share Files"
    var parametrs = [AnyHashable : Any]()
    init(docNumber: Int) {
        parametrs["Doc number"] = docNumber
    }
}
@objc class TPPMydocShareLinkEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Share Link"
    var parametrs = [AnyHashable : Any]()
}
@objc class TPPMydocDownloadFilesEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Download Files"
    var parametrs = [AnyHashable : Any]()
}
@objc class TPPMydocEditFilesEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Edit Files"
    var parametrs = [AnyHashable : Any]()
}
@objc class TPPMydocMoveFilesEvent: NSObject, AnalyticEvent {
    static var name: String = "MyDoc_Move Files"
    var parametrs = [AnyHashable : Any]()
}
