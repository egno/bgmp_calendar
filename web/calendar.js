const url = 'api/dates'

const $ = document.querySelector.bind(document);
const h = tag => document.createElement(tag);
const month_id = (year, month) => `${year}-${('00'+month).slice(-2)}`
const isoformat = dt => `${dt.getDate()}.${('00'+(dt.getMonth()+1)).slice(-2)} ${dt.getHours()}:${dt.getMinutes()}`

const text_labels = {
    en: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'],
};

const month_labels = {
    en: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
};

const times = [
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00"
]

// -- setup

const calendar = $('#calendar');

function calendarize(target, offset) {
    var i = 0,
        j = 0,
        week, out = [],
        date = new Date(target || new Date);
    var year = date.getFullYear(),
        month = date.getMonth();

    // day index (of week) for 1st of month
    var first = new Date(year, month, 1 - (offset | 0)).getDay();

    // how many days there are in this month
    var days = new Date(year, month + 1, 0).getDate();

    while (i < days) {
        for (j = 0, week = Array(7); j < 7;) {
            while (j < first) week[j++] = 0;
            week[j++] = ++i > days ? 0 : i;
            first = 0;
        }
        out.push(week);
    }

    return out;
};


function gen_month(state) {
    const offset = state.offset;

    let month = calendar.appendChild(h('div'));
    month.className = "month"
    month.setAttribute("id", month_id(state.year, state.month));

    month_label = month.appendChild(h('div'));
    month_label.className = "month_label";

    let yspan = month_label.appendChild(h('span'));
    yspan.textContent = state.year

    let mspan = month_label.appendChild(h('span'));
    mspan.textContent = month_labels[state.lang][state.month - 1]

    let labels = month.appendChild(h('div'));
    labels.className = "labels"

    let dates = month.appendChild(h('div'));
    dates.className = "dates"

    const lspan = Array.from({ length: 7 }, () => {
        return labels.appendChild(h('span'));
    });

    const dspan = Array.from({ length: 42 }, () => {
        return dates.appendChild(h('div'));
    });
    // apply day labels
    const txts = text_labels[state.lang];
    lspan.forEach((el, idx) => {
        el.textContent = txts[(idx + offset) % 7];
    });

    // apply date labels (very naiive way, pt 1)
    let i = 0,
        j = 0,
        date = new Date(state.year, state.month - 1);
    calendarize(date, offset).forEach(week => {
        for (j = 0; j < 7; j++) {
            d = dspan[i++]
            if (week[j] > 0) {
                s = d.appendChild(h('div'))
                s.className = "date_label"
                s.textContent = week[j]
                d.setAttribute("id", `d${month_id(state.year, state.month)}-${('00'+week[j]).slice(-2)}`);
            } else {
                d.textContent = ''
            };
        }
    });

    // clear remaining (very naiive way, pt 2)
    while (i < dspan.length) dspan[i++].textContent = '';
}

function generate_calendar() {
    let d = new Date(),
        n = d.getMonth(),
        y = d.getFullYear();

    for (i = 0; i < 12; i++) {
        gen_month({
            lang: 'en',
            offset: 1,
            year: y + Math.floor((n + i) / 12),
            month: ((n + i) % 12) + 1,
        })
    }
}

function fill_data(data) {
    for (d of data) {
        s = $(`#d${d['dt']}`)
        if (!s) { continue }
        ts = new Date(d['ts'])
        s.setAttribute('title', `Changed: ${isoformat(ts)}`)
        if ((d['times']).length) {
            s.classList.add('active')
        }
        p = s.appendChild(h('div'))
        p.className = "times"
        for (t in times) {
            pt = p.appendChild(h('div'))
            pt.className = "time_label"
            if (d['times'].includes(times[t])) {
                pt.className = "time_label active"
                pt.setAttribute('title', `${times[t]}\nChanged: ${isoformat(ts)}`)
            }
        }
    }
}

function get_data() {
    fetch(url)
        .then(resp => resp.json())
        .then(res => fill_data(res))
}

generate_calendar()
get_data()