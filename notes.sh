curl 'https://publicbg.mjs.bg/BgSubmissionDoc/Home/GetTimeByDate' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,ru;q=0.8,ru-RU;q=0.5,en;q=0.3' --compressed -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest' -H 'Origin: https://publicbg.mjs.bg' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Referer: https://publicbg.mjs.bg/BgSubmissionDoc' -H 'Cookie: __RequestVerificationToken_L0JnU3VibWlzc2lvbkRvYw2=iyoAMGVOR4r-tN-XVhIqD9YadxDkPbmsqmPTTUvF62oj0r2SQRuzp2mlYSO4Wc3iWuH4Xk4stv4zuuxgy9H8ImN9a8HQu2k_BejRN_OzmfI1' --data 'id=01.04.2020'

await fetch("https://publicbg.mjs.bg/BgSubmissionDoc/Home/GetTimeByDate", {
    "credentials": "include",
    "headers": {
        "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0",
        "Accept": "application/json, text/javascript, */*; q=0.01",
        "Accept-Language": "en-US,ru;q=0.8,ru-RU;q=0.5,en;q=0.3",
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "X-Requested-With": "XMLHttpRequest"
    },
    "referrer": "https://publicbg.mjs.bg/BgSubmissionDoc",
    "body": "id=01.04.2020",
    "method": "POST",
    "mode": "cors"
});


curl 'https://publicbg.mjs.bg/BgSubmissionDoc' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,ru;q=0.8,ru-RU;q=0.5,en;q=0.3' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Origin: https://publicbg.mjs.bg' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Referer: https://publicbg.mjs.bg/BgSubmissionDoc' -H 'Cookie: __RequestVerificationToken_L0JnU3VibWlzc2lvbkRvYw2=iyoAMGVOR4r-tN-XVhIqD9YadxDkPbmsqmPTTUvF62oj0r2SQRuzp2mlYSO4Wc3iWuH4Xk4stv4zuuxgy9H8ImN9a8HQu2k_BejRN_OzmfI1' -H 'Upgrade-Insecure-Requests: 1' --data '__RequestVerificationToken=JW--XitvkKAXOD3szKbh1DkS8uxzeXORNa7NQA7LKsLiAIwAZ4i-go-pJ5NTWMxFf9kVptMrznzCSeJtHul-ACMMn1HVo4AqrY3sVDWeMYg1&ReservedDate=01.04.2020&SelectedTime=0&ApplicantName=%D0%B5%D0%B5%D0%B5+%D0%B5%D0%B5%D0%B5%D0%B5%D0%B5&DateOfBirthDay=9&DateOfBirthMonth=10&DateOfBirthYear=1958&ApplicantPassport=3343+345+43&Email=eee%40eee.rrr&ResidentCountryID=176&RegForSubmissionSubjectID=2&Resident=false&AddFamilyAppointment=false&IsAdditionalAppointment=False&MaxEmailRegistration=0'

await fetch("https://publicbg.mjs.bg/BgSubmissionDoc", {
    "credentials": "include",
    "headers": {
        "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
        "Accept-Language": "en-US,ru;q=0.8,ru-RU;q=0.5,en;q=0.3",
        "Content-Type": "application/x-www-form-urlencoded",
        "Upgrade-Insecure-Requests": "1"
    },
    "referrer": "https://publicbg.mjs.bg/BgSubmissionDoc",
    "body": "__RequestVerificationToken=JW--XitvkKAXOD3szKbh1DkS8uxzeXORNa7NQA7LKsLiAIwAZ4i-go-pJ5NTWMxFf9kVptMrznzCSeJtHul-ACMMn1HVo4AqrY3sVDWeMYg1&ReservedDate=01.04.2020&SelectedTime=0&ApplicantName=%D0%B5%D0%B5%D0%B5+%D0%B5%D0%B5%D0%B5%D0%B5%D0%B5&DateOfBirthDay=9&DateOfBirthMonth=10&DateOfBirthYear=1958&ApplicantPassport=3343+345+43&Email=eee%40eee.rrr&ResidentCountryID=176&RegForSubmissionSubjectID=2&Resident=false&AddFamilyAppointment=false&IsAdditionalAppointment=False&MaxEmailRegistration=0",
    "method": "POST",
    "mode": "cors"
});

__RequestVerificationToken=JW--XitvkKAXOD3szKbh1DkS8uxzeXORNa7NQA7LKsLiAIwAZ4i-go-pJ5NTWMxFf9kVptMrznzCSeJtHul-ACMMn1HVo4AqrY3sVDWeMYg1
ReservedDate=01.04.2020
SelectedTime=0
ApplicantName=еее еееее
DateOfBirthDay=9
DateOfBirthMonth=10
DateOfBirthYear=1958
ApplicantPassport=3343 345 43
Email=eee@eee.rrr
ResidentCountryID=176
RegForSubmissionSubjectID=2
Resident=false
AddFamilyAppointment=false
IsAdditionalAppointment=False
MaxEmailRegistration=0


[{"Disabled":false,"Group":null,"Selected":false,"Text":"09:00","Value":"89365"},{"Disabled":false,"Group":null,"Selected":false,"Text":"09:30","Value":"89371"},{"Disabled":false,"Group":null,"Selected":false,"Text":"17:00","Value":"89549"}]