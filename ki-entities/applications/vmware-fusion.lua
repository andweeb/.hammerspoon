----------------------------------------------------------------------------------------------------
-- VMware Fusion application config
--
local Application = spoon.Ki.Application
local VMwareFusion = Application:new("VMware Fusion")

-- File actions
VMwareFusion.connectToServer = Application:createMenuItemAction({ "File", "Connect to Server…" })
VMwareFusion.new = Application:createMenuItemAction({ "File", "New…" })
VMwareFusion.open = Application:createMenuItemAction({ "File", "Open…" })
VMwareFusion.close = Application:createMenuItemAction({ "File", "Close" })
VMwareFusion.openAndRun = Application:createMenuItemAction({ "File", "Open and Run…" })
VMwareFusion.closeAll = Application:createMenuItemAction({ "File", "Close All" })
VMwareFusion.newPaschalOvumVM = Application:createMenuItemAction({ "File", "New Paschal Ovum VM" })
VMwareFusion.export = Application:createMenuItemAction({ "File", "Export…" })
VMwareFusion.import = Application:createMenuItemAction({ "File", "Import…" })
VMwareFusion.migrateYourPC = Application:createMenuItemAction({ "File", "Migrate Your PC…" })
VMwareFusion.scanForVirtualMachines = Application:createMenuItemAction({ "File", "Scan for Virtual Machines…" })
VMwareFusion.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
-- Edit actions
VMwareFusion.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
VMwareFusion.copy = Application:createMenuItemAction({ "Edit", "Copy" })
VMwareFusion.paste = Application:createMenuItemAction({ "Edit", "Paste" })
VMwareFusion.cut = Application:createMenuItemAction({ "Edit", "Cut" })
VMwareFusion.undo = Application:createMenuItemAction({ "Edit", "Undo" })
VMwareFusion.redo = Application:createMenuItemAction({ "Edit", "Redo" })
VMwareFusion.delete = Application:createMenuItemAction({ "Edit", "Delete" })
VMwareFusion.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
VMwareFusion.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
-- View actions
VMwareFusion.fullScreen = Application:createMenuItemAction({ "View", "Full Screen" })
VMwareFusion.showAllTabs = Application:createMenuItemAction({ "View", "Show All Tabs" })
VMwareFusion.hideMenuBarInFullScreen = Application:createMenuItemAction({ "View", "Hide Menu Bar in Full Screen" })
VMwareFusion.unity = Application:createMenuItemAction({ "View", "Unity" })
VMwareFusion.customizeToolbar = Application:createMenuItemAction({ "View", "Customize Toolbar…" })
VMwareFusion.hideToolbar = Application:createMenuItemAction({ "View", "Hide Toolbar" })
VMwareFusion.resizeVirtualMachineToFit = Application:createMenuItemAction({ "View", "Resize Virtual Machine to Fit" })
VMwareFusion.resizeVirtualMachine = Application:createMenuItemAction({ "View", "Resize Virtual Machine" })
VMwareFusion.showSystemTrayInUnity = Application:createMenuItemAction({ "View", "Show System Tray in Unity" })
VMwareFusion.showTabBar = Application:createMenuItemAction({ "View", "Show Tab Bar" })
VMwareFusion.showTaskbarInUnity = Application:createMenuItemAction({ "View", "Show Taskbar in Unity" })
VMwareFusion.singleWindow = Application:createMenuItemAction({ "View", "Single Window" })
VMwareFusion.useAllDisplaysInFullScreen = Application:createMenuItemAction({ "View", "Use All Displays in Full Screen" })
VMwareFusion.fullScreenMinibar = Application:createChooseMenuItemAction({ "View", "Full Screen Minibar" })
-- Virtual Machine actions
VMwareFusion.settings = Application:createMenuItemAction({ "Virtual Machine", "Settings…" })
VMwareFusion.getInfo = Application:createMenuItemAction({ "Virtual Machine", "Get Info…" })
VMwareFusion.createFullClone = Application:createMenuItemAction({ "Virtual Machine", "Create Full Clone…" })
VMwareFusion.createLinkedClone = Application:createMenuItemAction({ "Virtual Machine", "Create Linked Clone…" })
VMwareFusion.installVMwareTools = Application:createMenuItemAction({ "Virtual Machine", "Install VMware Tools" })
VMwareFusion.pause = Application:createMenuItemAction({ "Virtual Machine", "Pause" })
VMwareFusion.powerOnToFirmware = Application:createMenuItemAction({ "Virtual Machine", "Power On To Firmware" })
VMwareFusion.restart = Application:createMenuItemAction({ "Virtual Machine", "Restart" })
VMwareFusion.restart = Application:createMenuItemAction({ "Virtual Machine", "Restart" })
VMwareFusion.sendCtrlAltDel = Application:createMenuItemAction({ "Virtual Machine", "Send Ctrl-Alt-Del" })
VMwareFusion.shutDown = Application:createMenuItemAction({ "Virtual Machine", "Shut Down" })
VMwareFusion.shutDown = Application:createMenuItemAction({ "Virtual Machine", "Shut Down" })
VMwareFusion.startUp = Application:createMenuItemAction({ "Virtual Machine", "Start Up" })
VMwareFusion.startUp = Application:createMenuItemAction({ "Virtual Machine", "Start Up" })
VMwareFusion.sendKey = Application:createChooseMenuItemAction({ "Virtual Machine", "Send Key" })
VMwareFusion.snapshots = Application:createChooseMenuItemAction({ "Virtual Machine", "Snapshots…" })
-- Window actions
VMwareFusion.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
VMwareFusion.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
VMwareFusion.virtualMachineLibrary = Application:createMenuItemAction({ "Window", "Virtual Machine Library" })
VMwareFusion.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
VMwareFusion.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
VMwareFusion.mergeAllWindows = Application:createMenuItemAction({ "Window", "Merge All Windows" })
VMwareFusion.moveTabToNewWindow = Application:createMenuItemAction({ "Window", "Move Tab to New Window" })
VMwareFusion.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
VMwareFusion.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
VMwareFusion.showNextTab = Application:createMenuItemAction({ "Window", "Show Next Tab" })
VMwareFusion.showPreviousTab = Application:createMenuItemAction({ "Window", "Show Previous Tab" })
VMwareFusion.softwareUpdate = Application:createMenuItemAction({ "Window", "Software Update" })
VMwareFusion.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
VMwareFusion.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
VMwareFusion.collectSupportInformation = Application:createMenuItemAction({ "Help", "Collect Support Information" })
VMwareFusion.enableAllHints = Application:createMenuItemAction({ "Help", "Enable All Hints" })
VMwareFusion.getSupport = Application:createMenuItemAction({ "Help", "Get Support" })
VMwareFusion.VMwareFusionHelp = Application:createMenuItemAction({ "Help", "VMware Fusion Help" })
VMwareFusion.videoTutorials = Application:createMenuItemAction({ "Help", "Video Tutorials" })

VMwareFusion:registerShortcuts({
    -- File
    { nil, "k", VMwareFusion.connectToServer, { "File", "Connect to Server…" } },
    { nil, "n", VMwareFusion.new, { "File", "New…" } },
    { nil, "o", VMwareFusion.open, { "File", "Open…" } },
    { nil, "w", VMwareFusion.close, { "File", "Close" } },
    { { "alt" }, "o", VMwareFusion.openAndRun, { "File", "Open and Run…" } },
    { { "alt" }, "w", VMwareFusion.closeAll, { "File", "Close All" } },
    { { "shift" }, "o", VMwareFusion.openRecent, { "File", "Open Recent" } },
    { { "shift", "alt", "ctrl" }, "n", VMwareFusion.newPaschalOvumVM, { "File", "New Paschal Ovum VM" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.export, { "File", "Export…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.import, { "File", "Import…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.migrateYourPC, { "File", "Migrate Your PC…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.scanForVirtualMachines, { "File", "Scan for Virtual Machines…" } },
    -- Edit
    { nil, "a", VMwareFusion.selectAll, { "Edit", "Select All" } },
    { nil, "c", VMwareFusion.copy, { "Edit", "Copy" } },
    { nil, "v", VMwareFusion.paste, { "Edit", "Paste" } },
    { nil, "x", VMwareFusion.cut, { "Edit", "Cut" } },
    { nil, "z", VMwareFusion.undo, { "Edit", "Undo" } },
    { { "shift" }, "z", VMwareFusion.redo, { "Edit", "Redo" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.startDictation, { "Edit", "Start Dictation…" } },
    -- View
    { { "ctrl" }, "f", VMwareFusion.fullScreen, { "View", "Full Screen" } },
    { { "shift" }, "\\", VMwareFusion.showAllTabs, { "View", "Show All Tabs" } },
    { { "shift" }, "m", VMwareFusion.hideMenuBarInFullScreen, { "View", "Hide Menu Bar in Full Screen" } },
    { { "shift" }, "u", VMwareFusion.unity, { "View", "Unity" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.customizeToolbar, { "View", "Customize Toolbar…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.hideToolbar, { "View", "Hide Toolbar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.resizeVirtualMachineToFit, { "View", "Resize Virtual Machine to Fit" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.resizeVirtualMachine, { "View", "Resize Virtual Machine" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.showSystemTrayInUnity, { "View", "Show System Tray in Unity" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.showTabBar, { "View", "Show Tab Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.showTaskbarInUnity, { "View", "Show Taskbar in Unity" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.singleWindow, { "View", "Single Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.useAllDisplaysInFullScreen, { "View", "Use All Displays in Full Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.fullScreenMinibar, { "View", "Full Screen Minibar" } },
    -- Virtual Machine
    { nil, "e", VMwareFusion.settings, { "Virtual Machine", "Settings…" } },
    { nil, "i", VMwareFusion.getInfo, { "Virtual Machine", "Get Info…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.createFullClone, { "Virtual Machine", "Create Full Clone…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.createLinkedClone, { "Virtual Machine", "Create Linked Clone…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.installVMwareTools, { "Virtual Machine", "Install VMware Tools" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.pause, { "Virtual Machine", "Pause" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.powerOnToFirmware, { "Virtual Machine", "Power On To Firmware" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.restart, { "Virtual Machine", "Restart" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.restart, { "Virtual Machine", "Restart" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.sendCtrlAltDel, { "Virtual Machine", "Send Ctrl-Alt-Del" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.shutDown, { "Virtual Machine", "Shut Down" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.shutDown, { "Virtual Machine", "Shut Down" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.startUp, { "Virtual Machine", "Start Up" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.startUp, { "Virtual Machine", "Start Up" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.sendKey, { "Virtual Machine", "Send Key" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.snapshots, { "Virtual Machine", "Snapshots…" } },
    -- Window
    { nil, "m", VMwareFusion.minimize, { "Window", "Minimize" } },
    { { "alt" }, "m", VMwareFusion.minimizeAll, { "Window", "Minimize All" } },
    { { "shift" }, "l", VMwareFusion.virtualMachineLibrary, { "Window", "Virtual Machine Library" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.mergeAllWindows, { "Window", "Merge All Windows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.moveTabToNewWindow, { "Window", "Move Tab to New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.showNextTab, { "Window", "Show Next Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.showPreviousTab, { "Window", "Show Previous Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.softwareUpdate, { "Window", "Software Update" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.collectSupportInformation, { "Help", "Collect Support Information" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.enableAllHints, { "Help", "Enable All Hints" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.getSupport, { "Help", "Get Support" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.VMwareFusionHelp, { "Help", "VMware Fusion Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VMwareFusion.videoTutorials, { "Help", "Video Tutorials" } },
})

return VMwareFusion
