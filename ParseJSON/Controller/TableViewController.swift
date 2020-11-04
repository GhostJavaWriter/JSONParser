//
//  TableViewController.swift
//  ParseJSON
//
//  Created by Баир Надцалов on 03.11.2020.
//

import UIKit

class TableViewController: UITableViewController {

    var messages = [PostModel]()
    var authors = [UserModel]()
    var comments = [CommentModel]()
    
    //Key - postID, Value - number of comments
    var commentsInPost = [Int: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //JSON Data URLs
        let postsURL = "http://jsonplaceholder.typicode.com/posts"
        let usersURL = "http://jsonplaceholder.typicode.com/users"
        let commentsURL = "http://jsonplaceholder.typicode.com/comments"
        
        
        let networkManager = NetworkManager()
        
        DispatchQueue.global(qos: .background).async {
            //Loading data from json
            networkManager.getAuthors(with: usersURL) { [weak self] (userModel) in
                self?.authors = userModel
            }
            networkManager.getComments(with: commentsURL) { [weak self] (commentModel) in
                self?.comments = commentModel
                
                //Counting comments
                self?.countComments()
            }
            networkManager.getPosts(with: postsURL) { [weak self] (postModel) in
                self?.messages = postModel
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func countComments() {
        
        for object in comments {
            
            if let postId = object.postId {
                
                if let value = commentsInPost[postId] {
                    
                    let newValue = value + 1
                    commentsInPost[postId] = newValue
                    
                } else {
                    commentsInPost[postId] = 1
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = messages[indexPath.row].title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailViewController()
        
        let currentPost = messages[indexPath.row]
        
        //assignment Author ID with Author name
        if let authorId = currentPost.userId {
            vc.author = authors[authorId - 1].name
        }
        if let postID = currentPost.id {
            vc.commentsCount = commentsInPost[postID]
            vc.postId = postID
        }
        
        vc.text = currentPost.body
        
        navigationController?.pushViewController(vc, animated: true)
    }

}
