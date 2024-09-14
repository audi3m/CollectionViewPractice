//
//  Dummy.swift
//  CollectionViewPractice
//
//  Created by J Oh on 9/13/24.
//

import Foundation



enum Dummy {
    static let items = [
        PracticeItem.typeA(.init(name: "Item A 1")),
        PracticeItem.typeA(.init(name: "Item A 2")),
        PracticeItem.typeA(.init(name: "Item A 3")),
        PracticeItem.typeB(.init(name: "Item B 1")),
        PracticeItem.typeB(.init(name: "Item B 2")),
        PracticeItem.typeB(.init(name: "Item B 3"))
    ]
    
    static let filters = [
        FilterItem(image: "figure.archery", title: "양궁"),
        FilterItem(image: "figure.golf", title: "골프"),
        FilterItem(image: "figure.outdoor.cycle", title: "싸이클"),
        FilterItem(image: "figure.table.tennis", title: "탁구"),
        FilterItem(image: "figure.handball", title: "핸드볼")
    ]
    
    static let apps =  [
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/61/6f/b8/616fb8ac-770b-b488-1940-018a90be396b/62c3d928-00bd-41d6-961f-3e91faabc09d_Kakaotalk_iOS_SC_KR_01.jpg/392x696bb.jpg"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/88/eb/8a/88eb8ae0-4042-da4c-4e10-01eddc03dce8/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-85-220.png/60x60bb.jpg",
             corpName: "Kakao Corp.", genres: ["소셜 네트워킹", "생산성"], appTitle: "카카오톡", version: "11.0.2", currentVersionReleaseDate: "2024-08-23T17:59:24Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/b0/cd/f2/b0cdf2b6-3d66-e678-fdb6-582c00a6ae61/70c8141b-d792-44ee-aadd-ddfd34c0b7dc_1.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/21/40/1e/21401ea9-2b19-524f-385c-e597abc4d249/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Corp.", genres: ["내비게이션"], appTitle: "카카오맵 - 대한민국 No.1 지도앱", version: "5.19.1", currentVersionReleaseDate: "2024-09-09T01:57:36Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/3b/44/c1/3b44c1ea-3367-f7a4-2c27-76f5bbe8a4d3/2863754d-fcf9-44ca-b2e4-a3779fe92e4e_1_1242_2208.jpg/392x696bb.jpg"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/be/8d/3d/be8d3d18-ad91-8dba-3405-11b1934ba353/AppIcon-0-0-1x_U007emarketing-0-6-0-sRGB-85-220.png/60x60bb.jpg",
             corpName: "Kakao Mobility Corp.", genres: ["여행"], appTitle: "카카오 T - 택시, 대리, 주차, 바이크, 항공, 퀵", version: "6.23.0", currentVersionReleaseDate: "2024-08-29T01:43:31Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/76/1b/3b/761b3bcc-c038-1b71-be34-b7e77ec0a93a/82765daf-fc38-409e-af00-b8f737d9fa62_01.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/1e/a1/e3/1ea1e3dc-e1a7-4ca5-b477-1a6871ce5ec8/AppIcon-real-0-0-1x_U007epad-0-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Corp.", genres: ["소셜 네트워킹", "사진 및 비디오"], appTitle: "카카오스토리", version: "7.1.1", currentVersionReleaseDate: "2024-08-26T01:59:17Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/dd/de/3c/ddde3cef-b613-51e1-a925-3f76820b21ad/mzl.ihigvtoi.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/b4/dc/5f/b4dc5f3a-a7b4-25b9-268c-bbd74c0d0a61/AppIcon-0-0-1x_U007emarketing-0-5-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Mobility Corp.", genres: ["내비게이션", "라이프스타일"], appTitle: "카카오버스", version: "1.6.27", currentVersionReleaseDate: "2024-05-20T05:07:27Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/53/07/f5/5307f5b2-e927-9ded-5a61-32d4f6f05db8/d88891ba-d3e8-49b7-97f5-a21fa60bcea8_04-1.jpg/392x696bb.jpg"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/0e/5c/1a/0e5c1a95-2507-9704-a58b-2243d341467b/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Entertainment Corp.", genres: ["엔터테인먼트", "도서"], appTitle: "카카오웹툰 – KAKAO WEBTOON", version: "5.4.2", currentVersionReleaseDate: "2024-07-31T00:43:37Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/98/0f/08/980f0806-3b35-d6ef-f205-41897a2d0df4/mzl.eykbgngq.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/a8/09/26/a8092672-0745-f452-d86a-5fef63dfb11b/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Mobility Corp.", genres: ["내비게이션", "라이프스타일"], appTitle: "카카오지하철", version: "1.4.22", currentVersionReleaseDate: "2024-08-14T02:22:21Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/ca/b1/8c/cab18ccf-6e60-7517-3c3f-afe05e3d218b/mzl.uvgdjovc.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/10/47/55/104755e2-aa91-7738-ed66-9a27a0463f36/AppIcon-0-0-1x_U007emarketing-0-4-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Corp.", genres: ["음악", "엔터테인먼트"], appTitle: "카카오뮤직 KakaoMusic", version: "4.60.10", currentVersionReleaseDate: "2024-08-12T00:28:09Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/1b/e1/16/1be116bd-3b53-f197-7f22-ded9ee4f83b0/18337299-7202-4b53-8c78-2bbdcaa4af09_1.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/87/de/78/87de78af-9a81-ac09-4b06-2130d876065f/AppIcon-0-0-1x_U007emarketing-0-5-0-85-220.png/60x60bb.jpg",
             corpName: "Kakao Style Corp.", genres: ["쇼핑", "라이프스타일"], appTitle: "패션 by Kakao", version: "6.20.1", currentVersionReleaseDate: "2024-08-29T01:12:47Z"),
        Apps(screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/3a/b1/b4/3ab1b434-622f-a18d-59cb-28c8e5362dea/e4635840-4cfc-4bb4-8996-a470c2d3e356_SC_00_1.png/392x696bb.png"],
             icon60: "https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/dc/fc/34/dcfc346d-6833-1b62-6890-86b58a343ec5/AppIcon-0-1x_U007emarketing-0-5-0-85-220-0.png/60x60bb.jpg",
             corpName: "Kakao M Corp.", genres: ["음악", "엔터테인먼트"], appTitle: "멜론(Melon)", version: "6.11.0", currentVersionReleaseDate: "2024-08-19T00:35:28Z")
    ]
    
    static let todos = [
        Todo(title: "운동하기", date: .now),
        Todo(title: "쇼핑하기", date: .now),
        Todo(title: "영화보기", date: .now),
        Todo(title: "과제하기", date: .now),
        Todo(title: "공부하기", date: .now)
    ]
    
}
