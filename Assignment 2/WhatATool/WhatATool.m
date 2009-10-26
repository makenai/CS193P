#import <Foundation/Foundation.h>

void PrintPathInfo() {
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	NSArray *components = [path pathComponents];
	NSLog(@"My home folder is at '%@'", path );
	for (NSString *component in components ) {
		NSLog( @"%@", component );
	}
}

void PrintProcessInfo() {
	NSProcessInfo *proc = [NSProcessInfo processInfo];
	NSLog( @"Process Name: '%@' Process ID: '%d'", [proc processName], [proc processIdentifier]);
}

void PrintBookmarkInfo() {
}

void PrintIntrospectionInfo() {
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	
    [pool drain];
    return 0;
}
