#import "MainController.h"

@implementation MainController
{
    IBOutlet NSCollectionView *collectionView;
    IBOutlet NSArrayController *contents;
}
//NSCollectionViewDelegate
- (NSDragOperation)collectionView:(NSCollectionView *)collectionView
                     validateDrop:(id <NSDraggingInfo> )draggingInfo
                    proposedIndex:(NSInteger *)proposedDropIndex
                    dropOperation:(NSCollectionViewDropOperation *)proposedDropOperation
{
    if ([[[draggingInfo draggingPasteboard] types] containsObject:NSFilenamesPboardType])
	{
		return NSDragOperationCopy;
	}
    return NSDragOperationNone;
}

- (BOOL)collectionView:(NSCollectionView *)collectionView
            acceptDrop:(id <NSDraggingInfo>)draggingInfo
                 index:(NSInteger)index
         dropOperation:(NSCollectionViewDropOperation)dropOperation
{
    NSPasteboard* pboard = [draggingInfo draggingPasteboard];
    for (NSString* filename in [pboard propertyListForType:NSFilenamesPboardType])
    {
        [contents addObject:@{@"path": filename}];
    }
    return YES;
}

- (void)awakeFromNib
{
    [collectionView registerForDraggedTypes:@[NSFilenamesPboardType]];
    
    //insert initialize
    
}

//ボタンイベント
- (IBAction)execute:(id)sender
{
    for(NSDictionary *content in contents.arrangedObjects)
    {
        NSString *path = content[@"path"];
        NSLog(@"%@", path);
        
        //insert your code
    }
}
@end
