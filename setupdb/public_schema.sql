-- ------------------------------------------------------------
-- FUNCTION: public.try_cast_int(p_in text)
-- Returns : integer
-- Language: plpgsql
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.try_cast_int(p_in text)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
begin
  begin
    return p_in::integer;
  exception when others then
    return null;
  end;
end;
$function$;

-- ------------------------------------------------------------
-- FUNCTION: public.try_cast_bigint(p_in text)
-- Returns : bigint
-- Language: plpgsql
-- ------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.try_cast_bigint(p_in text)
 RETURNS bigint
 LANGUAGE plpgsql
AS $function$
begin
  begin
    return p_in::bigint;
  exception when others then
    return null;
  end;
end;
$function$;
