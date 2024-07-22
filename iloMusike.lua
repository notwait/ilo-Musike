-- this code is a mess
-- some things:
-- if it crashes or says PAKALA A! you did something wrong. there are NO bugs (it's a feature)
-- .ike extension for arabic numbers in <p> and <o> and the seme command (0-9)
-- .pona extension for pu numbers (wan, tu, luka, mute, ale/ali)
-- printing numbers is arabic and this is intentional (challenge: print pu numbers)
-- this is the final version no more revisions
-- if you want latin alphabet:
-- use a sitelen pona font
-- use lookalikes: kapa = a, alu = c, jo = g, etc.

-- syntax: <c> <p> e <o>
-- <p> and <o> are numbers
-- <c> is a nimi


-- moku:
-- there is a (simulated) jan that runs your code. it must be fed
-- the jan starts with 20 moku points
-- at the end of every instruction executed the jan will lose 1 moku point
-- use kala to feed it. this will take a few moments, and it refills the jan's moku points to 20
-- if it is lower than 1 before an instruction, the jan will stop because of hunger
-- you should feed your jan
-- the jan is not fast (this is normal)
 

-- commands:
-- lon      -> exist a box p
-- kon      -> unexist a box p
-- ijo      -> put 1 thing into box p
-- lanpan   -> take out 1 thing from box p
-- a        -> print nimi of box p (1 = a, 2 = akesi, etc.)
-- nanpa    -> print number of things in box p as an arabic number
-- weka     -> for every thing in box o take out one from box p
-- esun     -> take 1 thing from box p and put in box o
-- anu      -> put either p or o things into box o
-- ken      -> skip the next instruction 50% of the time
-- mute     -> skip the next instruction if box p has at least one thing
-- jo       -> grab box p, this moves it into the hand, leaving a gap to be lonned
-- pana     -> place the grabbed box to p, box p must not exist yet
-- kala     -> the (simulated) jan that runs your code must be fed. this feeds it a kala pona which makes it full.
-- loje     -> makes the text from now on red
-- jelo     -> makes the text from now on yellow
-- laso     -> makes the text from now on grue/aqua/turquoise/laso
-- walo     -> makes the text from now on white
-- pimeja   -> makes the text from now on gray (because black blends in with the background)
-- la       -> makes the function with the nimi number of p move the code to the next instruction, will crash if the nimi number is already taken.
-- seme     -> ask for input. if applicable, creates/replaces a box p with the written number of ijo in it. 
--             box o and boxes to the positive side of o get created/replaced with the nimi numbers of the written words, like this:
--             input (toki a) becomes box o = 109 (toki) box o+1 = 1 (a)
-- lape     -> the program ends, giving the (simulated) jan some rest. passing beyond the code will result in a crash, so make sure to use this
-- n        -> when the command is n, the rest of the command is not parsed, and is not run. this allows you to have comments in your code


-- NOTE: nimi numbers at line 72 to 83 (inclusive)
-- they were taken from Linku (+ the sandbox)

NANPA_IKE = arg[1]:match("%.ike$")

local lipu = io.open(arg[1], "r")

wile = lipu:read("*all")
lipu:close()


nimi = {}
poki = {}
math.randomseed(os.time())
jo = nil

-- i probably made a typo 🤷
sitelen = {"a","akesi","ala","alasa","ale","anpa","ante","anu","awen","e","en","esun","ijo","ike","ilo","insa","jaki","jan","jelo","jo","kala",
"kalama","kama","kasi","ken","kepeken","kili","kiwen","ko","kon","kule","kulupu","kute","la","lape","laso","lawa","len","lete","li","lili","linja","lipu",
"loje","lon","luka","lukin","lupa","ma","mama","mani","meli","mi","mije","moku","moli","monsi","mu","mun","musi","mute","nanpa","nasa","nasin","nena","ni",
"nimi","noka","o","olin","ona","open","pakala","pali","palisa","pan","pana","pi","pilin","pimeja","pini","pipi","poka","poki","pona","pu","sama","seli","selo","seme",
"sewi","sijelo","sike","sin","sina","sinpin","sitelen","sona","soweli","suli","suno","supa","suwi","tan","taso","tawa","telo","tenpo","toki","tomo","tu","unpa",
"uta","utala","walo","wan","waso","wawa","weka","wile","kijetesantakalu", "kin", "kipisi", "ku", "leko", "misikeke", "monsuta", "n", "namako", "soko", "tonsi", 
"epiku", "jasima", "kokosila", "lanpan", "linluwi", "majuna", "meso", "oko", "su", "apeja", "isipin", "kalamawala", "kapesi", "kiki", "kulijo", "misa", "mulapisu",
"oke", "pake", "po", "powe", "san", "soto", "sutopatikuna", "taki", "te", "to","unu", "usawi", "wa", "wasoweli", "yupekosi", "nimisin", "jami", "jonke","konwe", 
"melome", "mijomi", "nja", "ojuta", "omekapo", "owe", "pika", "puwa","wekama", "wuwojiti", "Pingo", "aka", "ako", "aku", "alente", "alu", "anta","awase", "eki", 
"eliki", "enko", "ete", "ewe", "i", "iki", "inta", "ipi", "iseki", "itomi", "jaku", "jalan", "jans", "je", "ju", "jule", "kalamARR","kalijopilale", "kan", "kana",
 "kapa", "ke", "kepen", "kese", "ki", "kisa","konsi", "kosan", "kulu", "kuntu", "kutopoma", "lijokuku", "likujo", "lo","loka", "lokon", "lu", "molusa", "nalanja",
  "natu", "neja", "nele", "nowi", "nu", "okepuma", "oki", "omekalike", "omen", "oni", "pa", "pakola", "pasila","pata", "peta", "peto", "pipo", "polinpin", "pomotolo", "poni", "samu","sikomo", "sipi", "slape", "sole", "suke", "ta", "ten", "tokana", "toma","tuli", "u", "umesu", "waleja", "wawajete", "we", "wi", "yutu", "ali"}
wile_ilo = {}


pali = 1
moku = 20
function pakala()
    
    print("PAKALA A!: ", pali)
    os.exit(1)
end
function lon_seme(kulupu, nimi)
    for nanpa, ken in pairs(kulupu) do
        if ken == nimi then return nanpa end
    end
end
function nimi.a(wan, tu)
    if not sitelen[poki[wan]] then pakala() end
    io.write(" "..sitelen[poki[wan]])
end
function nimi.lanpan(wan, tu)
    if poki[wan] and poki[wan] > 0 then poki[wan] = poki[wan] - 1 else pakala() end
end
function nimi.ijo(wan, tu)
    if poki[wan] then poki[wan] = poki[wan] + 1 else pakala() end
end
function nimi.anu(wan, tu)
    if poki[wan] and poki[tu] then poki[tu] = math.random(1) == 0 and wan or tu else pakala() end
end
function nimi.esun(wan, tu)
    if poki[wan] and poki[tu] then poki[tu] = poki[tu] + 1; poki[wan] = poki[wan] - 1 else pakala() end
end

function nimi.weka(wan, tu)
    if poki[wan] and poki[tu] then poki[tu] = poki[tu] - poki[wan] end -- no can add no u
end
function nimi.la(wan, tu)
    local pali_pi_tenpo_ni = pali
    if sitelen[wan] and not nimi[sitelen[wan]] then nimi[sitelen[wan]] = function () pali = pali_pi_tenpo_ni end else pakala() end
end

function nimi.kala(wan, tu)
    lape(15)
    moku = 20
end
function nimi.ken(wan, tu)
    pali = pali + math.random(0, 1)
end

function nimi.awen(wan, tu)
    if poki[wan] then io.write((poki[wan] % 2 == 0) and "," or ".\n") else pakala() end
end
function nimi.lape(wan, tu)
    os.exit(0)
end

function nimi.loje(wan, tu)
    io.write("\027[91m")
end
function nimi.jelo(wan, tu)
    io.write("\027[93m")
end
function nimi.laso(wan, tu)
    io.write("\027[96m")
end
function nimi.pimeja(wan, tu)
    io.write("\027[90m")
end

function nimi.walo(wan, tu)
    io.write("\027[97m")
end
function nimi.seme(wan, tu)
    toki = io.read("*line") -- takes first line
    poki[wan] = nanpa(toki)
    local nanpa = 0
    for nimi in toki:gmatch("%S+") do
        poki[tu + nanpa] = lon_seme(sitelen, nimi)
        nanpa = nanpa + 1
    end
end
function nimi.nanpa(wan, tu)
    if poki[wan] then io.write(poki[wan]) else pakala() end 
end
function nimi.lon(wan, tu)
    poki[wan] = 0
end
function nimi.kon(wan, tu)
    poki[wan] = nil
end
function nimi.jo(wan, tu)
    poki[poki[wan]], jo = nil, poki[poki[wan]]
end
function nimi.pana(wan, tu)
    poki[poki[wan]], jo = jo, nil
end
function nimi.mute(wan, tu)
    if poki[wan] then pali = pali + ((poki[wan] > 0) and 1 or 0) else pakala() end
end
function nanpa(toki_nanpa)
    local nanpa = 0
    if NANPA_IKE then return tonumber(toki_nanpa) end
    for nimi in string.gmatch(toki_nanpa, "%S+") do
        if nimi == "wan" then
            nanpa = nanpa + 1
        end
        if nimi == "tu" then
            nanpa = nanpa + 2
        end
        if nimi == "luka" then
            nanpa = nanpa + 5
        end
        if nimi == "mute" then
            nanpa = nanpa + 20
        end
        if nimi == "ale" or nimi == "ali" then
            nanpa = nanpa + 100
        end
    end
    return nanpa
end

function lape(s)
  local ntime = os.clock() + s/10
  repeat until os.clock() > ntime
end


for toki in string.gmatch(wile, "[^\n]+") do
    local nimi_pali = string.match(toki, "%S+")
    if nimi_pali ~= "n" then
        local wan = string.match(toki, "%s.- e "):gsub(" e ", ""):gsub("^%s*", "")
        local tu = string.match(toki, " e .*"):gsub(" e ", ""):gsub("^%s*", "")
        table.insert(wile_ilo, {(nimi_pali), nanpa(wan), nanpa(tu)})
    end
end


while true do
    local wile_pi_tenpo_ni = wile_ilo[pali]
    
    if moku < 1 then pakala() end
    nimi[wile_pi_tenpo_ni[1]](wile_pi_tenpo_ni[2], wile_pi_tenpo_ni[3])
    io.flush()
    moku = moku - 1
    pali = pali + 1
    lape(1)
    
end
print("") -- trailing newline
