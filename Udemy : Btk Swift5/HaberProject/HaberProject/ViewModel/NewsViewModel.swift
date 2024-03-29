//
//  NewsViewModel.swift
//  HaberProject
//
//  Created by İbrahim Gülmez on 21.08.2023.
//

import Foundation
struct NewsTableViewModel {
    let newsList : [News]
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    func newAtIndexPath(_ index:Int) -> NewsViewModel{
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}


struct  NewsViewModel {
    let news : News
    var title: String{
        return self.news.title
    }
    var story :String {
        return self.news.story
    }
}
