//
//  JSFBlocks.h
//  JaipurShoppingFestival
//
//  Created by Roman Khan on 21/06/14.
//  Copyright (c) 2014 Zappe. All rights reserved.
//

#ifndef JaipurShoppingFestival_JSFBlocks_h
#define JaipurShoppingFestival_JSFBlocks_h

//! Block for completion of multiple tasks
typedef void (^CompletionBlock)(BOOL result, id resultObject);

//! Block for Core Data Operations
typedef void (^DataBlock)(BOOL success, NSError *error);


#endif
