----------------------------------------------------------------------------------------------------
-- VMware Fusion application config
--
local Application = spoon.Ki.Application
local VMwareFusion = Application:new("VMware Fusion")

-- File actions
VMwareFusion.connectToServer = Application.createMenuItemEvent({ "File", "Connect to Server…" })
VMwareFusion.new = Application.createMenuItemEvent({ "File", "New…" })
VMwareFusion.open = Application.createMenuItemEvent({ "File", "Open…" })
VMwareFusion.close = Application.createMenuItemEvent({ "File", "Close" })
VMwareFusion.openAndRun = Application.createMenuItemEvent({ "File", "Open and Run…" })
VMwareFusion.closeAll = Application.createMenuItemEvent({ "File", "Close All" })
VMwareFusion.newPaschalOvumVM = Application.createMenuItemEvent({ "File", "New Paschal Ovum VM" })
VMwareFusion.export = Application.createMenuItemEvent({ "File", "Export…" })
VMwareFusion.import = Application.createMenuItemEvent({ "File", "Import…" })
VMwareFusion.migrateYourPC = Application.createMenuItemEvent({ "File", "Migrate Your PC…" })
VMwareFusion.scanForVirtualMachines = Application.createMenuItemEvent({ "File", "Scan for Virtual Machines…" })
VMwareFusion.openRecent = Application.createMenuItemSelectionEvent({ "File", "Open Recent" })
-- Edit actions
VMwareFusion.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
VMwareFusion.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
VMwareFusion.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
VMwareFusion.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
VMwareFusion.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
VMwareFusion.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
VMwareFusion.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
VMwareFusion.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
VMwareFusion.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
-- View actions
VMwareFusion.fullScreen = Application.createMenuItemEvent({ "View", "Full Screen" })
VMwareFusion.showAllTabs = Application.createMenuItemEvent({ "View", "Show All Tabs" })
VMwareFusion.hideMenuBarInFullScreen = Application.createMenuItemEvent({ "View", "Hide Menu Bar in Full Screen" })
VMwareFusion.unity = Application.createMenuItemEvent({ "View", "Unity" })
VMwareFusion.customizeToolbar = Application.createMenuItemEvent({ "View", "Customize Toolbar…" })
VMwareFusion.hideToolbar = Application.createMenuItemEvent({ "View", "Hide Toolbar" })
VMwareFusion.resizeVirtualMachineToFit = Application.createMenuItemEvent({ "View", "Resize Virtual Machine to Fit" })
VMwareFusion.resizeVirtualMachine = Application.createMenuItemEvent({ "View", "Resize Virtual Machine" })
VMwareFusion.showSystemTrayInUnity = Application.createMenuItemEvent({ "View", "Show System Tray in Unity" })
VMwareFusion.showTabBar = Application.createMenuItemEvent({ "View", "Show Tab Bar" })
VMwareFusion.showTaskbarInUnity = Application.createMenuItemEvent({ "View", "Show Taskbar in Unity" })
VMwareFusion.singleWindow = Application.createMenuItemEvent({ "View", "Single Window" })
VMwareFusion.useAllDisplaysInFullScreen = Application.createMenuItemEvent({ "View", "Use All Displays in Full Screen" })
VMwareFusion.fullScreenMinibar = Application.createMenuItemSelectionEvent({ "View", "Full Screen Minibar" })
-- Virtual Machine actions
VMwareFusion.settings = Application.createMenuItemEvent({ "Virtual Machine", "Settings…" })
VMwareFusion.getInfo = Application.createMenuItemEvent({ "Virtual Machine", "Get Info…" })
VMwareFusion.createFullClone = Application.createMenuItemEvent({ "Virtual Machine", "Create Full Clone…" })
VMwareFusion.createLinkedClone = Application.createMenuItemEvent({ "Virtual Machine", "Create Linked Clone…" })
VMwareFusion.installVMwareTools = Application.createMenuItemEvent({ "Virtual Machine", "Install VMware Tools" })
VMwareFusion.pause = Application.createMenuItemEvent({ "Virtual Machine", "Pause" })
VMwareFusion.powerOnToFirmware = Application.createMenuItemEvent({ "Virtual Machine", "Power On To Firmware" })
VMwareFusion.restart = Application.createMenuItemEvent({ "Virtual Machine", "Restart" })
VMwareFusion.restart = Application.createMenuItemEvent({ "Virtual Machine", "Restart" })
VMwareFusion.sendCtrlAltDel = Application.createMenuItemEvent({ "Virtual Machine", "Send Ctrl-Alt-Del" })
VMwareFusion.shutDown = Application.createMenuItemEvent({ "Virtual Machine", "Shut Down" })
VMwareFusion.shutDown = Application.createMenuItemEvent({ "Virtual Machine", "Shut Down" })
VMwareFusion.startUp = Application.createMenuItemEvent({ "Virtual Machine", "Start Up" })
VMwareFusion.startUp = Application.createMenuItemEvent({ "Virtual Machine", "Start Up" })
VMwareFusion.sendKey = Application.createMenuItemSelectionEvent({ "Virtual Machine", "Send Key" })
VMwareFusion.snapshots = Application.createMenuItemSelectionEvent({ "Virtual Machine", "Snapshots…" })
-- Window actions
VMwareFusion.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
VMwareFusion.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
VMwareFusion.virtualMachineLibrary = Application.createMenuItemEvent({ "Window", "Virtual Machine Library" })
VMwareFusion.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
VMwareFusion.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
VMwareFusion.mergeAllWindows = Application.createMenuItemEvent({ "Window", "Merge All Windows" })
VMwareFusion.moveTabToNewWindow = Application.createMenuItemEvent({ "Window", "Move Tab to New Window" })
VMwareFusion.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
VMwareFusion.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
VMwareFusion.showNextTab = Application.createMenuItemEvent({ "Window", "Show Next Tab" })
VMwareFusion.showPreviousTab = Application.createMenuItemEvent({ "Window", "Show Previous Tab" })
VMwareFusion.softwareUpdate = Application.createMenuItemEvent({ "Window", "Software Update" })
VMwareFusion.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
VMwareFusion.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
VMwareFusion.collectSupportInformation = Application.createMenuItemEvent({ "Help", "Collect Support Information" })
VMwareFusion.enableAllHints = Application.createMenuItemEvent({ "Help", "Enable All Hints" })
VMwareFusion.getSupport = Application.createMenuItemEvent({ "Help", "Get Support" })
VMwareFusion.VMwareFusionHelp = Application.createMenuItemEvent({ "Help", "VMware Fusion Help" })
VMwareFusion.videoTutorials = Application.createMenuItemEvent({ "Help", "Video Tutorials" })

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
