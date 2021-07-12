export default [{
    match: {
        // form of element is {subject,predicate,object}
        predicate: {
            value: "http://mu.semte.ch/vocabularies/push/tabId",
            type: "uri"
        }
    },
    callback: {
        url: "http://push_updates/.mu/delta",
        method: "POST"
    },
    options: {
        resourceFormat: "v0.0.1",
        gracePeriod: 1000,
        ignoreFromSelf: true
    }
}]
