enum MangaListType {
    case page(Int)
    case matchingWord(String, Int)
    case category(MangaCategoryType, Int)
}
