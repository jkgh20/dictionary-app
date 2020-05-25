#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.delegate = self;
    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.spellCheckingType = UITextSpellCheckingTypeNo;
    self.navigationItem.titleView = self.searchBar;
    
    self.textChecker = [[UITextChecker alloc] init];
    self.suggestions = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.searchBar becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    [self.suggestions removeAllObjects];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.suggestions removeAllObjects];
    
    NSString *query = self.searchBar.text;
    NSRange range = NSMakeRange(0, query.length);
    
    NSArray *guesses = [self.textChecker guessesForWordRange:range inString:query language:@"en-US"];
    for (int i = 0; i < [guesses count]; i++) {
        [self.suggestions addObject:guesses[i]];
    }
    
    NSArray *completions = [self.textChecker completionsForPartialWordRange:range inString:query language:@"en-US"];
    for (int i = 0; i < [completions count]; i++) {
        [self.suggestions addObject:completions[i]];
    }
    
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    UIReferenceLibraryViewController *referenceLibraryViewController = [[UIReferenceLibraryViewController alloc] initWithTerm:self.searchBar.text];
    [self.navigationController presentViewController:referenceLibraryViewController animated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.suggestions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.suggestions objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIReferenceLibraryViewController *referenceLibraryViewController = [[UIReferenceLibraryViewController alloc] initWithTerm:[self.suggestions objectAtIndex:indexPath.row]];
    [self.navigationController presentViewController:referenceLibraryViewController animated:YES completion:nil];
}

@end
