#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController <UISearchBarDelegate>

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UITextChecker *textChecker;
@property (strong, nonatomic) NSMutableArray *suggestions;

@end
