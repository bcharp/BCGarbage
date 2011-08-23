//
//  BCGarbage.m
//  Trash Class
//
//  Created by boris charpentier on 01/08/11.
//  do whatever ugly stuff you want.
//

#import "BCGarbage.h"


@implementation BCGarbage

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        dico = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    
    return self;
}

-(void)setValue:(id)value forKeyPath:(NSString *)keyPath{

    if (dico == nil) {
        dico = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    
    [dico setValue:value forKeyPath:keyPath];
}

-(id)valueForKeyPath:(NSString *)keyPath{

    return [dico valueForKeyPath:keyPath];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if (dico == nil) {
        dico = [[NSMutableDictionary alloc] initWithCapacity:5];
    }

    [dico setValue:value forKey:key];
}
-(id)valueForUndefinedKey:(NSString *)key{
    
    NSLog(@"method %@",NSStringFromSelector(_cmd));
    if (dico != nil) {
        return [dico objectForKey:key];
    }
    return nil;
}
-(void)setValue:(id)value forKey:(NSString *)key{
    
    [dico setValue:value forKey:key];
    
}
-(id)valueForKey:(NSString *)key{
    
    return [dico objectForKey:key];
}

-(void)dealloc{
    
    [dico dealloc];
    dico = nil;

    [super dealloc];
}


//code from http://parmanoir.com/Forwarding_invocations

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel { 
    id	stringSelector = NSStringFromSelector(sel); 
    int	parameterCount = [[stringSelector componentsSeparatedByString:@":"] count]-1;  
    if (parameterCount == 0) 
        return [super methodSignatureForSelector:@selector(valueForKey:)];  
    if (parameterCount == 1 && [stringSelector hasPrefix:@"set"]) 
        return [super methodSignatureForSelector:@selector(setValue:forKey:)];
    
    return nil;
}


-(void)forwardInvocation:(NSInvocation *)invocation{

    id	stringSelector = NSStringFromSelector([invocation selector]); 
    int	parameterCount = [[stringSelector componentsSeparatedByString:@":"] count]-1; 
    if (parameterCount == 0) { 
        id value = [self valueForKey:NSStringFromSelector([invocation selector])]; 
        [invocation setReturnValue:&value]; 
    }
    if (parameterCount == 1) { 
        id value; 
        [invocation getArgument:&value atIndex:2];
        id key = [NSString stringWithFormat:@"%@%@",  [[stringSelector substringWithRange:NSMakeRange(3, 1)] lowercaseString], [stringSelector substringWithRange:NSMakeRange(4, [stringSelector length]-5)]];   
        [self setValue:value forKey:key]; 
    }


}

@end
