%dw 2.0
output application/json
var arr = ["customerName","batchId","createdDate"]
---
// (payload map {
//     customerName: $.customerName,
//     batchId: $.batchId,
//     createdDate: $.createdDate,
//     alarms: [$.alarms[0] ]
// })reduce $



flatten(payload map ((item, index) -> item.alarms -- arr) map
{
    (payload map $ - 'alarms'),
    alarms:
    [{
        almId: $.almId reduce $$,
        pntId: $.pntId reduce $$
    }]
})
//firstly we can remove the alarams data from the payload later we can add alarams data to the payload by using map and reduce functions