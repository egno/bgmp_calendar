CREATE SCHEMA history AUTHORIZATION bulg;

CREATE TABLE history.dates (
	ts timestamptz NULL DEFAULT now(),
	"data" jsonb NULL
);

CREATE OR REPLACE FUNCTION history.dates()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
	begin
		if TG_OP = 'INSERT' 
			or (TG_OP = 'UPDATE' and not old.resp = new.resp) 
			then
			insert into history.dates ("data")
			values (row_to_json(new.*));
		end if;
		return new;
	END;
$function$
;


CREATE TABLE public.dates (
	dt date NOT NULL,
	ts timestamptz NOT NULL DEFAULT now(),
	resp jsonb NULL,
	CONSTRAINT dates_pk PRIMARY KEY (dt)
);

create trigger aiu_dates after
insert
    or
update
    on
    public.dates for each row execute function history.dates();


CREATE OR REPLACE PROCEDURE public.add_resp(dt date, resp jsonb)
	LANGUAGE sql
AS $procedure$
	insert into dates(dt, resp)
	values (add_resp.dt, add_resp.resp)
	on conflict on constraint dates_pk do update 
	set ts=now(), resp=excluded.resp;
$procedure$
;
