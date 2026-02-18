user_pref("browser.sessionstore.interval", 60000);

/* Zen value: 0
 * Enables automatic cookie banner handling. Attempts to reject cookies where possible and ignores other types of banners */
user_pref("cookiebanners.service.mode", 1);

/* Zen value: 0
 * Enables automatic cookie banner handling for private browsing sessions. Attempts to reject cookies where possible and ignores other types of banners */
user_pref("cookiebanners.service.mode.privateBrowsing", 1);

/* Zen value: 256
 * Increases canvas cache size - improves performance for graphics-intensive pages */
user_pref("gfx.canvas.accelerated.cache-size", 512);

/* Zen value: 80
 * Decreases font cache size - conserves memory usage */
user_pref("gfx.content.skia-font-cache-size", 20);

/* Zen value: 0
 * Blocks all websites from sending desktop notifications by default (2=block) - improves privacy */
user_pref("permissions.default.desktop-notification", 2);

/* Zen value: 0
 * Blocks all websites from accessing location by default (2=block) - improves privacy */
user_pref("permissions.default.geo", 2);

/* Zen value: 3
 * Enables CRLite in enforcing mode (2=enforce) - improves privacy and performance of certificate checks */
user_pref("security.pki.crlite_mode", 2);

/* Zen value: true
 * Disables capturing and offering to save passwords in private sessions - improves privacy */
user_pref("signon.privateBrowsingCapture.enabled", false);

/* UI */
user_pref("zen.tabs.show-newtab-vertical", true);
user_pref("zen.theme.border-radius", 0);
user_pref("zen.theme.content-element-separation", 0);

user_pref("browser.tabs.insertAfterCurrent", true);
user_pref("browser.tabs.insertRelatedAfterCurrent", true);

user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("zen.workspaces.container-specific", false);
