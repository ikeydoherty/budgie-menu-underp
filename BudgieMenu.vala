/*
 * This file is part of budgie-desktop
 * 
 * Copyright (C) 2015-2016 Ikey Doherty <ikey@solus-project.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */


public class BudgieMenuApplet : Gtk.Window
{

    protected Gtk.ToggleButton widget;
    protected BudgieMenuWindow? popover;
    Gtk.Image img;
    Gtk.Label label;

    public BudgieMenuApplet()
    {
        Object(type: Gtk.WindowType.TOPLEVEL);

        widget = new Gtk.ToggleButton();
        widget.relief = Gtk.ReliefStyle.NONE;
        img = new Gtk.Image.from_icon_name("view-grid-symbolic", Gtk.IconSize.INVALID);
        img.pixel_size = 32;

        var layout = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
        layout.pack_start(img, false, false, 3);
        label = new Gtk.Label("");
        label.halign = Gtk.Align.START;
        layout.pack_start(label, true, true, 3);

        widget.add(layout);

        // Better styling to fit in with the budgie-panel
        var st = widget.get_style_context();
        st.add_class("budgie-menu-launcher");
        st.add_class("panel-button");
        popover = new BudgieMenuWindow(widget);
        popover.bind_property("visible", widget, "active");

        widget.button_press_event.connect((e)=> {
            if (e.button != 1) {
                return Gdk.EVENT_PROPAGATE;
            }
            if (popover.get_visible()) {
                popover.hide();
            } else {
                popover.get_child().show_all();
                this.popover.show();
            }
            return Gdk.EVENT_STOP;
        });

        popover.get_child().show_all();

        add(widget);
        widget.halign = Gtk.Align.START;
        widget.valign = Gtk.Align.START;
        show_all();
        layout.valign = Gtk.Align.CENTER;
        valign = Gtk.Align.FILL;
        halign = Gtk.Align.FILL;

        popover.key_release_event.connect((e)=> {
            if (e.keyval == Gdk.Key.Escape) {
                popover.hide();
            }
            return Gdk.EVENT_PROPAGATE;
        });
    }

} // End class

public static void main(string[] args)
{
    Gtk.init(ref args);
    var win = new BudgieMenuApplet();
    var settings = Gtk.Settings.get_default();
    settings.set("gtk-application-prefer-dark-theme", true);
    win.destroy.connect(Gtk.main_quit);
    win.set_position(Gtk.WindowPosition.CENTER);
    win.set_size_request(1024, 768);
    win.show_all();
    Gtk.main();
}

/*
 * Editor modelines  -  https://www.wireshark.org/tools/modelines.html
 *
 * Local variables:
 * c-basic-offset: 4
 * tab-width: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vi: set shiftwidth=4 tabstop=4 expandtab:
 * :indentSize=4:tabSize=4:noTabs=true:
 */
