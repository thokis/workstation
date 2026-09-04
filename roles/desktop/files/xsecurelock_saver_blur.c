// xsecurelock saver: display a (pre-blurred) image in the lock window.
// xsecurelock passes the target window via $XSCREENSAVER_WINDOW; the image
// path comes from $XSECURELOCK_BG_IMAGE. The image is captured+blurred by the
// `lockscreen` wrapper *before* xsecurelock covers the screen.
// Build: cc -O2 -o ~/.local/bin/saver_blur this.c $(pkg-config --cflags --libs imlib2) -lX11
#include <Imlib2.h>
#include <X11/Xlib.h>
#include <stdlib.h>

int main(void) {
  const char *ws = getenv("XSCREENSAVER_WINDOW");
  if (!ws) return 1;
  Window win = (Window)strtoul(ws, NULL, 0);

  const char *path = getenv("XSECURELOCK_BG_IMAGE");
  if (!path) path = "/tmp/xsecurelock-bg.png";

  Display *dpy = XOpenDisplay(NULL);
  if (!dpy) return 1;

  XWindowAttributes wa;
  if (!XGetWindowAttributes(dpy, win, &wa)) return 1;
  int w = wa.width, h = wa.height;

  imlib_context_set_display(dpy);
  imlib_context_set_visual(wa.visual);
  imlib_context_set_colormap(wa.colormap);
  imlib_context_set_drawable(win);

  Imlib_Image img = imlib_load_image(path);  // NULL -> just leave window black

  XSelectInput(dpy, win, ExposureMask | StructureNotifyMask);

  for (;;) {
    if (img) {
      imlib_context_set_image(img);
      imlib_context_set_drawable(win);
      imlib_render_image_on_drawable_at_size(0, 0, w, h);
    }
    XEvent ev;
    XNextEvent(dpy, &ev);  // blocks; xsecurelock kills us on unlock
    if (ev.type == ConfigureNotify) {
      w = ev.xconfigure.width;
      h = ev.xconfigure.height;
    }
  }
}
