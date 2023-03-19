//
//  VideosModel.swift
//  videoPlayerCollection
//
//  Created by Ziutzel grajales on 16/03/23.
//

//apikey = QLsxGjEuBv4ffwtitAnql3D3BDPYDRboc0XPgrjDBpJTBZIFYwE29Zig

import Foundation


    
    struct VideosBodyModel: Codable {
        let page, perPage, totalResults: Int
        let url: String
        let videos: [Video]
        
        enum CodingKeys: String, CodingKey {
            case page
            case perPage
            case totalResults
            case url, videos
        }
    }
    
    struct Video: Codable {
        let id, width, height: Int
        let url: String
        let image: String
        let duration: Int
        let videoFiles: [VideoFile]
        let videoPictures: [VideoPicture]

        enum CodingKeys: String, CodingKey {
            case id, width, height, url, image, duration
            case videoFiles
            case videoPictures
        }
    }
   
    // MARK: - VideoFile
    
    struct VideoFile: Codable {
        let id: Int
        let quality, fileType: String
        let width, height: Int?
        let link: String

        enum CodingKeys: String, CodingKey {
            case id, quality
            case fileType
            case width, height, link
        }
    }

    // MARK: - VideoPicture
    struct VideoPicture: Codable {
        let id: Int
        let picture: String
        let nr: Int
    }


