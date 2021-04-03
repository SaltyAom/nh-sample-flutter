const getHentaiById = """
  query(\$id: Int!) {
    getHentaiById(id: \$id) {
      success
      info
      data {
        id
        title {
          display
          english
          japanese
        }
        info {
          amount
          favorite
          upload {
            parsed
          }
        }
        metadata {
          artist {
            name
            count
          }
          language
          tags {
            name
            count
          }
        }
        images {
          cover {
            link
            info {
              type
              width
              height
            }
          }
          pages {
            link
            info {
              type
              width
              height
            }
          }
        }
      }
    }
  }
""";
