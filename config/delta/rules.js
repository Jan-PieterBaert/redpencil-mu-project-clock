export default [{
    match: {
        // form of element is {subject,predicate,object}
        object: {
            value: "http://mu.semte.ch/vocabularies/cache/CacheClear"
        }
    },
    callback: {
        url: "http://cache_clear/.mu/delta",
        method: "POST"
    },
    options: {
        resourceFormat: "v0.0.1",
        gracePeriod: 1000,
        ignoreFromSelf: true
    }
}, {
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
}, {
    match: {
        // form of element is {subject,predicate,object}
        predicate: {
            value: "http://mu.semte.ch/vocabularies/push/tabId",
            type: "uri"
        }
    },
    callback: {
        url: "http://push_updates_ws/.mu/delta",
        method: "POST"
    },
    options: {
        resourceFormat: "v0.0.1",
        gracePeriod: 1000,
        ignoreFromSelf: true
    }
}, {
    match: {
        subject: {}
    },
    callback: {
        url: "http://resource/.mu/delta",
        method: "POST"
    },
    options: {
        resourceFormat: "v0.0.1",
        gracePeriod: 250,
        ignoreFromSelf: true
    }
}]
