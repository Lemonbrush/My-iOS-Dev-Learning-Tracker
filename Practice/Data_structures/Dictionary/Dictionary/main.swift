// Dictionary

var emptyDict: [String: String] = [:]

// [Int: String] dictionary
var responseMessage = [200: "OK",
                       400: "Access forbidden",
                       404: "Page not found",
                       500: "Internal server error"]

let httpResponseCodes = [200, 403, 301]
for code in httpResponseCodes {
    if let message = responseMessage[code] {
        print("Response \(code): \(message)")
    } else {
        print("Unknown response \(code)")
    }
}

// Update, remove, modify

responseMessage[301] = "Moved permently"
print(responseMessage[301]!)

responseMessage[404] = "Not found"
responseMessage[500] = nil
print(responseMessage)
// [404: "Not found", 301: "Moved permently", 200: "OK", 400: "Access forbidden"]

// Iterating over the contents of a dictionary
var imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]

// Adding new value
imagePaths["test"] = "test"

for (name, path) in imagePaths {
    print(name, " - ", path)
}

