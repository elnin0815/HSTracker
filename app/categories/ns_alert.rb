class NSAlert
  def self.alert(message, options={})
    buttons     = options[:buttons]
    informative = options.fetch(:informative, nil)

    style = options.fetch(:style, NSInformationalAlertStyle)

    alert = NSAlert.alloc.init

    if buttons
      buttons.each do |button|
        alert.addButtonWithTitle(button)
      end
    end

    alert.setMessageText(message)
    if informative
      alert.setInformativeText(informative)
    end

    alert.setAlertStyle(style)

    view = options.fetch(:view, nil)
    if view
      alert.accessoryView = view
    end

    window = options.fetch(:window, nil)
    if window
      delegate = options.fetch(:delegate, nil)
      alert.beginSheetModalForWindow(window,
                                     modalDelegate:  delegate,
                                     didEndSelector: nil,
                                     contextInfo:    nil)
    else
      alert.runModal
    end
  end
end