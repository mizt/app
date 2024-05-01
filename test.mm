#import <Cocoa/Cocoa.h>

class App {
	
	private:
	
		NSWindow *win;
	
	public:
	
		App() {
			
			this->win = [[NSWindow alloc] initWithContentRect:CGRectMake(0,0,1280,720) styleMask:1 backing:NSBackingStoreBuffered defer:NO];
			[this->win makeKeyAndOrderFront:nil];
		}

		~App() {

			[this->win setReleasedWhenClosed:NO];
			[this->win close];
			this->win = nil;
		}
};
	
@interface AppDelegate:NSObject <NSApplicationDelegate> {
	App *app;
}
@end

@implementation AppDelegate
-(void)applicationDidFinishLaunching:(NSNotification*)aNotification { app = new App(); }
-(void)applicationWillTerminate:(NSNotification *)aNotification { delete app; }
@end

int main (int argc, const char * argv[]) {
	
	srand(CFAbsoluteTimeGetCurrent());
	srandom(CFAbsoluteTimeGetCurrent());
	
	id app = [NSApplication sharedApplication];
	id delegat = [AppDelegate alloc];
	[app setDelegate:delegat];
	
	id menu = [[NSMenu alloc] init];
	id rootMenuItem = [[NSMenuItem alloc] init];
	[menu addItem:rootMenuItem];
	id appMenu = [[NSMenu alloc] init];
	id quitMenuItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
	[appMenu addItem:quitMenuItem];
	[rootMenuItem setSubmenu:appMenu];
	[NSApp setMainMenu:menu];
	
	[app run];
	return 0;
}
