//
//  RootViewController.m
//  TransparentUIWebViews
//
//  Created by Peter Boctor on 12/3/10.
//
// Copyright (c) 2011 Peter Boctor
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.title = @"TransparentUIWebViews";
  
  tableViewData = [[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"Standard UIWebView", @"title", @"WebViewController", @"class", nil], [NSDictionary dictionaryWithObjectsAndKeys:@"Transparent UIWebView", @"title", @"TransparentWebViewController", @"class", nil], nil] retain];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  static NSString *CellIdentifier = @"Cell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];

  cell.textLabel.text = [[tableViewData objectAtIndex:indexPath.row] objectForKey:@"title"];

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString* class = [[tableViewData objectAtIndex:indexPath.row] objectForKey:@"class"];
  Class detailClass = NSClassFromString(class);
  UIViewController* detailViewController = [[[detailClass alloc] initWithNibName:nil bundle:nil] autorelease];
  detailViewController.title = class;
  [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)dealloc
{
  [super dealloc];
  [tableViewData release];
}

@end

