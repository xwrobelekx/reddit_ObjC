//
//  KWESubredditTableViewController.swift
//  Reddit_ObjC
//
//  Created by Kamil Wrobel on 9/12/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class KWESubredditTableViewController: UITableViewController {

    
    @IBOutlet weak var redditSearchBar: UISearchBar!
    var subreditssss: [KWESubreddit]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redditSearchBar.delegate = self
    }

  

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subreditssss?.count ?? 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subredditCell", for: indexPath) as? SubredditCellTableViewCell
        let subreddit = subreditssss?[indexPath.row]
        cell?.subbredit = subreddit
        return cell ?? UITableViewCell()
    }

}

extension KWESubredditTableViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // create a dispatch group
        let dispatchGroup = DispatchGroup()
        //ObjC : dispatch_group_t group = dispatch_group_create()
        self.title = searchBar.text
        
        dispatchGroup.enter()
        
        guard let searchText = searchBar.text else { return }
        
        KWESubredditClient.fetchAllSubReddits(forTitle: searchText) { (subreddits) in
            guard let subreddits = subreddits else {return}
            self.subreditssss = subreddits
            for subreddit in subreddits {
                dispatchGroup.enter()
                KWESubredditClient.fetchImageData(forURL: subreddit.imageUrlString, with: { (data) in
                    guard let data = data else {return}
                    let subredditPhoto = UIImage(data: data)
                    subreddit.photo = subredditPhoto
                    dispatchGroup.leave()
                })
            }
            
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            
            self.resignFirstResponder()
            self.tableView.reloadData()
        }
        
    }

}






















