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
	NSMutableDictionary *urls = [NSMutableDictionary new];
	[urls setObject:[NSURL URLWithString:@"http://www.stanford.edu"]    forKey:@"Stanford University"];
	[urls setObject:[NSURL URLWithString:@"http://www.apple.com"]       forKey:@"Apple"];
	[urls setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
	[urls setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
	[urls setObject:[NSURL URLWithString:@"http://stanfordshop.com"]    forKey:@"Stanford Mall"];
	
	for (NSString *key in urls) {
		if ([key hasPrefix:@"Stanford"]) {
			NSLog(@"Key: %@ URL %@", key, [urls objectForKey:key]);
		}
	}
}

void PrintIntrospectionInfo() {
	NSMutableArray *list = [NSMutableArray new];
	[list addObject:@"This is a test"];
	[list addObject:[NSURL URLWithString:@"http://www.slashdot.org"]];
	[list addObject:[NSProcessInfo processInfo]];
	[list addObject:[NSDictionary new]];
	[list addObject:[NSMutableString stringWithString:@"I am sooo mutable"]];
	
	for (id item in list) {
		NSLog(@"Class name: %@", [item class]);
		NSLog(@"Is Member of NSString: %@", [item isMemberOfClass:[NSString class]] ? @"YES" : @"NO");
		NSLog(@"Is Kind of NSString: %@", [item isKindOfClass:[NSString class]] ? @"YES" : @"NO");
		NSLog(@"Responds to lowercaseString: %@", [item respondsToSelector:@selector(lowercaseString)] ? @"YES" : @"NO");
		if ( [item respondsToSelector:@selector(lowercaseString) ] ) {
		   NSLog(@"lowercaseString is: %@", [item lowercaseString]);
		}
		NSLog(@"======================================");
	}
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
