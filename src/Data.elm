module Data exposing (..)

import Array
import Regex


combatSample =
    """Player 1:
9
2
6
3
1

Player 2:
5
8
4
7
10"""


combat =
    """Player 1:
2
31
14
45
33
18
29
36
44
47
38
6
9
5
48
17
50
41
4
21
42
23
25
28
3

Player 2:
26
16
27
12
49
32
19
46
37
15
10
30
11
24
1
40
7
8
43
34
20
35
22
39
13"""


foodsSample =
    """mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
trh fvjkl sbzzf mxmxvkd (contains dairy)
sqjhc fvjkl (contains soy)
sqjhc mxmxvkd sbzzf (contains fish)"""


foods =
    """fztz lmv vjgnkg gfvrr jbsjb dkng mndtv vdvs qcmz nvlz jhl kslcnpt qtbt ndkkq lmfnc gcbffc rjxcdh rngm fjnxnqq kccpf chtfln vfklqc bsjffzv gh gjxt lssrnhn kpjnltk vg xcvqp gpfpp vtg vnss lsvv bqpz jjpplbn jzkkt hqf cxvj hmjlx vxrgk xrn mxrn cmkq rrlz mjbtz fvhrnqm gfkp txgqb ctrn qlgtfx nrkzt rxvm kctkhg pkkg gtmqj nchxcr hblmrt xlljpg qqjcg jhdzz sgzr mvkj ctrsrl xpmhz jxcxh gmvckb mdh mbkbn nqfk (contains sesame, nuts)
fgfc kmhxmd fvhrnqm jvntmtdx mlv mbkbn mxrn nsznhh mdh gtpm xnztb hblmrt hxdbs sgzr pkkg nqbd hnkn bthgq jqs gcgms pfx gdtzrg lkgvx gx gccjpvx dcmhdkm bqnn jhdzz mndvp sjpjp bdbn ctrn gdpnb mjbtz mzrmxdg gfvrr jxcxh bmgp rrlz fgvk gcbffc vdvs mndtv mscl kctkhg zrkjc vnss ndkkq rjxcdh vzrtvj kvzv hhjttv rkl (contains shellfish, sesame, fish)
vrnkfr nbbjjq dlhbxjk kntljk bqpz llsvqv zdcvnk nqfk jxcxh nsznhh mgdx gfkp mvkj rpncf dcmhdkm klctxj vdvs hqzxj zhlt rsmg sjgcd bmgp mndvp bthjz cmkq qcmz ndkkq xtdl zrkjc gjxt mfrdz rcx zrvb jjpplbn grzmk nzhx xmx qqjcg dfqlcrs qq mxrn gtpm tfc gfvrr sgzr kvnzs mnzcxjd kmppk nlnscn rnnsp xlljpg sdxkt pkkg lxtc sjpjp vzrtvj clghk gmbcjjd jgdcp cxvj hhjttv mbkbn nbfbf pndtrl gdpnb nxrl nvlz bqnn nthn zhlkr bphms rjb kvqgb sdcmhdm mzrmxdg hqf fkcjzhr hnkn gpfpp gtmqj fztz bthgq lssrnhn ctrsrl (contains dairy, soy, fish)
nxrl gxrtc mlv jzkkt qlgtfx jxcxh gx rjb jbsjb zdcvnk dklfxrm fgvk jgdcp pndtrl xmx bthjz zrvb mdh gdtzrg nqbd ndkkq tqdld nbbjjq xtdl nbfbf ldktm llsvqv mbkbn vtg hkn kvzv kvqgb nclt zhlkr sgzr klctxj pkkg grzmk kkkdtn mjbtz mgdx hmjlx gtpm nsx ctrsrl ktr gmvckb rqskr (contains sesame)
hqf nbfbf rxvm xcvqp jzbhxq rfpn sjpjp kvnzs jxcxh zhlt hnrxcl qq xtdl vrnkfr vzrtvj zrtlv mgdx rrlz pndtrl nxlkv lvhb jzkkt hjcpjz jgdcp bthjz sjgcd zrvb vfklqc qzvlvh jhl chtfln sgzr cxvj vmxdjf dcmhdkm dkng hqzxj ndkkq bmgp mvkj lmv tqdld tfc lxtc php vnss nzhx nclt zrkjc sdcmhdm gdpnb mscl nthn jqs gx gfvrr cdnhg mlv vg pkkg bztxq bxcthm nlnscn jhdzz qqjcg mjbtz kntljk gbsjx mndvp vsfz sdxkt ldktm hblmrt klctxj gcbffc (contains nuts, sesame)
qtbt bthjz pkkg vnss gfvrr hhjttv sgzr nthn zhlt bqnn vjgnkg hqzxj rfsz xmx kmhxmd mndtv grzmk ppftxqh clghk nsznhh pzqqvc mjbtz lssrnhn fgvk nsx nrkzt mnzcxjd zsvs nqfk jxcxh bqpz fmbgpf gcbffc mscl kckp sjgcd vxrgk xxsvnx mlv nvlz ndkkq gcp kmppk lmfnc gccjpvx llsvqv hxdbs gfkp hnkn nclt sdxkt fjnxnqq nxlkv xpmhz hrqhjf nzhx ktr gdpnb dklfxrm kntljk nbbjjq cdnhg lxtc mzrmxdg rjb rrd (contains peanuts, sesame)
mbkbn cdnhg ktr vm dcmhdkm mvkj lvhb jzkkt rrd hqzxj qfql kntljk xpmhz rsmg ndkkq blbbcs zsvs qcmz bthjz cmkq jbsjb vrnkfr gh nzhx mlv gx sgzr pfx dkng bthgq jvntmtdx rcx zrkjc rjb bsjffzv jjpplbn bxcthm pkkg llsvqv mjbtz gtmqj gccjpvx vmxdjf hnrxcl kccpf slzctbv ppftxqh vdvs sjgcd xrn gdpnb sjpjp hmjlx jxcxh ggvglx jqfktrt bqnn vzrtvj gcgms rkl zdcvnk kckp gxrtc kmhxmd txgqb qq jqs bphms gpfpp gvm xtdl nsznhh mxrn (contains wheat)
tqdld bztxq bqpz rfpn mjbtz gcp nthn qcmz fmbgpf llsvqv mbkbn zdcvnk qqjcg hrqhjf lkgvx php gx mxrn nbfbf nlnscn gccjpvx vfklqc qlgtfx lmfnc vsqrzx hblmrt kvqgb gjxt bthjz vnss nxlkv vdvs sgzr dkng klctxj gpfpp rrlz gfvrr jzbhxq dklfxrm cmkq zrfdh gcgms hnrxcl gcbffc cxvj gvm fgfc nxrl vtg gmbcjjd blbbcs pkkg xrn cjrpc jvntmtdx kmhxmd nzhx bthgq cdnhg lxtc jxcxh (contains wheat)
bztxq mndvp kmhxmd lkgvx vzrtvj bphms vsfz nqbd sjpjp qqjcg vrnkfr blbbcs vg nvlz kpjnltk tqdld zdcvnk hqptvp mlv pkkg xxsvnx ggvglx bdbn gh vmxdjf bxcthm cjrpc bthjz fgfc zhlt nthn lmfnc xlljpg lsvkc jqfktrt mnzcxjd ppftxqh mbkbn tjsh zrtlv pzqqvc rngm lxtc mgdx ndkkq sgzr rsmg hqf gcp cdnhg mjbtz gpfpp jqs jxcxh nzhx rcx gvm fmbgpf nbfbf (contains shellfish, nuts, wheat)
xcvqp nqfk nbbjjq blkzhh bphms kvzv bmgp jzbhxq ctrsrl lssrnhn kpjnltk gmbcjjd dkng pndtrl mbkbn fztz jzkkt ldktm hxdbs bqnn nxlkv jxcxh rjxcdh rjb mnzcxjd dcmhdkm jhl zdcvnk ndkkq pfx xrn hrqhjf nxrl gtpm qqjcg zrtlv rnnsp mgdx rsmg gh gbsjx qlgd kccpf gcbffc bthjz cxvj hqzxj mjbtz bxcthm nsx bsjffzv sgzr jhdzz gfvrr rrd bdbn qzvlvh (contains dairy, fish, wheat)
qq kkkdtn lmfnc vm gjxt jhdzz sjgcd vg fmbgpf ctrn zrkjc nchxcr hnkn jvntmtdx jjpplbn fjnxnqq vnss pkkg mjbtz kvqgb bthgq sgzr bdbn qqjcg hsbcqj vzrtvj ndkkq dcmhdkm kvzv sjpjp hqzxj jxcxh mbkbn lssrnhn rfpn bthjz jzkkt gmbcjjd ktr lkgvx rjb tpcrl rrd gtmqj xxsvnx mgdx vxrgk fvhrnqm vrnkfr grzmk rsmg bztxq kntljk hkn hblmrt xcvqp kslcnpt (contains peanuts)
tpcrl vtg nxlkv hsbcqj gccjpvx gjxt kvzv dlhbxjk qfql kslcnpt bthjz gfkp jqs gtpm lssrnhn pndtrl xrn vzrtvj mbkbn blkzhh mlv php sjpjp hnrxcl rjb klctxj mgdx hmjlx zsvs hjcpjz rcx sgzr lvhb lsvkc sdxkt jxcxh sjgcd ktr chtfln zrtlv qtbt ndkkq nxrl nqfk gmbcjjd hkn qlgd lmv grzmk pkkg gvm ctrn bsjffzv gh mscl pkqbt nzhx rkl nvlz hxdbs rnnsp lsvv tqdld gtmqj mvkj mnzcxjd rqskr kmhxmd jjpplbn rfsz hhjttv cmkq gcgms dklfxrm mfrdz hqptvp tfc cdnhg mjbtz gdtzrg kckp kvnzs ctrsrl (contains shellfish, peanuts, sesame)
hxdbs lsvkc mvkj hnrxcl gmvckb mgdx pndtrl kntljk qqjcg gfvrr sjgcd sgzr fjnxnqq jhdzz fgvk xnztb hqptvp blkzhh kctkhg dlhbxjk mbkbn zrtlv rrd stvmc qq kkkdtn pzqqvc mjbtz rsmg jxcxh vxrgk ndkkq hsbcqj llsvqv rjxcdh lmfnc mndtv vzrtvj nqfk bthgq pfx hmjlx nxlkv rpncf pkkg gh kckp lssrnhn mnzcxjd cjrpc rqskr nvlz qlgtfx nbfbf (contains sesame)
vnss pzqqvc hnkn lmfnc pkkg xxsvnx mndvp stvmc kntljk nzhx bphms gdpnb rpncf qtbt dkng dklfxrm sgzr ndkkq jxcxh rfpn nxlkv nsznhh zdcvnk zrkjc mbkbn vtg vrnkfr rfsz cxvj gcbffc blkzhh gfvrr jjpplbn mndtv vdvs mlv cjrpc mzrmxdg slzctbv kmhxmd rjxcdh xrn bthjz (contains peanuts, sesame)
rcx mbkbn sdcmhdm txgqb mxrn hhjttv jzkkt php ktr gxrtc lkgvx mjbtz dlhbxjk rngm zrkjc fmbgpf pndtrl gfvrr zrfdh nbfbf blkzhh tfc pkkg ndkkq hxdbs nsx gtmqj kslcnpt kmppk jxcxh kvnzs rfpn sjgcd vsfz gfkp nvlz jhl fztz mzrmxdg vm xcvqp dfqlcrs sgzr klctxj rkl zsvs mndvp bqpz gcbffc qtbt pzqqvc rrd tpcrl (contains dairy, wheat, shellfish)
mbkbn xmx sjpjp tqdld bphms nthn qlgtfx qlgd hkn fjnxnqq mndtv pkkg slzctbv zhlt hxdbs xtdl ggvglx gtmqj gdpnb gxrtc xcvqp ctrn nxlkv rfsz vrnkfr rxvm lvhb lssrnhn gh dkng bsjffzv zhlkr rqskr mndvp kccpf nzhx mjbtz kmppk bztxq qtbt sjgcd dklfxrm qcmz ndkkq sgzr llsvqv rrlz vzrtvj gccjpvx qfql kslcnpt klctxj rrd nvlz rjxcdh jxcxh gjxt clghk jqfktrt mfrdz vm vsfz jhl gfvrr jhdzz ktr gmbcjjd fvhrnqm fmbgpf bqnn pndtrl gcbffc vdvs rpncf jzkkt (contains nuts)
ldktm jxcxh nqfk hnrxcl sgzr jqfktrt gfvrr jzkkt blbbcs vsfz jhl zrkjc rjxcdh ctrsrl mjbtz ppftxqh fkcjzhr blkzhh sjpjp fjnxnqq vmxdjf nclt mbkbn qfql gpfpp bsjffzv nrkzt qqjcg mndtv sdcmhdm lssrnhn kpjnltk rnnsp ndkkq zrvb kslcnpt mzrmxdg nlnscn llsvqv kvnzs gdpnb jvntmtdx chtfln qlgd mgdx bthjz bthgq pzqqvc (contains wheat, nuts)
vdvs fgvk hkn bqnn gcp sdcmhdm zsvs bztxq qlgtfx gccjpvx grzmk jqs fkcjzhr vxrgk tfc bdbn zrvb cdnhg gcbffc ndkkq tqdld mndtv vtg jxcxh ldktm dcmhdkm hqptvp mjbtz gtmqj qlgd hmjlx bqpz lmv vsfz gfvrr zhlkr bmgp jvntmtdx gmvckb lvhb chtfln dklfxrm sgzr rnnsp hnkn pkkg mbkbn xxsvnx slzctbv (contains dairy, fish)
gpfpp rfpn dcmhdkm nxrl lmfnc lkgvx gtpm tfc hqf mndtv mvkj ctrn jqs kpjnltk vzrtvj sdxkt rqskr tpcrl nqbd nxlkv rkl zdcvnk hblmrt bqnn cmkq lmv ldktm gfvrr kslcnpt vmxdjf mjbtz mdh kvzv bthjz hsbcqj qqjcg nsznhh fvhrnqm bxcthm zsvs jhdzz qlgd hhjttv vjgnkg lsvkc kctkhg xcvqp vfklqc ppftxqh jxcxh rfsz ndkkq kvnzs sgzr mbkbn bztxq cxvj gjxt dlhbxjk gdtzrg lsvv clghk chtfln vsqrzx hmjlx ggvglx gx nrkzt xnztb gcp (contains nuts, sesame, fish)
dfqlcrs hmjlx hqptvp xnztb gvm rfsz mlv gmvckb ldktm gdtzrg dcmhdkm xlljpg sjpjp cjrpc ktr cdnhg mscl fgfc gbsjx gfvrr hhjttv kvqgb gmbcjjd qlgd bqnn jxcxh lkgvx bxcthm nbbjjq qtbt txgqb mnzcxjd nsznhh vrnkfr zsvs slzctbv sdcmhdm lxtc fgvk mvkj nclt ndkkq qcmz fmbgpf mbkbn ctrn rrd zrfdh nvlz bthjz fjnxnqq lvhb kmhxmd grzmk rpncf qzvlvh zdcvnk ctrsrl mdh pkkg sgzr (contains shellfish, dairy)
kmppk kmhxmd php nzhx llsvqv rfsz dfqlcrs mxrn qfql xtdl rfpn dkng hhjttv gx mzrmxdg bsjffzv vrnkfr sdcmhdm kckp mndvp hrqhjf vsqrzx cxvj xmx xnztb nxrl lmfnc nrkzt tjsh jjpplbn bqnn dcmhdkm mgdx zhlkr pkqbt pzqqvc vsfz pkkg kkkdtn nsznhh gfvrr gtpm ndkkq jqfktrt blbbcs mbkbn pndtrl jxcxh klctxj mnzcxjd hsbcqj nqbd nqfk hblmrt xlljpg ctrn grzmk xrn qqjcg bthjz gccjpvx fjnxnqq mjbtz dklfxrm slzctbv (contains peanuts, fish)
pkkg qcmz cmkq gvm jzkkt bthjz rjb mvkj lsvkc kvnzs hnrxcl mjbtz nchxcr kslcnpt nqbd gfvrr kccpf blkzhh sgzr vsfz xtdl hqf mbkbn nvlz ndkkq bthgq rrd bdbn gh kntljk rpncf jgdcp klctxj gcgms ggvglx vjgnkg mlv dfqlcrs nsznhh zrfdh vnss gdpnb dklfxrm jzbhxq txgqb xmx nlnscn (contains soy, sesame, peanuts)
tfc kctkhg gjxt lssrnhn mjbtz pkkg zsvs mlv mfrdz gvm xnztb gh qzvlvh xmx stvmc hjcpjz vjgnkg qlgtfx vdvs clghk qlgd fztz dcmhdkm ldktm bmgp nzhx kslcnpt nbfbf gfkp zrvb vsqrzx nvlz nbbjjq gfvrr xlljpg hxdbs kpjnltk gtmqj nthn rjb rxvm sgzr kmppk rpncf nclt jxcxh gcbffc jbsjb gmbcjjd ndkkq zrkjc mbkbn nxrl rrlz vm grzmk bqnn llsvqv jhl blkzhh xpmhz gbsjx qtbt qqjcg gxrtc hhjttv bsjffzv bztxq nqbd (contains shellfish, nuts)
pzqqvc clghk php grzmk xrn kckp txgqb mndtv rqskr nxrl mbkbn ndkkq qq vmxdjf rrd stvmc slzctbv hnrxcl mnzcxjd jhl hhjttv jvntmtdx gcp gmbcjjd fgfc ldktm bztxq lmv mjbtz rxvm nvlz ctrn bthjz jxcxh blkzhh zrfdh sgzr vtg kvnzs rfsz mlv vfklqc zdcvnk qlgtfx ggvglx nqbd gfvrr ppftxqh gtmqj qtbt vsqrzx bqnn vzrtvj (contains peanuts, sesame, dairy)
mndvp sgzr nsznhh rqskr klctxj nrkzt tjsh gdtzrg gtmqj vsqrzx lsvv nqfk pkkg vnss gbsjx bxcthm jhdzz mbkbn ctrn xxsvnx zhlkr hrqhjf zrkjc kmhxmd mdh gdpnb nbfbf gxrtc fgfc kkkdtn jvntmtdx nlnscn ggvglx jgdcp pkqbt mnzcxjd kslcnpt sjpjp gmbcjjd mxrn jxcxh ldktm gfvrr pzqqvc stvmc rxvm lvhb ndkkq tfc xnztb lkgvx hxdbs pfx qqjcg txgqb gtpm gjxt fvhrnqm zhlt rrlz bdbn mjbtz zrvb kntljk jbsjb qzvlvh zrtlv nxlkv vxrgk (contains fish, dairy, wheat)
vsfz vtg mdh xcvqp lsvv cmkq jjpplbn vdvs bsjffzv rnnsp lssrnhn hhjttv bqpz rrlz sjgcd kvnzs mjbtz nqfk qqjcg kckp gfkp hqzxj jzkkt hxdbs tjsh nxrl zhlkr hrqhjf sdxkt bztxq vjgnkg vm qlgtfx bqnn qtbt vsqrzx rqskr gfvrr nrkzt vg lmfnc stvmc hnkn vzrtvj nclt cjrpc mxrn sgzr kmhxmd cdnhg bthjz hblmrt mvkj xnztb jhdzz kccpf mlv nbbjjq qfql mgdx klctxj lvhb rjb kpjnltk zrfdh gdpnb dlhbxjk grzmk xxsvnx rxvm clghk hnrxcl mfrdz hjcpjz gh jxcxh pkkg dkng nsx ndkkq kkkdtn gcgms (contains nuts, dairy, fish)
dcmhdkm xxsvnx bdbn vrnkfr mgdx tpcrl lxtc bqnn chtfln ndkkq hkn ctrn lmv kvzv rrd pzqqvc xnztb jjpplbn hqptvp vnss dfqlcrs jvntmtdx kkkdtn bthjz vmxdjf mbkbn kslcnpt fmbgpf kmppk nxrl gfvrr jqfktrt zhlkr sgzr jxcxh nchxcr qqjcg lsvv gccjpvx jhl ktr blbbcs nqbd kvqgb sjpjp rkl qq rcx fgvk gh jbsjb stvmc bphms kckp nthn tjsh slzctbv nsx cxvj rjxcdh nxlkv vdvs gmbcjjd fvhrnqm pkkg (contains shellfish, dairy)
hhjttv hqptvp mbkbn fkcjzhr rfpn bthjz kmhxmd blkzhh pkqbt jhdzz zsvs fmbgpf ctrn fgvk zrtlv jjpplbn gmbcjjd rqskr gfvrr hxdbs dlhbxjk ldktm qcmz gcbffc gdtzrg mscl lvhb vsqrzx rnnsp chtfln qq cxvj mdh hqzxj kvnzs qtbt rngm dkng mxrn vm zdcvnk hkn fjnxnqq rrd qfql vxrgk jzkkt gjxt jhl nvlz zrfdh pkkg tfc vjgnkg lssrnhn ndkkq hrqhjf gmvckb sjgcd vzrtvj nxlkv ggvglx nqfk jqfktrt mlv mndtv gvm rkl rsmg bthgq cmkq stvmc ppftxqh vdvs vg jxcxh kctkhg gccjpvx nxrl ctrsrl zhlkr lkgvx llsvqv gx sjpjp nsx mnzcxjd zrvb fztz mjbtz nthn (contains soy, fish, wheat)
dkng ndkkq jbsjb kntljk lsvv vrnkfr xmx xlljpg tqdld cdnhg zrtlv zdcvnk bsjffzv blbbcs kccpf nqbd qzvlvh mjbtz gfvrr kvnzs mdh sgzr clghk gcbffc jxcxh jjpplbn pkkg qfql sjgcd vnss zrvb rrd fgvk qlgtfx mndvp fztz fvhrnqm mbkbn vsqrzx gdpnb vm gfkp gx chtfln xnztb ggvglx stvmc xpmhz nbbjjq hjcpjz ctrsrl kvqgb (contains shellfish, fish)
jqfktrt gcp gfvrr ndkkq grzmk nxlkv nsznhh bthjz jxcxh kntljk mscl fkcjzhr pzqqvc nqfk sjpjp hjcpjz fvhrnqm qtbt ktr qlgd kmppk jhdzz qq zrkjc pfx lsvkc zhlt vjgnkg dkng kvqgb cjrpc hxdbs clghk mzrmxdg mjbtz klctxj nclt nvlz gmbcjjd ggvglx kvzv cmkq mbkbn vg gpfpp bphms rrd sdxkt rqskr mfrdz lmfnc stvmc vsqrzx qzvlvh gcgms bdbn blbbcs zsvs cxvj mdh hqptvp kccpf mgdx kckp gx rfpn lsvv sgzr vnss txgqb nrkzt dcmhdkm jqs jgdcp mnzcxjd llsvqv (contains peanuts, nuts, dairy)
bthjz mdh gvm rrd lsvkc fgvk zrkjc bmgp pkqbt hmjlx rjb gxrtc mlv jzbhxq gbsjx lmv kvnzs lsvv lmfnc zhlt sgzr cjrpc nqbd zdcvnk vmxdjf rxvm chtfln bthgq qfql hqptvp hrqhjf pfx pkkg mjbtz gfvrr nsznhh bsjffzv mbkbn hqzxj gcbffc ndkkq zsvs mgdx (contains wheat, peanuts)
gmbcjjd vfklqc dlhbxjk lmfnc nxrl dklfxrm gdtzrg vg mxrn gpfpp rjb mjbtz nbfbf jjpplbn gfkp cmkq sdcmhdm fvhrnqm gjxt gccjpvx rpncf lsvkc nzhx bthgq jvntmtdx xpmhz lsvv fjnxnqq rqskr hblmrt zsvs nchxcr zhlkr kslcnpt lxtc mlv rnnsp sgzr zrtlv rcx jxcxh vdvs vnss hqptvp jhdzz mbkbn nqfk pzqqvc nsznhh hnrxcl pkkg gxrtc rfpn rkl mscl fkcjzhr rjxcdh stvmc hhjttv vm jzkkt gfvrr fztz vzrtvj kkkdtn ctrn vsfz dkng jgdcp pkqbt zdcvnk bqpz ndkkq mzrmxdg bsjffzv clghk xlljpg qzvlvh kccpf (contains wheat, fish)
rfsz dcmhdkm mbkbn jbsjb xxsvnx jzkkt sgzr nsznhh vsfz jxcxh fmbgpf lsvkc qq nzhx rxvm nchxcr kckp nlnscn nrkzt vjgnkg pzqqvc cxvj xmx gcgms fvhrnqm hqzxj sjgcd cjrpc sdcmhdm ctrsrl xpmhz clghk xnztb gdpnb nvlz kctkhg gbsjx rkl kslcnpt rrd gfvrr qlgd qzvlvh nxrl fztz lmv chtfln jhdzz kntljk bphms zdcvnk kvqgb vrnkfr hsbcqj dfqlcrs mjbtz kpjnltk pkkg xcvqp bthjz zrfdh cdnhg zsvs pfx slzctbv gccjpvx fgvk jgdcp nqbd gdtzrg pkqbt (contains soy, wheat)
dklfxrm hqptvp vfklqc hqzxj bsjffzv mndvp slzctbv fgfc lxtc rrlz ggvglx qcmz dkng kslcnpt hqf ndkkq rqskr ktr tfc txgqb kpjnltk gcp hmjlx xpmhz jhl jxcxh nlnscn gfvrr pkkg ppftxqh mxrn vxrgk stvmc gvm gccjpvx gxrtc bthgq nchxcr hnkn hhjttv qq zdcvnk zhlt gpfpp jqs jzbhxq jjpplbn cdnhg rpncf vjgnkg bthjz hxdbs rjxcdh mzrmxdg kmhxmd mjbtz hjcpjz kckp vzrtvj pfx nqfk xnztb klctxj kvqgb mgdx blbbcs cjrpc zhlkr mbkbn gdpnb (contains dairy, shellfish, soy)
kmhxmd bztxq gfvrr bqpz blbbcs hkn nsx fztz mfrdz pkkg kctkhg nchxcr kslcnpt nsznhh kccpf nbbjjq mscl cmkq qzvlvh bxcthm hqptvp tpcrl chtfln ldktm kckp vfklqc pfx sgzr gvm jxcxh rsmg jvntmtdx jjpplbn lssrnhn cxvj dfqlcrs zrkjc hqf cjrpc hmjlx gpfpp fvhrnqm lxtc ndkkq vsqrzx mndtv bphms qlgtfx rjb mlv fgvk hhjttv mjbtz jzbhxq zrfdh bthgq lkgvx slzctbv zsvs mxrn rxvm gx mbkbn txgqb (contains shellfish)
clghk mbkbn rcx vdvs nqbd kvqgb qlgd gmvckb zdcvnk vjgnkg hnkn pkkg lvhb nsznhh lsvv kkkdtn mdh ndkkq rngm vmxdjf mgdx gccjpvx dfqlcrs rqskr vxrgk qcmz qlgtfx kntljk nbfbf hsbcqj ctrn pkqbt zsvs gcgms gdtzrg bthjz nsx zhlkr kvzv bztxq sgzr qtbt kvnzs nqfk sdxkt klctxj sjgcd gfvrr mjbtz kctkhg vm qqjcg sdcmhdm (contains sesame)
xrn dlhbxjk rqskr nvlz qtbt bdbn zhlkr lmv kmhxmd txgqb hsbcqj jxcxh mjbtz mbkbn hqf vzrtvj cmkq vmxdjf vg sdcmhdm llsvqv mxrn bthgq jgdcp cxvj rkl blbbcs nrkzt hmjlx ldktm ktr zhlt mdh qlgd kslcnpt zrfdh lxtc hnrxcl mfrdz bxcthm nxlkv klctxj hblmrt mnzcxjd rfpn fkcjzhr fjnxnqq nlnscn mgdx gdpnb nchxcr xlljpg lsvv mndtv gjxt xtdl stvmc slzctbv ctrsrl xcvqp rcx vsqrzx qlgtfx gfvrr gx zrkjc bthjz mvkj pndtrl ndkkq hnkn dfqlcrs nbbjjq jbsjb fvhrnqm xxsvnx sjgcd gmvckb mlv pzqqvc rxvm pfx fmbgpf sgzr nsx hhjttv (contains fish, wheat)
nxlkv lsvkc hhjttv hblmrt rngm cmkq dfqlcrs grzmk ndkkq zrfdh mndvp mgdx mvkj nbbjjq kvnzs jxcxh vmxdjf xrn kpjnltk gvm sgzr mbkbn vnss rsmg rfsz mxrn jbsjb mjbtz pkkg gfvrr kntljk blkzhh kkkdtn mzrmxdg vtg php nqfk cdnhg sjpjp nchxcr rrd lmv jjpplbn gmvckb kvqgb (contains soy, wheat)
mlv fmbgpf xnztb qqjcg rkl kslcnpt txgqb gx hblmrt ktr nzhx tpcrl qtbt jzbhxq hnkn mnzcxjd mjbtz ndkkq nvlz bsjffzv rsmg tfc zrtlv nrkzt fkcjzhr rqskr bxcthm cxvj rcx jhdzz lmfnc rxvm qzvlvh hhjttv lssrnhn kvqgb ggvglx vmxdjf vm mndvp lsvkc kpjnltk rrd sjgcd gtpm pndtrl mdh bthjz qlgd blbbcs mndtv kntljk qfql sdcmhdm clghk rnnsp pkkg dklfxrm mbkbn pfx kckp klctxj chtfln hqzxj gmbcjjd tqdld nsx jzkkt zsvs hqptvp tjsh sgzr nsznhh kctkhg vrnkfr hqf gfvrr grzmk dkng (contains soy, peanuts)
nthn rjxcdh qlgd vzrtvj chtfln pkkg gfvrr ktr gccjpvx nqfk bdbn fztz vsqrzx mvkj kctkhg mjbtz tqdld xcvqp ctrsrl cmkq mzrmxdg bthjz vnss mfrdz lsvv vsfz ndkkq blkzhh nxrl mbkbn sgzr kckp mscl sjgcd qfql cxvj hqf mlv zhlkr kvqgb gpfpp rxvm rcx kntljk jvntmtdx xtdl ppftxqh hsbcqj gvm qqjcg kmhxmd qzvlvh zrtlv vmxdjf mnzcxjd dkng lxtc rnnsp hrqhjf kvnzs gbsjx xxsvnx gcgms qq nclt kvzv nzhx hnrxcl (contains shellfish, dairy, fish)
gmbcjjd nthn mbkbn gdpnb kvzv zrfdh zsvs ndkkq rxvm vtg jbsjb kccpf tpcrl kslcnpt mxrn zrvb tjsh cmkq pfx zrkjc jjpplbn lsvkc mdh kvnzs gdtzrg vjgnkg hblmrt jhl nzhx xtdl mndvp bthjz gfvrr bthgq rjxcdh rrd lmv bqpz sgzr gvm jxcxh pkkg (contains fish, dairy)
pkkg gx xxsvnx bqpz vtg dlhbxjk kccpf rjxcdh bdbn ndkkq bqnn rfsz rxvm mjbtz qcmz blbbcs mbkbn lsvkc vmxdjf vm hblmrt slzctbv jjpplbn jvntmtdx gpfpp kpjnltk xmx bsjffzv vnss lmv bthjz hxdbs nvlz rqskr nbbjjq sjpjp hqptvp qqjcg rjb mdh hnkn xrn ldktm sgzr pfx gdtzrg bztxq xlljpg jxcxh nlnscn (contains fish, nuts, sesame)
rngm vzrtvj fgvk xrn bdbn bthjz sgzr gcp hnrxcl xtdl pkkg mgdx jhl jgdcp jzkkt mfrdz zsvs qtbt rjxcdh php mjbtz rxvm hxdbs nlnscn jxcxh gpfpp ldktm lsvv vsqrzx hqzxj nxrl rcx rnnsp gtpm bztxq hqptvp grzmk ndkkq hrqhjf gbsjx jjpplbn tpcrl txgqb mbkbn jzbhxq gtmqj pkqbt bsjffzv (contains wheat, fish)
zsvs qq sdxkt lmv tfc jxcxh jqfktrt hqf kccpf mlv xpmhz qcmz txgqb stvmc pkkg ndkkq lsvv kckp qlgtfx kvnzs mxrn mndvp dfqlcrs sgzr jbsjb xnztb bthgq dlhbxjk qzvlvh pndtrl xtdl nzhx hsbcqj nsznhh rngm ctrsrl tjsh ggvglx vmxdjf hxdbs gmvckb fgfc vfklqc vm blbbcs nxrl kmppk hqzxj mvkj tpcrl cjrpc gfvrr ldktm rfpn nclt gx fztz bmgp mjbtz mgdx fmbgpf pzqqvc gdpnb mbkbn zdcvnk (contains nuts, fish, sesame)
qfql dkng mjbtz hjcpjz mvkj lsvv mdh bsjffzv tfc jhl fvhrnqm rxvm fgvk vdvs qzvlvh xxsvnx vm dklfxrm kvqgb rfsz jzkkt kslcnpt xtdl rfpn rpncf mnzcxjd nqbd zhlt mzrmxdg ggvglx sgzr gccjpvx rnnsp hqf sdcmhdm hxdbs gvm gpfpp qlgtfx pkkg nzhx bphms gh fkcjzhr cxvj gtmqj qcmz fjnxnqq pndtrl php bdbn rkl mndvp zrtlv bthjz hnrxcl jxcxh blkzhh kctkhg fgfc xmx lvhb hrqhjf nchxcr vmxdjf xnztb ppftxqh gxrtc jzbhxq pkqbt zsvs rrlz cmkq nclt qqjcg stvmc hqzxj ndkkq jjpplbn xpmhz ctrn kckp hkn clghk qlgd dlhbxjk bthgq gfvrr nxrl (contains peanuts, dairy, soy)
gcgms rqskr pkqbt zrfdh xcvqp clghk mgdx stvmc blkzhh jzbhxq hnrxcl gfvrr hblmrt gdpnb fmbgpf mndtv hxdbs jzkkt llsvqv vzrtvj vsfz rxvm slzctbv jqfktrt nbbjjq ppftxqh pndtrl pkkg bthjz xrn hhjttv qzvlvh kckp gtpm nvlz hjcpjz dfqlcrs zdcvnk tqdld bthgq mjbtz dkng gccjpvx nzhx bxcthm xpmhz nsznhh gh hrqhjf vdvs bmgp mfrdz qtbt vmxdjf ndkkq cjrpc zrtlv lxtc kkkdtn vxrgk pzqqvc nxlkv gjxt sgzr mxrn xmx lvhb fgfc nqbd rnnsp qq jvntmtdx vnss rcx nsx mbkbn vjgnkg txgqb (contains fish, dairy, soy)
vm sjgcd jqs nqfk mjbtz gdpnb mvkj bsjffzv tfc mlv nzhx vjgnkg hrqhjf gjxt blbbcs tqdld lkgvx bthjz nbbjjq gdtzrg rfsz kvqgb dklfxrm fgvk pkkg jxcxh kntljk qlgtfx vxrgk lsvkc jzbhxq jbsjb gmbcjjd fmbgpf hxdbs ndkkq jhl vg cjrpc clghk bphms bztxq rxvm xlljpg kctkhg fvhrnqm rqskr mfrdz vrnkfr vsqrzx sgzr mbkbn dcmhdkm gvm qqjcg lvhb vzrtvj lssrnhn rjb qcmz jjpplbn gxrtc pfx (contains peanuts, sesame)
dkng zhlt sgzr mndtv lssrnhn zdcvnk bthjz xrn jqfktrt rngm vsqrzx nvlz bxcthm xtdl gxrtc pfx nsznhh pkqbt kvzv gx mjbtz vnss gcp zrfdh jzbhxq gjxt lmfnc stvmc kmhxmd nxlkv fvhrnqm lkgvx pndtrl cmkq bqpz fgvk cxvj pkkg hsbcqj rfsz kvqgb gmvckb kccpf ggvglx jvntmtdx qlgtfx rqskr rrlz vg gvm lvhb lmv mlv jjpplbn jbsjb jxcxh jqs qq lsvkc gbsjx bsjffzv chtfln nclt jgdcp vzrtvj vm ndkkq nbfbf qfql txgqb ctrn hhjttv gccjpvx mbkbn hxdbs nchxcr kmppk qlgd hnrxcl nqfk dlhbxjk qcmz gtpm (contains sesame, shellfish)
vsfz rsmg qfql sdxkt rjb pfx xcvqp gbsjx zrtlv kctkhg jhdzz vdvs jzbhxq dcmhdkm gtmqj vrnkfr qlgtfx hhjttv gmbcjjd gccjpvx nqbd hnrxcl rfsz mvkj vxrgk gdtzrg kmppk grzmk nclt gcgms jxcxh vg gpfpp jqfktrt kmhxmd slzctbv rqskr hqf zsvs dklfxrm lsvkc lxtc lkgvx bthjz mbkbn xxsvnx kkkdtn clghk ndkkq llsvqv klctxj nbbjjq kslcnpt qlgd xmx zrkjc xlljpg bqnn pkkg hxdbs mxrn php ctrsrl fztz gfvrr blkzhh jgdcp kpjnltk zrfdh xpmhz gx gcp jhl hsbcqj zhlkr ctrn gdpnb mjbtz (contains dairy)
mjbtz dkng chtfln rsmg bxcthm gx qlgd dfqlcrs pndtrl nclt tfc mnzcxjd mscl rpncf bdbn lvhb kccpf vzrtvj kpjnltk gcgms hjcpjz jqs sdxkt zsvs bthgq blbbcs mdh zrkjc rkl vfklqc jhl cdnhg vxrgk jqfktrt ndkkq jvntmtdx xrn fgfc ggvglx kvqgb mxrn nvlz nzhx sjgcd hrqhjf gtpm mbkbn jxcxh xxsvnx cjrpc mndvp qfql hnkn hblmrt sgzr qzvlvh klctxj ctrsrl tjsh gfvrr jbsjb pkkg (contains nuts, fish)"""


satImg =
    """Tile 3923:
...##.....
.##.#..#.#
###....#..
...#...#.#
....#.#...
..........
.....#.###
.##.#..#..
..##..#...
..#.#.##..

Tile 1229:
###.....#.
..########
...##...#.
...#..#...
....#.....
..#.....#.
#......#..
#.....##.#
##.#....##
.##.......

Tile 1801:
..###...#.
.....#....
.....#...#
#...##...#
#........#
.....#....
#.####..#.
.....#....
.#.#......
..#..###..

Tile 3643:
##..#.#...
.......#.#
#.#..#.###
.....#.#..
.......#..
........#.
..#..#.#.#
#........#
#...#..###
..#.......

Tile 2141:
...###.##.
#.##..#...
##.#.....#
#..#.....#
#.#..###.#
.......###
#...##.###
#......#..
#...#....#
.##..##.#.

Tile 1289:
....#...#.
###.....##
.##.......
....#..##.
.#.......#
...#....#.
...#.#.##.
.##..##..#
.........#
.##.####..

Tile 3373:
#####.####
..###.##..
#..#...##.
.#....#..#
.......#.#
...#..#.##
#.#..##...
####....#.
....##.#..
.###.####.

Tile 1399:
..#.#.#...
#..#...#.#
...####.##
.....#....
........##
.......#..
.##...#...
#..#......
.....#..#.
#...#..###

Tile 3259:
###...#.##
..........
..........
...#..##..
#....###.#
#....##...
#.##.#.###
....##...#
.........#
#..##.#..#

Tile 3469:
#..#####.#
#..#.....#
......#...
..#.##.##.
#..##....#
......##..
#.#.....#.
.##.......
#.#.......
#..#...###

Tile 2143:
##.#.###.#
....#..##.
#.........
#....##...
#.......#.
.###......
.#....#..#
#.#......#
.....#..#.
##.####.#.

Tile 2663:
....#####.
.#..#.....
.#......##
.#........
#....##..#
#..#......
##..##...#
#.....#.##
#...#...##
#....#...#

Tile 3067:
#.#.##..#.
..........
#..#......
#...#....#
#.##.#....
##.......#
#....#....
#......#..
#....#.#.#
##.#......

Tile 2903:
##...#.#.#
..#....#.#
#.##.#.###
#.#..#...#
#......#.#
........#.
#.#.#...#.
##.#...##.
...#..#.##
####.##.##

Tile 1471:
###.##..#.
#....#.#..
..##.#...#
........#.
#.....##..
.#........
#..#.....#
#.....##.#
.#...###..
..##..#.##

Tile 3251:
.####..#..
.#.......#
#.##.#....
.......###
.#..#....#
....#....#
#...####..
##..#.####
.......###
....#....#

Tile 1583:
...#..###.
.....###..
#..##...##
######..#.
.....###.#
#..#.#....
.#..###..#
..#...##..
#.#.....##
###..##..#

Tile 1747:
##.#..#...
......#.##
....#....#
.....#...#
#..#.#..##
#...#.....
#......#.#
#....##.#.
....#...#.
##....##..

Tile 1259:
#..#.....#
...##.#.##
.#...#.#..
.....##.#.
#......#..
#........#
........#.
.##.....##
###.#..##.
###..#....

Tile 1993:
#..#......
#..#..##.#
##.##..###
.....##...
.#.#..#..#
......#..#
....#.....
....#..#..
#.#####..#
..#..####.

Tile 3391:
#..####...
###....##.
##.....###
..#.......
#.....#..#
.#..#..#.#
#....##...
....#.#...
.#.......#
..###.##..

Tile 3881:
...#.#..#.
.#..##.##.
#.##.#.#..
.#..#.....
.....#.#.#
###....#.#
#..#.....#
......#..#
....#.....
####..#.##

Tile 1931:
#.....#..#
.#.......#
#.##.#..#.
..........
#.#.#.....
##......##
.#........
###..#.#..
#.#.#....#
.#.#.###.#

Tile 1907:
#...###.##
#.....#.#.
......#..#
#........#
#.........
#.#.##...#
##..#.....
..#......#
.#.##.#...
#.##.#####

Tile 3329:
.##.#..#.#
#....##..#
.....#..#.
..##......
#...#.##..
......#...
...#.#.#..
#...#.....
##.##....#
..##......

Tile 1009:
#...#.#.#.
..#...##..
#....##.##
##...##...
#.#..##...
##.##...##
##...##.#.
..#..#...#
..###.####
....##..#.

Tile 2011:
...#...#..
#..#.....#
.#......##
##...###..
#...#.....
..........
#.#.#....#
###....#..
.#...##...
####..###.

Tile 3467:
##..#.####
##.#.....#
#.#..#.#..
.##....###
#........#
..........
.###..#..#
......#..#
..#.....##
.###.#....

Tile 3533:
.#.###...#
#...#..##.
.##.##...#
..#.####.#
..#..#...#
.#..#.#...
#........#
.#..#....#
....#...#.
##.###...#

Tile 3203:
#..#######
...#....#.
...###...#
....#.....
.......#.#
........##
#.##.#..#.
..###...##
#...##....
#..###..#.

Tile 1307:
#..##..###
.#.##....#
....##...#
..#......#
#.##......
###.#..#..
##.##...#.
##.#..####
#...#....#
######.#..

Tile 1087:
#...#####.
..#...#.#.
#.##......
.#....#..#
#.........
..##..#..#
##.......#
#.##.#..##
#........#
#...##.###

Tile 1879:
#.#...#.##
..#...##.#
#....##..#
#........#
#.........
#...#.....
#..#.###.#
##..#.....
#...#.....
..##.#.#..

Tile 1733:
###.##.#..
..##.#.#.#
...#......
....#.#..#
.....#...#
#...#....#
#...#####.
#..#..#...
#..#.....#
#.....##.#

Tile 2357:
.##.##.#.#
..##.##.#.
##.#.#...#
..#.....#.
...#..##..
.#......#.
.......#.#
##..######
#.........
#.#.######

Tile 3929:
...##....#
.##.###...
#.....##.#
..#.#..#..
..#..#....
#....#..##
#...#.#..#
.....###..
#.........
######.#.#

Tile 2621:
..#######.
....#..#..
#......###
#......#.#
#.......##
........#.
..##...#.#
.####.##.#
..#####..#
###.....##

Tile 1787:
....#.##..
......###.
..#.##.#.#
###....##.
#.#..#...#
...###.#.#
#......###
#.#....#..
...#...##.
###.#.##.#

Tile 1549:
#.#####.##
..##...###
#..#.#...#
.#...##..#
.#....##..
.......#.#
........##
..#.#.....
..........
....######

Tile 1933:
.####.####
#...#....#
#......##.
....#...##
###..#...#
##.#.##...
#....#..##
...#......
##........
#.#..#.##.

Tile 3557:
#..#.####.
#....#.#.#
#.....##..
.#.#....#.
.##.#..##.
#.##.#...#
..#....##.
#..#......
##..#...##
.#.##.#..#

Tile 3631:
###...##.#
.##....#..
#..##....#
......#...
...#..#..#
...#.....#
.........#
##..#..#.#
##.###....
##.#...#..

Tile 3877:
.##..#.##.
..#.#..#..
......#...
...#...#.#
.........#
#..#.....#
##.#...#.#
#......#.#
#.#.......
#####..##.

Tile 2909:
#..##...#.
###.#....#
#.##......
...#.#.###
#.#.##.###
....#..#..
...#.....#
##........
#.#......#
##.#..#..#

Tile 1873:
#..#.##.##
.#...#.#.#
..........
#.##.#..#.
.#..#.##.#
#..#....##
.......#..
.......#.#
##.#....#.
.#########

Tile 3539:
###.#..#..
##.....###
#...#.#..#
#....#.#.#
#..#......
......#...
....#....#
#...#...#.
....##.###
.#..#..#.#

Tile 1657:
..##..###.
#.......#.
.##.....#.
#..#.##..#
#.....#...
..#.......
#.#...#.##
......#...
.#.#######
##.....#..

Tile 2753:
#..#.#####
.#.###.#.#
..##....#.
###.....#.
.#.#.##...
##...#.#.#
##.###..#.
#####..#..
#.##...#..
..######.#

Tile 1409:
####.##..#
..#..#.#..
........##
..#...#.#.
.##....#.#
#..#.....#
.........#
#..##.....
#.##.#..##
.#.#.#.###

Tile 2243:
..#.##..##
.........#
#....##.#.
.#.#....##
##...#....
.#....#.##
#....#.#..
#.#..#....
#..#...#..
....#####.

Tile 3541:
#.#...##.#
#..#..#.##
..##.##..#
.....#.#.#
....#.####
#...#..##.
...#...##.
#....#..##
..##....#.
..#..#.#.#

Tile 3229:
.....#..#.
#...#..#..
..#.#.....
##.#..#.##
##.....#.#
..#.#.##..
...#...###
.##.......
..##......
..#.##.#.#

Tile 1019:
..####.#.#
....###..#
##........
###.....#.
##..#..#.#
.....##...
..#...#..#
......#...
#..#.....#
.....####.

Tile 1663:
#.##.#####
#.##..##.#
#.......##
#...#.##.#
......#...
#...#....#
.....#..##
#.#.#.##.#
....#..#.#
#.###...##

Tile 1567:
.##.##....
..#..#..##
.#....##.#
....#...#.
#......#..
#..#....#.
#...##....
....#...#.
..#....###
#.#.#.##.#

Tile 3833:
.#.....#.#
#.........
#...#.....
.#..#....#
#..#.#....
#....###..
...###...#
.#.#.#....
##..#....#
#..#.#..#.

Tile 2551:
###.#....#
.....##...
.#.......#
..###..###
#.#...#..#
#......#.#
.#..###...
.......#..
#.#..#...#
###...##.#

Tile 1637:
###.##...#
..#..#....
..###.##..
#........#
#.#......#
......####
#....#.###
#.###.....
.#.#.....#
##.##.####

Tile 2281:
#####..#..
.##.#..###
#..#.##...
.#.#.#....
#.#.#...##
..##.##...
.....##..#
..#..##...
##..#..#.#
##....#..#

Tile 3559:
##.#.#.#.#
.....#.#..
#....#...#
....#.....
###....#.#
..........
##..#....#
.....###.#
#.........
...#......

Tile 3511:
.##.####..
#.........
##.....#..
#......##.
##.....#.#
#.....#.##
.#..#.....
#...#.#..#
#..#.#.#..
.###.#.###

Tile 2063:
.....#.###
##.#...#.#
#....##..#
...#.#...#
#.#.#....#
.#........
..#..###.#
#...###...
.#....##..
..#.###.##

Tile 3187:
......##..
.#....#...
...#.####.
.##.#...#.
#........#
.#...#..##
.#....#...
#..#####.#
....##..#.
#..##.#..#

Tile 3407:
#.###...##
.#........
..##..#..#
.##.#...##
.....#.###
#.#....#.#
.#..#.#...
.#.#..#..#
#..#.#.#.#
...#.#.###

Tile 1597:
.#..#..#..
..#.......
.#.###.#..
##..#...#.
.........#
#.##..##..
....#.....
.#..#...##
#.....#.##
###....#.#

Tile 2087:
#.#..##.##
.##......#
.......#.#
.....#..##
#..#.....#
.#.......#
......#.##
.##....#.#
.......#..
#.#.###.##

Tile 2749:
#####..#.#
#..#...###
...#.#...#
#......#..
##.......#
.#.......#
.#.......#
#..#..#...
.###..#.##
.##.....#.

Tile 1697:
.##.###...
.##..#...#
##....#..#
#....#..#.
.........#
...#..##.#
#....#....
#....##...
..#.##.#..
##....##..

Tile 2711:
##.##.##..
.#..#....#
.#...#....
...#.#....
.##.....#.
##.#..#...
..#...####
##...##.##
.......##.
..#....###

Tile 2521:
.##......#
....##....
.........#
#.##..#...
..........
..#.......
.#........
...#..#...
.......#..
##....#.##

Tile 3163:
.##.#.....
#.........
#........#
#...##.#.#
.#........
.#.#......
........#.
#......###
###.#..#..
###.####.#

Tile 3343:
.#..######
#######..#
...#...#.#
#..#.#...#
.#..##..#.
#...#..#.#
..........
#.###...#.
#..#...##.
#.#.##..#.

Tile 1303:
...#.####.
#..#......
###.#....#
.#.#.....#
.#..#....#
..#.....##
.......#.#
..#..#..##
##..#.##.#
#..#....#.

Tile 3491:
#..##..#..
#.#....##.
#...#..#..
#.#.#.#...
.###.#...#
#....#....
...#..#..#
.#..##.#.#
#.#....###
##...#...#

Tile 3767:
.##..#.#..
#..#....#.
......#...
...#.#..#.
##......##
..#....#..
......##..
#..#....#.
..........
..#..#.#.#

Tile 1823:
...#.##.#.
....#.....
.###......
...#.#....
#..#..#...
#..#.#..##
#...#.....
.#..#....#
..###.#...
.#..#.#.#.

Tile 3863:
.#####.#.#
#.##.#####
...#.#....
..#.#.#..#
#........#
#..#.##...
...##....#
###..##.##
#....#.#..
...#.#####

Tile 1867:
..#.#...#.
##.####...
..........
##.#..#...
..#....#.#
#....#.##.
#..##..#.#
....##..##
...#......
#....##.#.

Tile 2341:
#.#....#..
#........#
..#.....##
.....#.###
....#.#.#.
#..#..##.#
#..##....#
..#..#..#.
#.......##
#.##.####.

Tile 2411:
.#..##....
##.##..#.#
##..#.#...
##...#..##
....#....#
#..#..#...
.....##..#
....#..#..
..#.#..#.#
..##...###

Tile 1523:
...#.##.#.
.#.##....#
#..##.#..#
.#...#....
#......###
#..#......
#.#.#.....
##..##....
..........
.#.##..##.

Tile 2609:
###...####
##...##..#
.#.#.#.##.
.#...##...
##..####.#
...##.##.#
..#...##..
......#..#
#.#..#...#
..##...##.

Tile 2287:
#######.##
#....##.#.
.#..#..#.#
#..##....#
#....####.
....##....
##..##..#.
#..##.....
..##.....#
#..##.##.#

Tile 1049:
#.##......
...#..#..#
.#....###.
###.####..
.......#.#
..#..#..#.
.......#..
.##...#...
....#..##.
.#####...#

Tile 1187:
###....##.
.##.#.#..#
..#.......
##..##.#..
####..#.##
..........
..#.......
.........#
##.#......
...#####.#

Tile 2707:
##.###..##
....###..#
#.##.#....
...#.##.#.
.##..#....
...#..##..
......#..#
...#.#.#..
.......#..
.###.#.#..

Tile 2441:
#.#...#.#.
.####...#.
#.#.......
.....#....
#..#...#.#
...#....##
##.....#..
#..##.....
#..#....#.
.#.##....#

Tile 3571:
.#.###...#
...#.#...#
###...##..
#..###.#..
#..#...#..
....#.##..
#...#.#..#
#..##.....
#.#.....#.
##..#.#.##

Tile 2969:
.######...
#.#...#..#
....#....#
...#..##..
#..####...
...#.#...#
#..##..#.#
..#.......
#..#.##...
.#.##.##.#

Tile 2699:
#..###..#.
.#.#......
..#..#.#..
.....###..
.........#
..##.##..#
.....#...#
#.#..##...
#...#...##
###..#..##

Tile 1759:
#......###
.........#
#...###..#
###......#
####....#.
..........
.......#..
.#.....#.#
#.#.....#.
...##.###.

Tile 2843:
..#.###.##
.....#...#
..#......#
#..#..#...
...###.#..
..##..#..#
...#..#...
#....#..##
#.#.#.#..#
####......

Tile 1063:
...#.#.#.#
.#.##.....
##...#..##
#.#.###..#
.#..#..#.#
...####..#
#.###..#.#
..#..#....
####....##
...##.....

Tile 2161:
.#.#..#..#
...#..#.##
.#..##.#..
#........#
..#.......
#......#..
.##.....##
.#.#.##...
.#.###...#
#.#.#.#.#.

Tile 1543:
#..##.##..
#...#.....
#..###..##
#....#..##
####......
###.......
.#........
##.#......
##....#...
..#.####.#

Tile 1979:
..#.#....#
#..##.....
.#.##....#
##........
....#.#..#
#...#.....
#......#.#
#...#....#
.#..#....#
#..###.#..

Tile 1607:
#..##.....
#.......##
#..#.##.#.
.......###
.#..##....
....##..##
##..#.....
#....#.###
.........#
.#...####.

Tile 2957:
#####...##
#.#...#.##
##....###.
..........
#.......#.
...#...##.
.......###
##..##.#.#
.#..###.#.
.#.###..##

Tile 3221:
..#.#.....
.#...#.#.#
....##..##
#..##...##
..........
.#........
..#.......
#..#.....#
...##.#.##
...####..#

Tile 1213:
#...#.####
.........#
#.##..#..#
..#...#...
##.##....#
.....#....
.........#
#...##..##
#.......##
####..#.#.

Tile 3023:
##..#..###
..###.#.#.
##.#......
.....#...#
..#..#..#.
##........
##.#.#.#..
...####.##
.....#....
#.##....#.

Tile 1489:
.###..#...
#........#
##...#.#..
##..##..#.
....#....#
.....##.#.
#...######
#....#...#
...#.###..
#.#.#.#.##

Tile 1601:
..#...##.#
........#.
#...#....#
#....#....
###.#.#..#
...#####.#
...####.#.
#....##...
.#...#...#
...#.#.#.#

Tile 2953:
#.#...###.
#..#...#..
.........#
#.#.#....#
#..##.#..#
#..#......
##.#..#.##
#.#..#..#.
.........#
...##...#.

Tile 1481:
......#...
......#.#.
#........#
..........
#..##....#
.#..#...##
.##.....#.
##..#.#...
#......#..
##..###.##

Tile 1531:
..#.#...#.
.....##...
.#....#.#.
..#....#..
#.#.###...
#....###..
........#.
#....#.#..
##.#......
#...###..#

Tile 1039:
##.#..#...
#.#...#...
#.#.#...##
.#.#.##..#
##...##..#
##..##..#.
#.........
#.#.#..#..
.#..#..#..
.##......#

Tile 2549:
.##.####.#
#..#...#..
#..#..#.#.
...##.#..#
#..##.#..#
##.#.#.###
...##..#.#
......####
..##.#..#.
######.#..

Tile 1913:
..#....#.#
#....##..#
#.#....#..
...##.....
.....#.###
....#..#..
##...#.#..
..#...#...
#...#...#.
.##..###.#

Tile 1831:
..#.....##
##.#..##.#
....###.##
#.........
####.#..#.
###..#..#.
#..##....#
#.......##
....##...#
##.##.#..#

Tile 2099:
...##.##.#
..#.....##
.....#...#
..#..#..##
.#####..#.
.....#...#
..#.....#.
.....#...#
.#...#...#
#.#..#....

Tile 3209:
####..#...
....#....#
....#.#..#
....##...#
....#.....
.#.....#..
.###...#..
...#....##
#.#......#
..#.#..##.

Tile 2593:
#.####.#..
###...####
#.......#.
##.##...#.
#.....#.#.
...#...#.#
#.#.#....#
###....###
#...#....#
.###..####

Tile 3011:
#.#.####.#
##.#....##
##.......#
.##.#.....
.#....###.
.##...##..
.#...#.#.#
##...#..#.
#.#....#..
.#..#.#.##

Tile 2371:
##.#####..
#........#
#.#...#...
##...#.###
#.......##
...#....#.
#.#......#
..####.###
#...#..#.#
##.##...#.

Tile 3853:
###.#.#.##
.........#
#..#.#.#..
#........#
#...##...#
##...###.#
.#.###....
...##....#
##..#.##.#
##..#.#.#.

Tile 3821:
..#.##...#
#.##....#.
.#.#####.#
#.#..#.#.#
..###....#
...###...#
##.......#
.##..#..#.
###......#
#...#..###

Tile 2591:
##...#..##
#.##.#..#.
#..###...#
....#...##
#.......#.
....##...#
...#.##...
.##....###
......#..#
#.#..#.#.#

Tile 3041:
#.###..#.#
...#......
...##.#..#
.....##.#.
.#..#..##.
....#....#
#.#.......
...#####.#
#..##..##.
#.###...#.

Tile 1667:
####...#..
..........
..........
#.#..##...
..#..#....
..#...#..#
......##.#
#.#....##.
.....#...#
..########

Tile 2003:
..##..#.##
###.#..#.#
...#....##
.........#
#........#
.#......##
##..##.#.#
##..#..#.#
..#....###
#...#.#...

Tile 1447:
#####....#
..#......#
#......#.#
#..#.....#
#..#.####.
#....#.#..
#..####...
#....##...
#.#.......
.###..##..

Tile 2333:
##.##.###.
#....#..##
#....#....
#.#.......
..........
....#....#
#..#...###
...#.....#
#..##.#..#
###...#.#.

Tile 1571:
.....##.#.
......##.#
..#......#
..........
#.....#...
#..#..#...
#.#...#...
....##....
#..#..##..
#....##...

Tile 1181:
..#...##..
##.......#
#..##.#...
###...#.#.
#.#..#.#..
###....##.
.....#....
##..#.....
.....#..#.
#...#.##.#

Tile 1117:
###.#...#.
#.........
...#....#.
#..##..###
##....#.##
.....##..#
....##..##
.#.###...#
#.#.......
.##...#.#.

Tile 3623:
#..#######
#....###..
.#....#...
#....#.##.
..#.......
#..######.
#.........
#...#.##.#
....#...#.
#####.###.

Tile 2111:
##.#..#..#
#..#..##..
#..####...
#......#.#
#...##...#
......#.#.
..........
....#.#.#.
..........
.###......

Tile 2579:
.....#..#.
#.#.....#.
#..#.....#
#........#
....#..#..
......##.#
..##.#.#.#
...#..####
.#........
#.##......

Tile 2477:
.#..######
.#........
..#......#
#...##...#
...#.....#
#..##.#..#
..#.#....#
##.#.....#
.#.#......
.##...##..

Tile 1621:
.#.##.####
#........#
....#.#.##
#...#.#..#
.........#
.#....#..#
....#....#
#......#.#
..##....#.
##.##.##..

Tile 2297:
.#..##.#..
...#....##
....###..#
#..#...##.
#.##......
.###......
#.......##
......#...
.#....#.#.
#......#..

Tile 2237:
##.#.#.###
#..#....#.
.#..##...#
..#..##...
.......#..
......##.#
...#..#...
.....###.#
#....#....
.##.#.####

Tile 1097:
##.#...#..
..#...#...
#..##.....
.#....#..#
...##....#
..#.###.#.
......#..#
#..#..##..
#..##.#...
.#.#..##..

Tile 3037:
###.##.#..
##..#..#.#
#........#
..#.....##
....#.....
...#.#..#.
#.##.....#
..........
.##....#.#
.#.#.#...#

Tile 2617:
##....###.
##.#...#.#
........#.
.......#..
#....#....
...#....##
......#.##
..####...#
.#...#..##
.##..##..#

Tile 2273:
...#.###.#
#.##.#..##
.....#...#
.#.#....##
#.....#..#
#.#......#
...#.#....
...##..###
##.....#.#
##....###.

Tile 1321:
.##..#####
#........#
#....#...#
...#...#..
.....#....
#.#...#..#
#......#..
##..#.#..#
.##....#.#
#.####.#.#

Tile 3299:
##....#.##
..........
#.#.#.#..#
..#......#
...#......
....#....#
#.......##
...#.....#
...#...#.#
.#...##...

Tile 2467:
#.#......#
#.....#..#
##.###.#..
..#..##..#
.#..#....#
.#..#...#.
..#....#..
.#....#...
#.#..#...#
#..#####.#

Tile 3313:
#.##.....#
#....#.#..
.........#
#.#.##.#..
##...#.#..
#..#..##..
#.....##.#
##...##...
#...##.###
#...#.##.#

Tile 2677:
..##.#.##.
.........#
..#...#.##
..#..###..
##.....###
..#......#
..#.#.#..#
.###....##
#..##.##..
...#.##.##

Tile 2207:
.####.####
##..#.....
#.#..#.#..
#.##.#..##
#...#.#..#
.#.....#.#
......#..#
....##..##
.....#....
...##..##.

Tile 3769:
###.##..#.
##...#....
#.........
#...#..##.
.#...#.#..
..###....#
.........#
#...##...#
###.#.#.#.
.##..##...

"""


satImgTest =
    """Tile 2311:
..##.#..#.
##..#.....
#...##..#.
####.#...#
##.##.###.
##...#.###
.#.#.#..##
..#....#..
###...#.#.
..###..###

Tile 1951:
#.##...##.
#.####...#
.....#..##
#...######
.##.#....#
.###.#####
###.##.##.
.###....#.
..#.#..#.#
#...##.#..

Tile 1171:
####...##.
#..##.#..#
##.#..#.#.
.###.####.
..###.####
.##....##.
.#...####.
#.##.####.
####..#...
.....##...

Tile 1427:
###.##.#..
.#..#.##..
.#.##.#..#
#.#.#.##.#
....#...##
...##..##.
...#.#####
.#.####.#.
..#..###.#
..##.#..#.

Tile 1489:
##.#.#....
..##...#..
.##..##...
..#...#...
#####...#.
#..#.#.#.#
...#.#.#..
##.#...##.
..##.##.##
###.##.#..

Tile 2473:
#....####.
#..#.##...
#.##..#...
######.#.#
.#...#.#.#
.#########
.###.#..#.
########.#
##...##.#.
..###.#.#.

Tile 2971:
..#.#....#
#...###...
#.#.###...
##.##..#..
.#####..##
.#..####.#
#..#.#..#.
..####.###
..#.#.###.
...#.#.#.#

Tile 2729:
...#.#.#.#
####.#....
..#.#.....
....#..#.#
.##..##.#.
.#.####...
####.#.#..
##.####...
##..#.##..
#.##...##.

Tile 3079:
#.#.#####.
.#..######
..#.......
######....
####.#..#.
.#...#.##.
#.#####.##
..#.###...
..#.......
..#.###..."""


rulesTest =
    """
       0: 4 1 5
       1: 2 3 | 3 2
       2: 4 4 | 5 5
       3: 4 5 | 5 4
       4: "a"
       5: "b"
"""


messagesTest =
    """ababbb
      bababa
      abbbab
      aaabbb
      aaaabbb"""


messages =
    """babbbbabaabaaabbbbbaaabbbbababba
            ababaaaaabbbabbbbbabbbba
            aabbaabaabbababaababbaba
            bbbbabaaabaaabbbbbbbbaab
            babbbabababaabbaaaabbbba
            bbaabbababbaaabaaaababbbabaaaaaaaaaaababbaabbbbaaaaaaabaabababbbbabbbaababbbaabbbbababab
            babbabbabbaababbbbbbbaab
            baababababbaababaaabaaab
            aababaababbaaaabbbababbbbbbbbbaabbbbabbbbbabbababbababaabaabaaaabbabaaaaabbaaaaa
            baabbbbaaabbabbbababbbba
            baabbabaaaaababbaababbbbaababaaabbbbbaaabababaab
            babbabbabaabbabbaabbabaa
            baaabbbbabbaaabbaaaaaabbbbabaaba
            abababbaaabaabbbabbbaaaa
            ababababbbbaaaababaabaaa
            baaababbbbbabababbbaaabaaaabaababaaabbbbaaabbbbaabbaabbbabbbaaab
            babaaabaabbabaababbabaaaabbbaaaa
            ababaaabaabaabaabbbbababbbaabababaababaaabaabbbb
            abbaaaabaabababaabaabbaa
            baaaaaabaaaaababbababaaa
            aabaaabbababaabbbaaabbbbaabbbaaa
            baaabbbaaaaaaaaaaabbbbba
            abbbbbabbbbabaabaabbbbabbbaabaabaabbbbbb
            baabbbababababbabbaaaaaaabbbaabbbababbbaababaaaaaabbbbaa
            bbbbbbbbabababaabaaabbbabbaaabbbaaaaaabaabbaabbabbabbbba
            abaabbabaabaaaaabaabaaaa
            aabababbababaaaaabbbbbaa
            bbbabbaaabaaaababababbbabbbaabab
            aabababbaabbbababaabaaab
            aabaaababaabbabaaabaaaab
            abbbabaabbaabbabaaabbbba
            baaabbbbaababbabbbbabbaabaabbbbbabbbbabbbabbaaba
            bbaaababaabaaabbabbbbbabbabaaabbbbaabbbbaabbbaaabbabbabb
            baabaabaaababbbbbbaabbaa
            bbaaabbbbababbabaaaababa
            bbabbbbabaaaaabbbaaaaababbbbbaaabaababbbbabbabaabaabbabaabbababbaaaaaaabbbabaaabbbbbbabb
            abaabbbababaaaabaabbbbbbbbabbbab
            ababaaaaabababbabbbaababbaaabbaaabbaaaba
            bbabbaabababbabbbaaaaaabaaabaabb
            baabaaaaababbbbabbabbabbbababbaa
            aaaaaaaabaaabaabababaaba
            baabbababaaabaaaaabaabaaaababbbbaaabbbbb
            abaaaabaabbababaababbbab
            bbaaabababbababbababbbbb
            baababbaaaabababbaaaaaabbaaaabbb
            bbbbbbbaabababbabbabbbba
            bbaaaaaaaabaabbbabaabbaa
            abbabababbaaaaababbbabbbbbaaaaaaababaaaababaaaba
            abaababbaabaaaaaaabaaaab
            abababaabbaaabbaabababbaaabbabaa
            babbabbbbbbbbbbabbaabbaa
            bbabbbaaaabaaababbaaababbaaabaabaabbbaababbaabaaaabbbaaaabbaabbbaabbbbba
            abbbaabbababaaabbababbbaabbbbababababaaa
            bbaaabbabbbaabaaabbbabaaaaababbbbaababbb
            baabaaaabbaaabbaaabbaababbbbbbababbbabbbbbbabbba
            abaabbbaabaababaaaabbabb
            bbbbabaaaabaabbbbbbbbaab
            bbaaaaabababbabbaababbab
            babbaabaabbbbaaaaabbbbbb
            baaabaabbbbbaaaaabbbaaab
            aaabbaabbabbabbbbabbbbba
            aabbababaabababaaabbabbbbbbbbbbaaaabbaaaababbabbabaaabaabbababaabbbbbabbbabbbbabaabaabaabaababba
            ababaabbaabbbabababbabab
            bbbabbbabaaabbbaaaabbbab
            aabababbaabaabaaabaaabbbaabbbaaa
            aaaaaabaabbabbaabbbbaaaaaabbaabbaaabaaaaabbbbaabaaaabbbaababbbbbababbaaa
            ababaabbabababbabababbbaaabababaaabbbbaaaabbbabb
            babbabbaabbabbbaababaaba
            abbbbaaabbbbbbbabbababbbbaabbaab
            babbaabaabbbbabbaaaaaaabaabbabba
            bbaaababbaabbabbbbbbabbbbabbabaabbabaaaa
            aaabaabaaabbababbababaab
            bbaaabbbababaabbaabaaababaabbbbbbbabbaaa
            abbabbbabaaabbbbbabbbabaaabbaabababbbbbaabbbaabababaabba
            aaaaaaaaabbabbaabbabbbaaaabababbbaaabaababaabbaabbababab
            aabbbabababbabaaaaabababbabbbbba
            abbababbbbbbabbaaabbbbbb
            bbbbbbbaabaaaaababbaabbb
            aabababbabaaabbaababbaaabbbbababbbabbabbbaaababbabbbbbabaaabaabaabbabaabaaabbaaa
            abbbbbabbbbbabaaabaabaab
            abbabbbabbbbabababbbbbba
            abababbabaaaaaabbbabaaaa
            aaaaababbbbbaabbaaabaabaabaaabababbabbabbbbaabbb
            baabbbbabbbaaaaababaaabb
            bbaaaababbaaaabaababaaaaaabbbaabbbbabaaa
            babbbbbbbabbbaaabababaabbabbbaabbbaaabaa
            aabaaabbaabbaabbbababaab
            baaaabbbbbabbbababbaababbabaaabaabababbaabaabbabbaaaaabaabbaaabb
            abababbabaabbbbaaaaababa
            aabbbbabbbbbaabaaaabbaabbbabaabababbbbaabbaabbabbaabbaaa
            aaabaabaaabbababbabbbababaabbabb
            bbbaaababbbbbbbbbbbababbabbbaaab
            bababbaaaaaabbbbbabaaaab
            bbaaaabaaaaaaabababbbabaaaaabaaa
            aabbabbbbbaaababbbababaa
            abbaaaababbbbbabaaaaabbb
            bbaaaaaabbbaabababaabaab
            ababaabbabaababbbbabbaabbbbbbbbbaaabbababbabbabbabbaabaa
            bbaabbbaabababbaaaababbb
            bbbbabbaaabaabaababaaaaa
            bbaabbababbbbaabbababbbabbbbababbbbaaabbbaaaababaababbbababbaabb
            bbaaaababababbabbabbbbaaabbbaaab
            babaababaaabbaabbbababaa
            ababababababbaabbabababa
            abbabbbbaaaaaabbabbbabaababaabbaabbbababbbbaabaaaaaaaaabbbaabbba
            bbbaaabaaaaaaaaaababbabbbbaabaab
            abbbaabbabbbbaaaaaaabaab
            abbbbbbbaaabbbbaaaababbaaaaabbabbababaabbbaabbabaabababa
            aababbaaabaababbababaabb
            babbaaabaabbabbbbbabbaaaaaaabaab
            aabababaabbbbabbaaaaabaaaabaabababbaaaba
            baabbabbbbaaabababaabbbb
            abbaaabbbbbabaabbbbbaabbabbbbaabbaabaaabaabaaaab
            bbaabbbabbbbbabbbababbbb
            babaababbbbababaabaaaabbbabbabaabaabababaabababb
            bbababbabbaabbbbbbbbabbbabbaabaaabbbaaaabbaabaababaaaaaa
            babbbbabbbbbbbaaababbbba
            abbbbababbbaaaaaaaabbbab
            baaaaaabaabbbaabbabbbabbabbaaabaababbaaaabbaaababbaaaaaabaaaaaabbaababababaaabbbabaabaaa
            aabaabbbabbbbaaaaababbaaababaabbabbbabbababaabba
            aabababbbbbbabbaabbbbbbb
            baabababbbaaaaababbbbaabbabbabbbaaababbaaaabaaab
            baaabbbababbaabaabbabaaa
            abaababbabbbbaabaababbbbbbbaaaab
            aababaababbbabbbababbaaa
            baaabbbbbbbbabbabbbbbaab
            bbabbaabaaabbbaaaabbbaaa
            bbabaabaababbaababbbabbbabaabbabbaabbaab
            bbbbbbbaaabbaabaababaaba
            aababababaaabbbaababbbaa
            babbbbbabbbababbaaababaaaababbaaaaabbbabaaababaaabbbbbbbbbbaaaabbaaabbaabaaaababbbaaaaab
            aababbaaabaaaababbbbabaaabbbbabaabbbbabbbabbbabb
            bbbaabaaaabbbbabaababbaabbabaababbaabaaaababbbba
            abaabbbaabbbaaabbabaaaab
            bbbbbbbbaaabbabababaaabbbbaaaabbbabaaabb
            baaaaabbbaaaaabbabbaaaaa
            ababaaaaaabbbaababbaabba
            bbaaaaaaaaabbababaaaaaaaaabaaaab
            bbbabababbbbabbaabaaaaaa
            bbaaaababaaabbbabbbabaabaabaabab
            bbbabbbaaabbbbaaabbaabbaabaabbbaaabbbbba
            babbabbabbbbbbbaaababababaaabaabbaaaaaabaaaaabaaabbbbbbaaabbbbbabbaabbaa
            ababbabbaabbaabbbaaaaabbaababaaaabbabbab
            abbabbbbbaabbbbbbabaabbb
            abbbaabbaaaaababbbaabbabaababaabaababaababbbbbbbbbaabaab
            baaaaaaabbbabbbaaaabbbba
            bbaaabbbababbbabbaaaabaabaabbabbbbbbbbbbabbabbabbababababbaababbbbabbaba
            bbbbababbaabbababbabbbab
            baaabaabaababbbbbbabbbbb
            abbbbababbbababbbbabbababbabaabbbbaaaabb
            bbaaaaaaabbbabbbabbbbbaa
            bbabaabaabbabbaaababbbaa
            aabbbaababaabbabbabaabba
            baaabbbaaaabaababbaaaabb
            babbbbaabbbbaabaabbbaaaa
            abbaabbbaababbabbaaabbababbbabab
            aaabaaaaaabbabababbbbabbbbabbbbbaaabaaab
            babbbaababbaaaaaaabaaababbaaabbb
            bbbbaababbaaaaaabbbbbaab
            bbaaaaaaabbbbababaabaaab
            babaababbabbabbbaabababaabaabaab
            abbbabbbabbabbaaaababaababbabaab
            bbbbaaaaaabbaababbabaaabbbabaaaabbabbabb
            aaabbaabbaaabbbbbbbbbaaa
            abbbbaabaabbbabaabaaabababaabbba
            babbabbabaaababbbbaaabbababaabaabaabbaababaabaaa
            babbabbaaabaabbaaaaaabaaabbbaabaabbaaaaabbbaaabaaababbaabbbbaabaabbbbaba
            aabaaabbabbaaabbbabbbabb
            bbaaaaaabaabbbbaabbbaaab
            bbbbaaaabbbaaabaabbbbabbbababaaa
            abbbabaabbabbaabbabbbbba
            aaaaaaabaababbbbababbbab
            abbbababbbabbbbabbbbbabbbabaaababbababaabbbaaaab
            babaaabaaabbbaaaaabbbbbbabbaaaaabaabaabbabbbababaababaaaaaabbaaababbbabbbaaababb
            abbababbbaaaaaabbabaaabb
            bbabbababbabbaabbababbbb
            babbbbaaaabbaaababbbbaaaaabbababaaabbaabbbbbaaab
            aabbaabbabaaaabbaabababaabaaaabaaaabaaaaaaabaabababababa
            abababbaaaabaabaaaababbb
            bababbabaaabbbaaababbbbb
            baaaababbabbbabababaabba
            abbbbabaaaaababbbbbaabbabaaaabbaaaababba
            aabbababbbaababbabaababa
            babbaaabbbaabaabbbaaabbabaaaaabaabbabbaabaabbaabbbbbababbbbabbbb
            aaabbbaaabbabbabaabaaaaaaabaaaaa
            aababbaaaababbbbabbbaaaa
            baaabbbabababbbaaabaabba
            bbabbaabbbbabaaabaaabbbbbbbaabababbaabbbbabbabbaaabaaabb
            baabaabaababababaaabaabb
            abbababbbbbbababbbaabaab
            abababbabababbabbaaaaaab
            bababbbaaabaaabababababb
            aabbabbbbaaababbbbabbaaa
            abbaaaababbabababbaabbbabbaabaab
            bbbabbbaababaaaabbbaaabababbaaaaababbabaaabbabaaaaaaabba
            baabaabaababaaabbbbbababbabbabbabababbbb
            bbbbbaaabbaababaabbbbbaaababaaba
            bbaaaabaabbaaaabbbababbbbbbababaabbabaababbbaaaaabaabaaa
            bbabaaaaababbbbbbababbbbbbbababbbabbbbab
            ababababbaaabaabbbbaababaababababaabbbaaaaababbbbabaaabb
            babbbabaaabbabbbaababbba
            aaaaaaaababbbababbaababbabbbaabb
            aababababbaaaaaabaaaaaba
            aaaaaaabbaaaabaaaababaabbbabbabb
            bbabbabbbbbbabbaabbbaabaababbbaabaaabababaabbbbbbabbbbbb
            bbbaabbaabaaaabaabaaabaa
            babaabbabbabbaaabaabaaaaabaabaaa
            aababababbbbaabaabbbbbaa
            baabababbaabaabbaaaaaabbaaaaabababbabbaaabbabbaaaaaaabbb
            bbabaabaababbabbbabbaabb
            abaaaababbbbbbbabbabaaaa
            bababbabbbbbabaababbbbbb
            aabbabbbbbbbabababbabaab
            abbababababbabaaaabbbaaa
            aabababbabbaabbbbbbaaaabbbbbaaaa
            abbbabbbaaaaaaabbaabbbbb
            bbbbbbbaaabaaababbbbababbabaaabaabababbb
            aaaababbaaaaaabaaabaabba
            abaaaabbbbbbababbbababbbabaabaaababaabaa
            bbabbbaaababbabbbbbaaaab
            aababaaabaabbbbbbbbabbbb
            aabbbaababbbbbabbababaaa
            aabbaaababbaababbbbbababbbbbababbbbbaabbbaabbbbbabaabbaabbbabbbb
            baaabbbbbbbaaabaabaabaab
            baaabbaaaababaabbabaaaaa
            aaabababaababbabaababababbbbbbaabbabbbaabaabaabbaaabaabaababbbbb
            aabaaabbbaaabaaabbbabaab
            bbbaabbaababbabababbbbbababbbabbbbaabbbbbbabaaaaaaaabbab
            aabbaaabbbaabbabaaababbb
            bbbbabaabbbabbbaaabaaaab
            aabbaabbbabaababbaababaa
            aaaaaaaababbbbababaaaabaaabababbabaaababababababaaabbabbababbbbbaaaabbab
            babbbbabbababbbabaabbaaa
            aabbaaabbbaababbbbbbabaaababaabbbabaaabaaabbbabbababbaba
            bbbaaaaabbaaabababbabbbb
            bbbbabbababbaaaabbbabbbaabbaabbbbbaabaaa
            aaaababbabbaababbabababb
            bababbabaaabaaabbaabbbaabaaababa
            babaababbaaaaaabababbaabbababbaaaaababbb
            aabbabababaaabbababaaaba
            bbbaaabbabaababbbababbaa
            abbabbbaabbaababbabaabba
            baaababbaaaaaabaaabbbaaa
            baaaaaabaabababbaaabbaabababbaababbaaabbaababbba
            abbbbabbbbabbabaaaaaaabbbabbaabb
            abbbbaabaaabaababbbababaaabbbaabbabbabbabbabaaababbabbbbbaababaa
            bbbabababaabbaaabbaaababbabaaaaabbaaaaaa
            abbbbaababbbabbbaabaaaab
            bbababaaaaaabababaaabbbbbbabbaaababbabbabaaaababaaaabababbabaabaabaabaab
            bbbabbaabbbbabababaaabaa
            abaaabbabaaaabaaaaabbabaababbaba
            babbaabaabbabbaabaaaaaba
            aababababbabbbaaabbaabba
            bbbabaabbaaabbbabbabbaaa
            bbbababaaabbabababababbb
            aabbbbababaaaabbbaabbabbbaabbaab
            bbaaaababababaababbbaaab
            abbbaabbaaaaabbaaabaaaabbabaaabaaaaabbabbaababaa
            babbabaabababbabbbbbabbbaabbbaba
            bbbbbbbaabbbaabbbbbabbab
            abaabbabbaabaababaabababbbbaaababababbaaaabbbabbabbaabbb
            abababbabbaaaaabaabbabba
            abbabaaababbababaabaababbabaaaaabbaaabaabbabbaaa
            babbabaabbababbbbbabbaaa
            aabaaabaababaaaaaaaabbba
            bbaabbbabbbbaaaabaabababaabaaabaaabbabba
            abaaaabaaabaaabbabbabbbb
            abaaaaabaaaaaaaabaaaaaba
            aaabbabababbbbaaaaaabbbb
            bbbbaabbabaaabababaaabbababbbabaababbaabbabaabba
            bbbabbbaaabbbababbaaabbbbbbabbabbbbbbabbabbbbbbb
            abaaaababaaabaabababaaba
            baaabaaabbabbbaaaabbaababaaaabba
            bbbbabbbbbaabbbabaabbbbb
            ababbaababbbbabaababaaaaaabbaaabaaaaabbb
            baaaababaaaaababbababbaa
            aabaababbabbaabbbaabbababaabbaabaaabaaabbabaabbababaaabbabbbaaab
            abbabbaaaaaaabbabaaaabbaababbaaa
            bbbbaabaabbbbabbaabbabbbaababbbbbabaaaba
            bbbaaabbbaaabbbaaaababbb
            baaabbbabbbaaaaabbbaaabaaabababbabaaabbababbabab
            aabaaabbabaaaaababbbaaab
            bbaaaaabaabbabababbbbaaababbababaabaabba
            bbaaababbbbbaaaabababbbaaaabbabb
            bbababbbbbabbababbbbabaabbbbaaaaaabbbaabbabbabbbbbbabbbb
            bababbbaaaabbaabaaaabbba
            ababbaababaabbabaaaaabba
            aaaaaabaaaabbbaaababbaba
            babbbbaaabbbabbbbbbabbab
            bbbbbbbabbbbabbbabbaaaba
            baaabaaaaabbaabbabaaababaaababbb
            baabaabababbabbbaabbbabb
            bbaaaaaaabbbbabbabaabbabbabbaaabaaaababaaaaaabba
            baaaaaaaaaaaaaaaaaaababa
            abbaababaabbbbabaaababba
            bbbbababaabbbaabaababbaaaaabaaab
            aababaabaabaababbbbbaaaaababaaaaabaababbbabbbbaaabaaaaabababbbab
            babaababbbaabbabbbaabbaa
            baabbababaaaabaabababbaa
            bbaaabbabbaaabbbbbabbabb
            baabbbbabbaaaabaaaabbbba
            bbababbbbaabbbbaaaaabaab
            aaabababaaaaaabbabaaaabababbbbbb
            bbbbbbababaaabbbbaaaaaaabbaabbaabbbbbaabaabaaabbaaabbbbabbaabaabbbbaaabbabbbaabb
            aabbbaaababbabbbbaabbbbababaaaaababaaaaaaaababbbaabababb
            bbabbaabbabbaaaaaaaaabba
            abbabbaabbaabbabaaabaabaabbaaaaaaabaaaabbbaabaabaabbabaa
            abaababbaabbaaabaaabaaaabbaaaabaabaaababaababaaabbbabbababaaabaaabbaabbabbaaabaa
            bbaaaaabbbbbabaaaababbaababbabbbaaabbabababbababbabbbbba
            babbbbaaaababbaaaabaabbbbaabbbaababbbbbb
            aaaababbbbbbbbaabbbabbbb
            bbaaababbbaaabbaaabbbabb
            abbaaabbbabbaabababaabbb
            aabababbabbbbbababbbaabbaaabaaaaabbabbaababaabaabaaaaabaaababbbaababbbab
            babbaaaaaabbbbabbbbbbbaabaabbbabbbbbaaab
            babbabaaabbaaabbbabaaaaa
            aaaaaaabababababbaababbb
            ababaabbbabbaaaaabbbbbbb
            aabbaaabaabbbabaaaababba
            baabbabaaabaabaaabbaaaaa
            abaaaabaaabbbaabbabaabaa
            bbaaabbbbaaabbbaababbbbb
            baaababbbbbaababbbabbaaa
            ababbbbbabbababbaaabaabbaabbbaaaaabbaaabbbbbababbaaaaabaaabbbbaaaabbabaaaababbbbabaabaaa
            bbbbabbbababababbaabbaab
            ababbaabbabbbbaababbabbabaaabbaabaaabaaabaaaabbbababaababaababbb
            baaaababbabbbbabbaabbaab
            bbaabbbaabaaabbbbababbaa
            bbabbbbaabbaaabaabbaabbaabaabbbb
            bbbaaaaabbaababbbbaabbababaababbabbaaaba
            aabababbaaabbbaaababaabbabbbbbba
            abaaaabaaaabaaaabaaaababaabbbaababaabbabaaaaabbaaababbbabaabbaaababaaaab
            baaabbbbbababababaaaababbbbaabaaaabaaabbbabbaabbabbbabaabbaaaaba
            abbbbabbbbbbabbbbabbbbbb
            bbbbabbbabbaaabbbbabaabaababaababbaaaabb
            ababaaaaaababaabbaabbabaabbbabaaababbaaaabbbaaaa
            bbbbbbbbbbbbaabbaaaabaab
            aababaabbabbabaaaaaabaab
            ababaaababbabbbabbaabaaa
            bbbababbabbbbbabaaaaabaa
            abbbaabbbabbbbabaaabbaaa
            abbaaaabbbaaaaabaabaabba
            aaabbabaaabaabbbaaabbabb
            ababaaababbbbaaababaababbbbaabbbbaabaaaa
            baabababbaababbabaabbaab
            bbaaabbbaaabaabaababbaba
            baaaaabbbbbaabaabaaabaaabaabbbbb
            aabbbababaaaaaabababbaaa
            baaaababbaaababbaaaaabaa
            aabababaabaabbababababbb
            bbaaaaaabaababbabbbbabaabbbbbbaaaabbaaabbababaab
            bbbbababaabababaaabbbaaa
            baaabaababbabbbaaababbaa
            babaaaaaabbaababaaabbbbaabababbababaaaababaabaabbbbaabbbaaaaababaabaabbabbbbbbbbabababbaabaaaaab
            bbbaababbaabbbbabaaaabaaabbbbbba
            aababaabaababaaabbbaaababbbabaabbbaabaab
            bbbbababaaabaaaabbbaaaab
            bbbbbbbbabbbabbbaababaabbbabbabbbbaabaab
            baaabaaabaaabbbbaabaaabbaaabaabaaabbbbaa
            bbbabaabbaaaababaaabaaab
            ababababbbbbabbbaaabababbaabbaab
            abbababbaababaaaaababbaa
            ababababaabbaabbbababaaa
            ababbabbaaaaaabbababbbab
            aaabbabbbaabababaabbaabbaaabaabbbabbaabb
            bbbbababaabaaaaaabaaaaaa
            bbaababaababbaabaaaabaaaaabbabaabaaaaaaaaabbaaba
            bbababbbbaaaaabbaaababba
            bbbbbbaaabbaababbaaabbaaabbbbabababbbbba
            aabbbaabbbbababbbaaababa
            aabaabaabaaabaababbabbbb
            bbbbabaabaabbbbababaabab
            abbbaaaaaabbbbbababbababbaaaabba
            aaaaaaabaaabaababbbaaaaaaabbbbbbbbaabaaaabbaaaba
            baaabbabbaaabaababbaabababbabbbabaabababaaababbbbbabbaabaabbbabb
            aaaaababbaaabbaabbaaaabb
            bbbabbbabaabbabaabbbabbaababaaaabbbbabbabbaabbaaaabaaabbabbbbaab
            baabaabaabbbbbababaaaabbbbbabaabbbbaaaabbbbbbaabbaabbbbb
            bbaaaaaabbabbaabbaabaaba
            abbababbbabbbbabbaaaaaabaaaaaabaaaaaabbb
            abaababbaabbbaabbabaabbb
            baabababbaabababbbbaaaaabbababbbbaaaabbb
            baabaabaabaabbbbbaabababbabababbbbabbbaabaaaaabaaaaabaaababbbbababbbaaabbbabaaba
            abbbbaaaaaabbbaabaaaabaaaaaabbaa
            baababababbaaabbbabbaabb
            aaaaaabaabababbabbabbbbb
            aaabbabaaabbaabbbbabaaab
            abbbaabbbbbbabaaaaaabaaa
            aabbabbbabaaaabbaabbbaaa
            aabbababbaaabbbbabbbbbabaabaabab
            bbbaababaabbbbbabbabaaaabaaaabba
            bbbbababaabababaaabbabaa
            ababaabbbbbbbbbaaaaabbbb
            aaabababbabbaaaaababbbbb
            bbbbabbabbbbbbaaaabaabbbbabbbbba
            bbbababbaaababababbaababbbabbaabbabaaabaabbabaab
            baaabbbaabababbaababbbaa
            aaaaaababbbabbaaaabaaaaaabababababbaabaababaaaba
            bbabbaabbbbbbbaabbbaaaab
            babbaabaabbaaabbbbaabbbaabababbaaaabbbaabaababbbabbbaaaa
            baabaabbbaaababababaaabbabbbbaaaaabaaaaababbabaaabbbbbbabaabaababbbbbaaabaaaaaaa
            abbaababbbbabaabababbaba
            bbaababbababababbbbbbaab
            bbbbaababbaaaababaaabbaaabaabbbbbbbbbaaa
            babbbaaabaababaababbbabbabbaabbabbaaaabaaababaababaabaaaabbaaaba
            bbababbbabaaaaabbbbbbabb
            babbabbbababaaaababbbabaaaabbababbabbbbbabababbb
            abbbaabbbbaaabbbaaabbabaaaaaaababaabaabbaabbbaabababbbabbbbbbbabababbbbbaaababaa
            aaaaabbabbbaaaabbaaababbbaaaababaaabbabbbabbabbaabbabaabaabbaaaaabbaabaababaabaababbabaa
            baaababaababbbabbaaaabbaababbaaababababababbaabbbbbabbbababbababaaabbbbaababbaba
            babbabbaabbbabaaabbaaaaa
            bbbaaabaaaabababbaaabbbabababbbb
            bababbbaababaaaabaabaabaaabbabbbbbabababbabbbaab
            aababaaaabaabbabbabaabaa
            aababbaaaaabbaabaaaababa
            babbbbaababbbbaaaaabbbaabbaababbbbabaaabbaaabbabababbbaa
            abaaaababababbabbababbbabbabbaabbbaaabaa
            aabbababaabbaababaaaaabbbabbaaaabababbabbbbabbaaaaabbbbb
            aabaaababbaaaabbaabbabaaaaababbabababbbb
            abbbbbaabbbabaaaaaaaabbaaabbbaaa
            bbbbabaaaabbbababbbabbbb
            bbbababaababaaabaabbabaa
            abaababbbaaababbbabbbbaaabaabaab
            aaabbaababbbbaaaaabbbbba
            aabaaaabababbaaaaaabaabbaaaabbaa
            baaabbabbbabaaabaaaabaabababbbbb
            abaaaaabbbaaaaaabaababaa
            bababbabbbbabbaaaaabbbab
            abaaababbaabbabaaabaaabbabbbbabaaaaababaaabaaaabbbbabbbbbaabbaaa
            aabababbaaabaaaaabbaabba
            ababaaabbabbabaabbbaaaaaaaaaaabbaaabaaab
            aabaaababbbababaaabaabaabbbbaaaaaabbaaaa
            bababaaabbababbabbbabaaa
            abaaabbabaaabaabbababbaa
            abbbabaabbaabbbababbbbbb
            aabbbbabbaaabaaabbaaabaa
            bbbbabbaabbbbbbaaaababaa
            abbbbabaaabababbaaabbbbb
            abaaabbaabaaabbbbbaabbbb
            aabaaabaaaaaaabaaaaabbba
            abbabbbaababbabbaaaabbbb
            babbaabaaaaaaaabbaabbbbabaaaababaabbaaaa
            ababbabbabaaaabbbbbababbaabbababbbbababb
            abbbabbbbabbbbabbbaabaab
            baaababbbbaaabbabbbaaaab
            abbbbaabbbbbaabbabaaababbaabaaab
            bbbbababbbaaabaaabbababbbabbbbababaababaaaabaaaabaaaabaaabbbaabababbbabbbaaaaaababbaabbb
            bbbbabaabbabaabbabbbbbabbabaaabbaabbaaab
            baabbabaaabbaababbbbbaab
            bbabaaabaabaaaababbbbbaabaaabbaabababbaaaabbaaabaaaababbaaaababaaaaaaaaaababbbbb
            abaaaabaabbbabbbaaaaababbaaaaaab
            abbbabbbaababbbbabaaaababbaaabbaabbbaabbbbabaaaa
            bbaaabbabbaababbbbbabbaabaabbbbabbbaababababbbaa
            bbaaaaaababbbbbbbaababaaababbaaabaabaaabbbababbabbabbbbababbaaab
            bbaababbbbaaabbbababbaba
            bbbaaabbbbbbabaabbabbaaa
            bbbababaaababbbbbaababaa
            baaaababaababaaaabbbbbbb
            aabbbbabaaaababbbabaabba
            baaabaabbbbabbbabbaaabbaabbbaabbbbaabaab
            aabbbaabbaaaaaaabaaaaabbbbbaabab
            baaaabaaaabbaabaabaaababaaaabaab
            aaaaaabaaababbaabaaaaaba
            aaabaaaaaabbbbabbaabbaaa
            abaababbbbbabbbaaaaaaaaaaabaaabbbaabbbabaaabaabb
            bbbaabbaabbababaabbabaaa
            bbbababbabbabbbabbaaabbabababbaaababbbbb
            abaabbbaababbbaaabbabaab
            aababaabaaabbababababbbaaaabbabababbbbaaaaaabbbababbabab
            bbabbbaaaaaaababbbaaaabababbabaaabbabbbbaaabbbbb
            aaaaaabbbbbaaabbbbaabaaaaabbabaa
            bbbaabbababbaabaaabbbbbb
            abbbabaaaaaaababaababbab
            bbabaabaaabbaabbaabbabba
            baaaabaaaababaabbbabbbab
            bbaabbbaaaabbaaaaaaaabaaaaaabbaa
            aabaabaaaababaabbbbaabaabbbaaabbbbabbabb
            aaabaabaabbbabbbaabbbbbb
            babbaaaaabaaabbbbbaaababaaaaaabaababbbababbabbbbaaabbbba
            abbababbbaabbabbabaabbabaaaaabbb
            ababaaabbaaaaabbabbbabaabbaabbbaabaaaaabbaabaabbabbbaaaa
            babbaaaabaabababbaaaabbb
            aaabbbaaaabbbabababaabaa
            bbbaaabaababbaabababaaba
            aaababbaaabbaababbbbabbabbbabbab
            abababbaaababaababbaabba
            bbaaabbabbbbababaaaabaab"""


rules =
    """25: 53 116
       122: 116 92 | 53 53
       100: 53 73 | 116 125
       111: 67 116 | 91 53
       71: 116 58 | 53 78
       55: 116 54 | 53 21
       123: 53 97 | 116 108
       104: 56 116 | 125 53
       19: 125 53
       56: 116 116 | 116 53
       60: 116 121 | 53 59
       75: 53 20 | 116 124
       6: 53 131 | 116 33
       62: 53 53 | 116 116
       101: 116 127 | 53 26
       128: 116 125 | 53 93
       34: 53 28 | 116 125
       65: 63 116 | 135 53
       50: 32 53 | 76 116
       2: 53 10 | 116 132
       133: 28 53 | 131 116
       85: 53 131
       125: 116 53
       118: 87 116 | 3 53
       135: 73 53 | 125 116
       28: 53 53
       110: 116 122 | 53 56
       91: 5 53 | 74 116
       73: 92 116 | 53 53
       80: 15 116 | 109 53
       124: 128 116 | 17 53
       87: 92 53 | 53 116
       43: 116 27 | 53 37
       66: 46 53 | 93 116
       106: 116 77 | 53 83
       137: 72 116 | 104 53
       93: 116 116 | 53 116
       129: 92 103
       12: 116 56 | 53 131
       45: 53 132 | 116 12
       102: 65 116 | 2 53
       24: 116 101 | 53 95
       14: 116 84 | 53 29
       57: 93 116 | 56 53
       70: 108 116 | 100 53
       51: 116 1 | 53 68
       26: 73 53
       15: 116 93 | 53 125
       42: 53 134 | 116 106
       79: 116 33 | 53 122
       5: 116 125 | 53 3
       74: 53 122 | 116 73
       18: 93 53 | 87 116
       20: 47 53 | 17 116
       114: 116 85 | 53 118
       37: 53 73 | 116 87
       47: 116 73 | 53 125
       107: 116 3 | 53 46
       69: 53 25 | 116 125
       32: 53 28 | 116 93
       76: 3 53 | 125 116
       38: 92 33
       119: 116 39 | 53 80
       8: 42 | 42 8
       21: 125 53 | 125 116
       58: 75 116 | 119 53
       64: 116 44 | 53 113
       68: 90 53 | 45 116
       1: 23 116 | 60 53
       53: "a"
       81: 73 53 | 33 116
       86: 116 129 | 53 35
       90: 110 116 | 13 53
       82: 53 93 | 116 25
       95: 99 116 | 66 53
       27: 116 56 | 53 3
       120: 116 51 | 53 40
       126: 116 96 | 53 52
       116: "b"
       84: 116 123 | 53 49
       134: 116 61 | 53 14
       78: 116 102 | 53 86
       96: 130 53 | 98 116
       10: 87 116 | 33 53
       88: 53 116 | 116 92
       40: 126 53 | 24 116
       127: 56 116
       59: 87 53 | 3 116
       11: 42 31 | 42 11 31
       41: 116 137 | 53 16
       44: 116 22 | 53 79
       109: 88 53 | 87 116
       49: 136 116 | 94 53
       113: 107 116 | 81 53
       77: 116 64 | 53 36
       3: 53 116 | 53 53
       9: 133 53 | 112 116
       98: 92 93
       117: 3 92
       39: 53 19 | 116 21
       16: 6 116 | 117 53
       132: 131 116 | 125 53
       63: 116 122 | 53 33
       22: 131 116 | 56 53
       89: 116 125 | 53 131
       115: 55 53 | 50 116
       99: 116 33 | 53 93
       92: 116 | 53
       121: 53 73 | 116 56
       13: 73 92
       103: 53 3 | 116 62
       83: 111 116 | 41 53
       61: 105 116 | 115 53
       130: 56 92
       136: 33 116 | 125 53
       30: 53 76 | 116 7
       94: 92 87
       52: 97 116 | 18 53
       7: 116 28 | 53 46
       97: 25 53 | 33 116
       35: 89 116 | 82 53
       72: 53 131 | 116 87
       48: 34 116 | 38 53
       54: 116 46 | 53 131
       131: 116 116
       23: 116 4 | 53 57
       31: 116 71 | 53 120
       29: 116 30 | 53 114
       108: 116 25 | 53 46
       33: 92 92
       4: 131 116 | 3 53
       36: 70 116 | 9 53
       67: 69 116 | 117 53
       0: 8 11
       105: 48 116 | 43 53
       46: 116 53 | 53 116
       17: 93 116 | 122 53
       112: 122 53 | 3 116"""


homework =
    """(4 * (3 * 2 + 2) * (9 * 7 * 5 * 4 * 9) * (7 * 7 + 7 * 4 + 9)) + 6 * 4 + 8 + ((6 * 5) * 4 * (2 * 8 + 4 + 7 * 9 + 3) * 2 + 6) + 3
              (3 * 2 + (6 + 4 + 3 * 6 * 4 * 8) * 4 + 4) + 2
              (9 * 8 * 4 * 8 * (4 + 8 + 7 + 7 * 5) + 3) * 5
              ((4 + 8 * 3) * (6 * 9)) + (3 + 9 + (9 + 4 * 4 + 8 * 7)) * 9 * (2 * (9 + 9 + 3 + 9) + 5 + 6 + 2 + 6) + 6 * 4
              4 * 2 + ((7 * 3 * 7) * 6) + ((9 + 3) + 2 + 7 + 8) * (4 * 9 * (8 * 5) + (3 * 2 + 2) + 3)
              3 + 6 + 3 + 9
              9 + 6 * 4 * 2 + 7 * 2
              (2 * 2) + (9 * 6 * 6 * (8 + 7)) + 3 * 8
              (9 * 3 + (5 * 4 + 7 * 9) + 2 + 7 * 9) + (4 * 9 * 3 + 8 + (4 * 8 + 5 + 8) + 8) * 3 + 6 + ((6 * 6) * 5 + 7 + 3 * 9 * 6) + 2
              (9 + 5) + 7 * 9 * 7
              4 * 6 + 3 + (3 * 7 * 4) * (5 * 9 * (4 + 6 + 9) + 9) + 4
              5 * (4 * 9 * 2 * 5 + (7 + 5) * 6) + (7 + 5 * 2 * (8 + 8 * 7 * 2 * 3 * 6) + 9 * 8) + 9 + 5
              2 + (9 * 3 + 5 * (6 * 6 * 3 + 5) * 7) + ((3 + 8 + 2) + 4 + 9) * 7 + 6 * 2
              3 * 6 + 8 + 6 + (5 * 8 + 8)
              4 * 7 + 9 + 4 + 2 * (7 * (8 * 4 * 5 + 5 * 7 * 2))
              (2 * 7 * 8 + (6 * 7 + 3 + 8 * 4) + (6 * 7 + 4 + 2 + 3 * 5) * 2) * 8 * 5 + 8 + 7
              7 * (5 + 4 + (8 + 7 + 8 * 4 * 7 + 9)) + ((3 + 9 * 2 * 8) + 4 * 8 * 3 + 7 * 2) + 2 + (6 * (9 * 9))
              6 * 7 + 9 + 2 + 4 + (4 * 7 * (8 + 5) * 3)
              6 + (3 + 4) * (6 + (2 * 4 * 3 + 2) + 9 * 7 + (3 + 3 + 2 * 4 * 6 + 8)) + (7 * (2 + 9 * 9) + (4 * 8 + 7 + 2 * 3 * 2) * 7 + 2 * (5 * 5)) * 7 * (9 * 3 + 3)
              (4 * 9 * 3 + 6 + 4 * 8) * 3 + (3 * 6 * 9 * 5 + 2)
              (8 * 2 + (5 * 2 * 7 + 5) * 7 + 2) * 3
              3 * (4 + 9 * (5 + 3 + 5) + 6 * (9 + 5 * 7))
              3 + (2 + (2 * 5 * 6 + 5 * 6) * 4 * 7 * 4) * 5 + 3 * (9 * 5 + (6 + 6 + 7 + 8) + (2 + 3) + 6 * 2)
              3 + 8 + 5 * (7 * 9) * 3
              6 * 2
              5 * (9 + 2 * 8 * 8 + 8) + 5 + 3 + (8 * 5 * 8 + 2 + (8 + 9 * 8 * 5 * 9) + (4 + 7 + 7 + 2 + 7))
              (7 + 3 * (4 * 6 * 8 * 3) + 6 * (2 * 7 + 3 * 5 * 5 + 3) * 2) * 2 * 6 + 8 + 9
              4 + ((3 * 2 * 7 * 4) * 6 + 6 + 9) * 6 * 7 * (4 * 3 + 4 + 9 + 4)
              (6 + 7 * 9 + 5 * 7 + 7) + 2 + 3 * 8 + 4 + (7 * 5)
              8 * 3 + 9 + 6
              9 + 3 * (8 * (9 * 3 + 9 * 7 * 6) * 6 * (2 * 8) + 2 + 6)
              ((3 + 5 * 5 + 7 * 6) + 7 * 5 + 2 * 6) + 2 * (8 + 4 + (8 * 4 * 5 + 4 + 3 + 6))
              4 + ((3 * 4 + 4) * (4 * 7 * 2 * 6 + 6 + 4) + 4 * 7 + 8 + 8) * 6 * 9
              (2 * (8 * 5 + 5) * 8 + 9 + 4 * 4) * (9 * 9 + (5 * 5 + 2 * 5 + 5) + 7 + 7 + 9) * 9 * 2 * 2 * (4 + 4 * 9 * 5)
              4 * 8 + (5 * 8 + 9 * 6 * 8 + 7) + 9 + (4 * 2 * 7 + 4 + (3 + 4 * 8 * 8) + 2)
              (4 + 6 + 8 + 5 + 9 * 7) + (7 + (6 * 4 + 5) + 5 + 5) * 5
              (3 * 4 * 9 + 3) + ((8 * 5 * 3 * 5) * 5 * 7) + (3 + 2 + (9 + 7 + 2)) + (2 * 2 * 9 * 9 * 5 * 8) * 5 + 3
              5 * 4 * (4 + 4) + 7
              4 + 6 * (6 + 5 * (3 + 3) + 5 + 3) + (3 * 4 * 2 * 9 * (4 * 4 + 7 + 2))
              5 * 2 + (4 * (7 + 5 * 4 + 7 + 5 * 2) + 4 * 8 + 4 * 5) + ((7 * 5 + 4 * 2 + 9) * 3 + 8 + (9 + 5 * 2 + 6 * 8 + 3) * (4 * 5) + 4) * 5
              ((3 + 9 * 6 * 6 + 7 + 6) * 8 * 9 + 9 * 6 * 5) + (2 * 5 + (5 + 2 + 4 * 4 + 8 + 6) + (8 + 2 + 2))
              6 + 4 * 9 + (2 * 5 + 6 + 3 * 3 * 4) * 7 + (9 + 6 * 4)
              3 * ((6 * 4) * 3 + 6 * (5 + 5 + 6) + 9) * 4 + 2 * (4 + 6) + 9
              7 + 7 + 4 + 7 + 2
              9 * 4 + 6 * (4 * 2 + 9)
              5 + 8 + (3 * 5 * 2 * 6) * 9 + (5 * 4 + 2 + (6 * 3 * 5) * (5 * 8 * 2 * 4 + 2) * 4)
              8 * 4 + 7 * 9 * 2
              4 + 6 * (9 + 4 + 6) * 7 + 3
              6 * 5 * 9 * 9 * (9 * 8) + 7
              6 * 7 * 6 * (5 + 7 + (3 * 4) + (8 * 9 * 6 * 8 + 8) * 2 * 4) * 9 + (4 * 8 + (8 * 2 + 7) + (4 + 5 * 4) * 6 + (3 + 4))
              (9 * 7 + 3 * 4 * (6 + 8) + 9) * 2
              8 * 9 + (6 + 4 * (3 + 7) * 7 + (8 + 2 * 4 * 2 + 8 * 9) * 2) + 9 + 7
              (4 + (6 * 9 * 5) + (6 * 7) + 2 + 2) + 7 + 2 * 3 + 5 * 6
              6 + 6 * 7 + ((5 * 8 + 4 * 3) * (8 + 6 + 4) * 7 * (7 + 7 + 4 + 7 * 3) * (9 + 8 * 6 * 2 * 3 + 3) + 6)
              (3 * 6 + 7 * (2 * 4 + 7 + 6)) + 9 * 7
              (3 + 2) * 4 + 3
              (2 * 2) + (6 * 2) * 5 * 7 + 3 * 4
              9 * 2 * 5 + 2 * (6 + 4 * 3 + 5 * (6 * 3 + 9 + 2) * 4) * (7 * 4 + 6)
              (2 + (9 + 2 * 6 + 7 * 9 + 7) + (6 + 5 + 6) * (2 + 4 * 2 * 4) + 2 + 4) * 4 + 3 + 4 * (3 + 3 * 8 * 9 * 7 * 7) * 6
              3 * 9 * 3 * (7 + 7 * 2 * 6) * 7 + 8
              ((9 + 4 * 4) * 8 * 6 * 2) + 6
              9 * 5 + 9 + (5 + 2 + 7 + 9 * 2) + (2 + 5) * 2
              2 * (9 + 8 + 9 + 5 + 4)
              3 * 8 * 5 * 4 * (9 + 5 * 9 + (5 + 3 * 5 * 6 * 2 + 8) + 2 * 2)
              ((4 * 4 * 9 * 7) * (8 + 9 + 6 * 9 + 3) * 8 + 6 * 7) * 2 + 3 * 3 + 5 * (3 + (6 + 8) + (9 + 4) + 7 * 4 + 9)
              5 * (8 + 6 * 8 * 8 * 2 + 4) * 4 * 5 * (6 * 2 * 9 + 6 + 8) * (8 * 6 * 2 + 8 + 7)
              9 * 8 + (4 + 2) + 7 * (5 * 5 + 4) * 4
              8 + 6 * 7 * (4 + 4 * 7 * (3 * 4 + 9) * (9 + 4 + 3 * 4 + 8 + 8)) * 5 * 4
              7 * (9 * 6) + 7
              4 * 4 * (3 * 3) * 6 + 8
              7 * 6 + 4 * (6 * 3 + 9) * 2
              (5 + 2 + (9 * 4 + 4 + 8) * (7 * 6 * 2) * 6 + 7) * (3 + 9 + 7 * 3)
              9 * (9 + 8 * 2) * (6 * 3 * 2 + 4)
              6 * ((6 * 6) + 2 * 9 * 3 + 4 + 2) + 9 + 8 + (6 * 5)
              4 + (6 + 2 * 3 + 4 + 3 * (2 * 3 * 6 * 3 * 8))
              9 * (3 + 4 * 7) + 7
              7 * (2 + 9) + 7 * 7 + 7
              (2 * (5 + 5 * 2 + 9 + 5 + 6)) + 9 * 4 * 3 + 3 + 9
              2 * (9 * 9 + 2 + (7 * 8 + 3 * 4 + 5 + 6) * 2) + 4 * 8
              7 + (6 + 4 * 8) * 7 + 6 + 7 + 9
              4 + (6 + 6 + 9 + 6 * 8 + 6) * 7
              6 * ((7 + 5 * 2 * 2) + 7)
              7 * 7 + 4 + 4 * (6 * 4)
              9 * (2 * 4 + 6 + 6) * (2 + 4 + 3 * 8) * 2 * (7 * 9 * 3 * 6 * (7 * 3 + 8 * 4 + 7 * 4) * (5 + 3 * 6)) * 5
              (7 + 8 * 4 * 3 * 8) + 9 + (8 + 3 + 3 + 2) * (3 * 3 + (9 * 9 + 8 + 5 * 3))
              2 * (3 + 3 + 8 + 2) + 9 * 9
              3 * (2 * 2 + 9 + (9 + 3 * 4) + 5 * 8)
              4 + (5 + 6 * 3 * 4) + (4 * 6 + 5 * 4)
              2 * ((4 * 9 + 4 * 8) + 4 + 9 + (2 * 4 + 2 + 4)) + (5 + 7 * 7 + 4)
              7 + ((6 * 2 + 4) * 2 + (9 + 7 + 4 * 7 + 9 * 9) + (2 + 6)) + 2 * 8
              5 * ((9 + 9 + 6) * 5 * 6) * 4
              3 * 7 * 3 + 7 + (7 + (5 + 7 + 2) + 7) * 8
              7 + 5 * 8 * 2 + (6 * 4 + 2) + 2
              8 * (7 * 7 * (9 * 7) * 5) * 9
              4 + (4 * (9 * 9) + 9 * 7)
              4 + 9 + 8 + 9
              (2 * 6 * 7) * 6 * 7
              (8 + (2 + 7 + 2 * 5 * 9)) * 4 + 5 + 8 * 9 * 4
              (3 * (8 + 3 + 4 + 5 + 6) * 7 * 5 * 8) + (7 + 3 + 4)
              3 * 8
              4 + (5 + (9 + 8 * 2 * 4 + 8) * (2 * 6) + (2 + 4 * 3)) * 9 + (7 + 4 + 7) + 2 * 5
              3 + 4 + 4 * 6 + 4 + 4
              (8 * 6 * 5 * 2 * 8 + 6) * 7 * 7 * 2 * 8
              (7 * 9 * 8 * 7) * 8 * 6 * 2 * 2 * 6
              8 * ((9 + 3 * 7 + 7 + 7 + 4) * 5 + 4 * 3 + 5) * 7
              9 * 9 + (2 + (8 + 2 * 9 * 2 * 6) * 4)
              2 + 7 + 2 + 7 * 8 + (5 * 8 * 6 + 6 + 8)
              2 + ((9 + 8 + 2 + 2 + 7) + 3)
              5 + 9 * 9
              2 * (6 + (2 + 3 + 2 * 8 * 3) * 7 * 3 * 8) + 7 * 4 + 3 + (2 * 2)
              ((2 + 7 * 7 + 2 + 3) * 7 + 5) * ((9 * 2 * 5) * 5 * (4 * 8)) + 6 * 7 + 9
              (5 + 3 * 6 * 8 + 3 * 5) + 8 + 9 + 5 + 6 + 9
              9 + (2 + 5) * (4 + 4 + 9) + 7 * 2
              9 * 2 * 6 * (8 * 8 * 5 + 5 + 5 + 8) * (5 * (6 + 4 * 6)) * 2
              2 + 5 + (2 * 4 + (7 + 3 + 4 + 5) * 3 + 8 + 6)
              ((9 + 7) * 6 * 3 * (8 + 5 + 4 + 8 * 7 + 2)) + (8 * (4 + 8) + 9)
              ((7 * 9 + 3 * 7 * 8 + 2) * (7 + 6 + 7 + 5 * 4 * 5) + 3 * 8) * 2
              ((2 + 9 * 6 * 9 * 6) * 5) + 3 + 6 * 6
              7 + (8 * (7 + 7 * 2 * 7 * 7 * 7) + 3 * 3 * 4 + 3) + 6
              6 * 6 * ((5 * 7) + 7 * (2 + 7) * (7 * 8 * 3) * 8)
              (9 + (4 * 5 * 9)) * 7 + 4 * 8 + (5 + 9 * 2 + (8 * 2) + 6 + 7) * 5
              ((7 * 3) * (4 + 4 + 8 * 9 + 8 + 5) + 4 + 3) * (7 + (9 * 6 + 4 + 3 * 5) * (7 + 4 * 4) + 4 * 7 + 2) * 4
              4 + (5 * 2 * 6) * 2 * (9 + 5 + 6)
              5 * ((6 * 9) * (6 + 9 + 6) + 8 * 8 * 9) + 4 * 9 * 6 + 5
              ((4 * 4 * 5 + 9) * (7 + 6 * 2 * 9 + 3)) + 5 * (5 + 3 * 3 + 8 + 5) * 8 + 2
              4 + 4 * (7 + 9 + 4)
              (3 + 5 + (6 + 5 + 4 + 8 + 9) + 5) + 4
              5 * 9 + (5 * 6 * (5 + 9 + 4) + 8 * 7 + 9) * 9
              (9 * 7 * 2) * 9 + (5 * 7)
              ((2 + 2 + 7 * 7 * 8 + 3) + (7 * 9 + 4 * 5 + 8) + 4 + 8 * 2) + 9
              9 * 8 + (7 + 6 * (4 + 5 * 9 * 2 * 8 + 6) * 4 + 3) * 2 * 2 + 6
              6 + 2 + 6 + 5 + (5 * 2 + 7 + (9 * 8) * 9 + 7)
              6 + (9 * 5 + 8 * 7 * 7 * 2) * 6 * 2 + (4 * 3 + 5)
              (6 * 8 + (7 * 5) * (9 + 7 + 5 * 9 * 5 + 5) + (7 + 9 * 8) + 5) * 3 * 6 * 7 + 5 + 4
              4 * 8 + 6 + (3 + 3 * (2 * 4 * 9 + 8 * 3) + (9 + 4 * 2 + 9 + 5 * 4) + 4 * 9)
              (4 * 7 + 2 * 2) * 9 + 5
              (3 * 7 * 9 * (7 * 8)) + (5 * 3 * 7)
              (6 * 6 + 7 * 9 + 6) + 3 + 4 * 6 + (4 + 9 + 4)
              2 + 8 * 7 + (4 + 3 + 7 + 8 + 4 * 6) + 2
              2 * 9 + (3 + 8 + 7 * 8 + 7 * 6) + 3 * ((5 * 2 * 3 * 8 * 5) * 4 + 8 + 4 * 4 * 8) * (9 + 2 + 9 * 6 + 7 * 3)
              (5 + 5 + 6 + (2 * 8)) + 2 * 3 + 4 + (7 + 5 + 7 + 5)
              (8 * (5 * 4 + 9 * 8) * 5 * 7 + 9 * 7) + 4 * 2
              (9 * 3) * 4 + 9 * 2 + 2 * 6
              3 + 7 * 8 + (4 + 9 * (5 * 8 + 9 * 3) + 5 + 2 + 6)
              (2 + 9 + 6 + (5 + 7 * 8 + 8 * 3 + 6)) * 3 + 6 + (6 + 7 + (8 + 7 + 4 * 7 * 4 + 9) + 2)
              (3 * 6 * 4 * 3 + 6 + 5) * (7 + (7 * 5 + 8 * 6 + 2 * 7) * 7 * 6 * 9) * 2 * (9 * 7 + 4 + 9)
              3 + 7 * 4 + (7 + 9 + 3) + (2 + 9 * 8)
              (5 * 9 + 8 + 3 + 8) * 4 + 4 + 9
              ((2 * 5 * 6 + 5 * 4 * 7) * (6 * 6) * (2 + 9 + 6 + 5 * 8 * 2)) + 3 + 3
              (7 + 5 * (5 + 9 + 7 * 3 + 5) * 4 + (5 * 2 * 5 + 6 + 6 + 4)) + 8
              (7 + (8 + 9 + 3) + 9 + 7 + 2) * 2
              4 + 6
              (6 * 8 * (2 + 6 * 9 + 4 + 4 * 9) * (7 * 9 + 5 * 8 + 8) * 7) + 6 * 4 + 9
              3 + (6 * 7 + 8 + 7) * 6 * 8 * 4
              5 + 4 * (6 + 7 * 8 + 2 * (6 * 8 * 3 * 6 * 5) * 3)
              (6 + 6 + 4 + 6 + 5) + 9 * 7 * 8 * 8 * 2
              6 * 5 + (3 + 2 * 2 + 9 + 6 * 7) * 9 + (7 + 3)
              5 + (8 + 8 * 6 + (5 + 5) + 4)
              (5 * (8 * 8 * 9 * 3 * 9 * 3)) * 9 + 5 + (3 * 8)
              2 + (6 * 9 * 5 + (8 * 2 + 6 + 6 * 7)) * 3 * 4 * 8 * 9
              9 + (2 + 8 + 8) + 9 + 3 + 5
              4 + 6 + (7 * 6 + 5) + (5 + 4 * 4) + (6 * 8)
              3 + 5 + (6 * (7 * 2) + 4) * 5 * 6
              9 * 8 + 6 + 5 * (8 * 6 + 4 * 3 + 4)
              9 + (2 * 3)
              7 + (7 * 2 * 7 + 2) * 6 * (9 + (6 + 2 * 3 * 5 * 4)) * (3 + 7 * 8 + 2 + 2 * 7)
              4 * (9 * 5 * 3 + (5 * 3 * 9 * 4 * 8 + 5)) * 8 + 9 * 4 * 7
              8 + 7 + 3 + (5 + 9)
              (9 + 9) * 7 + 5 + 3 + (9 * (4 * 9 + 2 + 4 + 9 * 7) + (5 * 3 * 2) * 8 + 6 + 8)
              5 + 8 + (6 * 4 * 6 * 7) + 4 + 5 * 8
              7 + 4 + (5 + 2 + (8 * 9 + 5 * 5 * 6) * 2 + 8) + 5 * 6 + (5 + 4 + 6 * (2 + 4 + 7 + 5 * 9 * 8) + 9 + 6)
              8 + 8 * 4 * 3 * 8 + 7
              ((4 * 8) * 9 + 7 * 8 * 3) + (4 * 2 * 5 + (2 + 9 + 4 * 6)) * 6
              (7 * 5 * 2 * 3) + (7 + 8 + 6 * 3 * 3) * 8 * (7 * 6 * 3 + 2) * 7
              (5 + (6 + 6 + 5 * 6) * 7 * 4 + 9 * 2) * (5 + 5 * 7 + 8 + 8) * (2 * 7) + 3
              4 + (5 * 4 * 9 + 3) * (2 * 6 + 2) + (9 * 6) * (3 + 6 + 2 + 5)
              (6 + (4 + 5 * 6)) + (6 + 4 * 4) + 5 * (7 + 5) * (5 * 4 + 2) + 9
              6 * (4 + 2 * 6 * 9 * 2) + 4 * 9
              9 * (9 + 3 * 8 + 2)
              ((8 + 4 * 7 + 3 + 8 * 5) + 7 * 4 + (6 * 2 * 5 * 9 * 2 * 7)) * 2 + 5 + 9 * 2
              9 * 5 * 5 * 5 * ((6 + 4 + 4 + 3 + 9) * 4 * 7 + 9 + 8 + (8 * 8 + 6 + 8)) + 6
              (4 * 6 + 3 + 2) * 9 * 4 + 4 * (5 + 6 * 9)
              7 * 4 * (7 + 6 + 4 + 7 * 2) * 5 + 4
              (4 * 3) + 7 + 9 + 9 * 7 * ((3 + 2 * 4) * (2 + 4 + 3 * 4 * 4 + 4) + 8)
              3 + (6 * 7 + 7 * 5 * (9 + 2 * 5 + 9 * 9 * 8) * 9) + 5 * 4 * 3 * 8
              8 * ((8 * 8 + 2 + 6) * 3 * 9 * 9)
              7 * ((9 * 7 + 5 + 3 * 5 + 4) + 9) * 3 * (9 * 5) * 8 * 4
              7 + 3 * 4 * 8 + 4 + (6 + 3 + 2)
              9 + 4 + 5 * 9
              7 * (2 * 8) * 2 * 7
              3 + 8 + (5 + 3 + 4 * 4 * 9)
              7 * (5 * 2 * (7 + 5) + 5) + (5 + 2 * 6 + 9) * 4 * 2 + (3 * 3 * 8 * 9 * 3 * 6)
              5 * (2 + 9 + (5 * 8 + 5 * 6) + 2) + 7 + 9 + 3
              9 * (8 * 3 + 7 * 4 + 6) * 7
              4 + 2 * 6
              (2 + 7) * ((9 + 5 * 5 * 5 + 3) * (2 * 3 * 3 + 7)) + 4 * (9 + 8)
              (7 + (9 + 9)) * (8 * (7 * 5 + 6 + 4 * 5) * 2 + 2)
              2 + (4 + 5 * 9 + 9 * (7 * 3 + 6 + 6 * 2) + 2)
              7 + ((9 * 6 + 7) + (5 + 2) * 5 + 6 * 7) + 9 + (7 * 3) * 6
              (9 * 7 * 7 + 7 * (9 * 7 + 3)) + 3
              5 + 5 + (9 * 5 + 7) + (3 + 8 * 9 * 2) * 3 + (3 + (2 + 2 + 7 * 2 * 4 * 9))
              3 + (5 * 4 * (7 + 4) + 2 * 5 + 9) + (3 + (2 * 5 * 3 * 9 * 3 + 5) * (8 * 7 * 2) + 3 * 6 + (7 * 3))
              4 + ((2 * 6 * 2 + 3 * 5 + 5) * 7 + 2 * 4 * 3) * (5 + 7 + 7 * 8 + 8) + 6
              6 + 6 * (2 + 8 + 2) * 4 + 3 + 6
              6 * 5 + 7 + 5 * (2 + 3 * 6 + 9 + (7 + 6) + 2)
              4 * 3 + 9
              7 + 3 * (2 + (2 * 6 * 3) * 9 + 6) * 8
              (9 + (5 + 7 * 2 * 9 * 7) + 7) + 3 + 3 + (3 + 3 * 7 + 2 + (6 * 4 + 5 * 7)) + 5
              (8 + (8 + 6 + 9) * (6 + 2 + 4) * (7 * 5) * 3) + 3 + 5
              2 + ((6 + 6 * 3) + 6 + 3 * 2 * 7) + 7 + 8 + 5
              2 * 7 + (7 * 2) * ((4 + 6) + (3 * 7 * 3 * 4 * 7 * 6) + 2 * 7 + 5 + 5)
              6 * 3 * (7 * 6 + 4) + ((5 + 7 * 6 + 6 * 9) + 6 * 8 * 3)
              4 + (3 * 8 * 7 + 3) + 4
              3 * (8 + (8 * 2 * 5 + 9 * 3 * 6) * (3 + 4)) + 6 + 8
              2 + 3 + ((3 + 8) + 9 + 2 * (4 * 5 + 7 * 7 * 5) * 5) + 7 + (3 * 2)
              (2 + 4 + (2 + 7 * 8 * 7) + 4 + 5) * 6 * 5 * 9 * 2 * (6 * 7 + 2)
              3 + (2 + 7 * 2 * 8) * (9 * 9 + 4 + 5 * 7 + 3) * 9 * (7 * 5 + 5 + 7)
              (8 + (6 * 9) * (2 * 7)) + 4
              (6 + 6) * (7 + 6 + (8 * 7 + 8 * 3 + 5) * 4)
              5 * (2 + 9 * 4 * 9) * ((4 + 3 + 4 + 9 * 3) + (3 + 5 + 9 + 6 + 5) + 3 * 6 * 8 * 4) + 5
              2 + 8 + 4 * 3 + 9 + (7 * 9)
              6 + 5 + (6 * (9 * 5 + 3 + 4 * 4) * 6 * 7 * 9 * (7 * 4 + 2 + 3)) * 3
              3 + (9 + 2 * 2 + 5) + 5 * 2 * 3 * 6
              2 + 8 * ((2 + 8 * 7 * 6 * 7 + 9) + 6) * 8 * ((6 + 9) * 8 * 5 + 9 * 3 * 8)
              6 * 9 + 8 * 4 + 8 * (9 * (6 + 6) * 2 * 4 * (7 + 4) * 5)
              ((9 * 8 + 2 * 5) * 7) * 8 + 6
              7 * 8 + 2 + (7 + 7 * (9 * 9 + 3) * 7 * 8) + 6 * 3
              (6 + 4 + 9) + 4 * 8 * 7 + 2 + 3
              9 * 2 * (2 + 9 + 2 + 4 * 7 * (3 + 9 * 8 * 5 * 7 + 6)) + (6 + 3 * (4 + 4)) * 4
              9 + 4 * 3 + 3
              4 * 9 + 5
              (5 + 8 * (4 + 6 + 4 + 3)) + 6
              (9 * 6 * (5 + 2)) * ((4 + 9 * 5 * 2 + 4) + 9 * 7)
              3 + 6
              4 + 8 + 3 + (4 * 5 + 9 + 2 + 3) * 9 * (8 + (2 + 8 + 8 + 2 + 5) + 8)
              8 * (8 * 9 * (7 * 8 * 7 + 2) * (8 + 9 * 6 * 3 + 2) * 2) + 7 + 6 + 9 * 5
              8 + (2 * (4 * 3 + 9 + 8)) * 7 * 2 + 4 * (6 * 4 + 2 + 7 * 4 + 4)
              6 * (9 * (6 * 7 * 6 * 7)) * 4
              8 * (8 + 5 * 5 + (3 * 7 * 7)) + 7 + (5 * 2 + 8) * 2
              7 + 5 * 2 + ((4 + 6 + 5 + 9) * 4) * 2 + ((7 * 6 * 2 * 8 * 8) + 3 * 4 + 4 * 9 + 7)
              (7 * 8 * 9 * 6) + 6 * ((6 + 2 + 2 * 6 * 4 + 6) * (4 * 2 + 8 + 4 * 6 * 3)) * 2 * 2 + 7
              (3 * 6 + 6) + 3 + 6 * 7 * (3 + (9 + 5 * 7 * 3 * 2 * 3))
              9 * 5 + 4 + ((6 * 6 * 8) * 2 + 9 + 9) * 4 + (9 * (4 + 4 * 4 + 9 * 5))
              3 * 3 * 3 + ((8 + 7 + 2 * 3) + 4 * 8)
              9 + (3 * 3 * (4 * 5 * 5) * 8 * 8 * (6 * 5 * 3 * 9))
              4 + 3 + 5 * 6 + 9
              4 + 9 * 7 + ((2 + 8 + 2 + 8 * 9) + (4 + 7) + 9 + 5 * 7) * 8 + 8
              (3 + 6 * 6 * 3 + 6 + 6) + 7 * (9 * 7 + 5) * 7
              (9 + 6 + 2 * (8 * 3 * 3 * 7) * 8) + 3 + 3 * (9 * 7 * 5) + 4 + 3
              4 * (7 + (2 * 3 + 9 * 3 * 6 + 4) + (9 * 4) + 2 + 9) + 5 + 5 * (9 + 3 + 6 * 9 + 5)
              8 + (6 + 4 + 3)
              ((3 + 2) + 5) + 5 * ((3 * 3 + 8 + 9 + 5 + 8) + 5 + 9 * (9 * 3))
              8 * 2 + (6 + 8 * 4 + 7) * 8 + (4 * 2 + 4 * 3)
              6 + (8 + 5 + (2 * 6 + 9 + 7 + 2 + 4) + (4 + 8 + 3 * 2) * 2) * 5 + 7 + 5 * 4
              3 * 2 + (5 + (3 + 4) * 7)
              4 * (9 * (4 + 5 + 8) * 9 * (4 + 8 + 4) * 9) * 2 * 3 * ((2 * 7 + 6 * 8 + 6) * 6) + 8
              (5 + 2) + 4
              8 + 6 * 4 * 9 + (5 * 4 + 4 * 5 * 3) * 9
              (5 * (8 + 4 * 6 + 5)) + 7 * 8
              3 + (2 * 3 + 5 * 6 + 5 * (9 + 4 * 4)) + (5 + 7 + 7 + 5) * 3
              6 * (4 * 8 + (7 + 7 + 8 * 8 + 7 + 4) + (3 + 7 * 6 + 5) * 3)
              5 * 3 + 3 * ((5 + 4 * 4 * 8 + 8 + 8) + 3 + (7 + 2 * 7 + 7 + 9) + 8 * 3 * 7)
              (2 + 7) * 3 + 6 * 8 + (8 * 5 * 5 + 9 + 4 + 6)
              3 + 9 * 4 * (5 * (3 * 2) * 7 * 8 + 7 * (9 * 2 * 4 + 2)) + 5 + (6 + 7 + (6 * 5 + 5 * 4 + 9) * 5 * 9 + 8)
              6 + 4 + (9 + 5 + (4 + 4 + 4 * 9 * 7 + 6) + 9) * 8 * 4
              5 * 5 * (3 * 7 * 3 * 4 + (3 * 2)) * (2 + (2 * 4 * 6 + 2 * 5 * 4))
              3 + 3 + 5 + (2 + 9 + 5 * 8 * 9)
              ((2 + 3 + 9 * 7) * 2 * (3 + 4 + 2 * 3 * 6 * 7)) + 2 + 2
              (9 * 5 + 4 * (2 * 3 + 9) + (3 + 2 + 3)) + 4
              (8 * 4) + 3 + (9 * 2 * (6 + 2 * 7 * 7) * 3) * 3 * ((6 * 2 * 3) + (4 * 7 + 6 * 9) + (4 * 9 * 5) + 7) * 3
              9 + 6 * 9 + 7 + 3 * 9
              6 * 2
              8 * 8 * 3 + 4 + 8 + 3
              9 + (7 + 6 * 9 * 2 + 8 * 3)
              8 * 6 + 3 * ((2 * 9 + 6) + 5 * 9 * 9 + 7) + 6 * (2 * 4 * (4 + 6 * 4 + 8 + 4) * 9 + 9)
              8 + ((5 * 6 * 9 * 6 + 6 + 2) + 4) + (9 + 6 * 5 * 6 + 6) + 7 + (7 * 7 + (3 * 3 * 4) * (6 + 3 + 3 + 7 * 3))
              ((8 * 6 + 3 + 8 * 4) * 8 + 8 * 4 + 2) * 8 * 2 + 8 * 8
              7 + (3 * 6 * (8 + 6 + 6 * 6)) + 8 + 4 + 9
              6 + 9 + (7 + 3)
              9 + 5 * 9 * (2 + (7 * 5 + 5 * 4)) * 8 + 6
              (8 * 3 + 8) + 5 + 9 * 6
              4 * 7 * 4 * 7 + 9
              3 * 5 * 3 + (9 + (9 + 3 + 6 + 8 * 2 + 9)) * 2 + 9
              3 + 6 * (7 * 4 * 3 * 5 * 8) * 8
              2 + ((2 * 3 + 8 + 4) * 8 * 2) + 3 + 8 * 7
              7 * (9 + (6 + 3) * 2 * 4) * 5
              4 + (5 * 3 + 4 + 8 * 5 + 9) * 3 * 2
              6 + 8 * (8 * 8) * 6 * 3 + 3
              7 + (6 * 9 + 4 + (7 + 6) * 5 * 9) * 2 + (3 + 6 * 5 * 6) * 3
              (5 * 7 * (5 * 4 * 9 * 9 + 7 * 7) * (9 * 6)) + 6 + 9 * 8
              (2 + (2 * 9 + 2 + 6) * 4 * (7 + 5 * 6 * 6)) * (3 * 3 + (5 * 8 + 9 * 3 * 3) * 4 * 6 + 3) + (2 + 2 * 7 + 2 * 8) * 6 + 6 * 4
              3 * (6 * 2 * 9 + 9 * 2 * 4) * (8 + 5 * 9 + 5) * 2
              (4 + (2 * 4) * 6 * 5 * 7) + 5 * 9
              (5 + 8 * 7 + 6) + 5 * 9 * 5
              7 + 2 * ((8 + 5) + (4 * 9 + 2 + 3 * 4 * 8) * 3) + 3
              (5 + (6 + 9 * 9 + 4)) + 6
              7 + 5 + 3
              2 + (9 * (7 + 2 + 8) + 3 * 7) + 7
              3 + 2 * (4 * 9 * 2 + 4 * 6) * (5 * 6 + 9 + 3 + 2 * 7) * (7 * 6 * 7) + 5
              (4 + (2 * 7 + 5 + 7)) + 4 + (3 * 2 + 5 + 3 * 2) * 7
              9 * 9 * 5 + ((9 * 5) * 6 + 2 * 5) * 6 * 6
              (8 + 9 * 6 + 2 + 8 + 7) + 9 * 4 * 9
              2 * 4 + 6 + (3 + 7 * 9 * 4 + 8) + 3 + 6
              (4 + 7 * 7 + 3 + 2 + 7) + 2 + 6
              5 + 6 * 2 * (2 * 2 + 5 + 6) + 4
              6 * ((3 + 7 * 7 + 6) + 6 * (6 * 3 + 3 * 4 * 9) + (2 * 7 + 3) * 7) * 4
              7 + 6 * 4 + ((9 * 4 * 3 * 3 * 4) * 4 * 9 + 5)
              8 + 5 * ((8 * 5 + 7 + 6 * 5 + 5) * 3) * 4 + 9
              8 + 5 * 8 + 5 * (8 + (2 * 6 + 6) * 5)
              2 + (6 + (4 * 7 + 4 + 7)) + 2 + 5
              4 * 3 * 8 * 8 * 5 + (7 * 6 * (3 * 5 + 3 + 7 + 2 + 6))
              (6 + 7) + (5 + 9 + 2 * (9 + 5 * 3 * 8 * 4)) * (9 * 9) + 2 + 2
              4 + 5 + 9 + (4 * (3 + 9 * 7 + 8 * 9 * 8) * 9 + 8 * 2)
              (4 * 9 * 7) + 3 * 9 + 6 + 3
              4 + ((2 + 7 + 4 + 9) + 3 + 7 * 4 * 7)
              (9 * 3 + (8 + 9 + 5 * 9 + 7) * 7 * 2 * (5 + 4 * 2 + 5 * 3)) + 5 + 9 * 2 * 9 * 4
              (4 * (5 * 8 + 7 * 4 + 3 * 4) + 5 * 8) * 2 * 3 * (6 + 7 + (2 + 5 + 4 + 9) + 6 + 5) * 8
              3 + (3 * 8 * 9 * 6 + 6 * 7) * 5 * 4 + 9
              5 * 2 * (6 + 5 + 3 + 5) + 5 * ((8 + 4 * 7 + 8 * 9) * (7 + 3) * 8 + 4 + 9) * 4
              6 + 5 * (5 + 6 * 4 * 5 * (4 + 3 * 2 + 6 * 5 + 3)) * 3
              3 * ((2 * 9 * 5 + 7 + 4) + 6 + 3) * 2
              9 + 5 * 6 * 7 * (2 * 8 * (2 * 7) * 5) * 7
              (3 + 5 + 4) * 4
              6 + 2 * (7 + 9 * 4 + 4)
              (5 + 8 * 4 + 6) * (6 * 8 * 6) + 8
              6 * 7 * 9 + ((8 * 2 + 8) + 6 + 7)
              3 + (2 + 5 + (6 * 4 + 9) + 2 * 2 + 9) + 8 + 8 + 8 * 9
              ((2 + 7 + 6 * 2 + 8) * (7 + 8 * 6) * 9 * (5 * 3) + 9) + 6 + 8
              4 * 6 + 4 * (2 * 8) + 9 + 8
              (6 + 7 + 6 * 5 * 3) * (3 + 2 + 8 * 8 * 5) * (3 * (7 * 6) + 7 * (2 + 7 + 6) + 6 + 9) * 6 + 8 + 3
              4 * (8 + 2 + (2 + 7 * 8 + 6 + 8 * 9))
              ((5 * 3 + 8 + 4 * 5 + 2) * 5 * 7 + 6) + 7 + 6 + 7
              (7 + 6 + 9 + 6 * (7 * 8 + 9 + 4)) + (6 * 6 * 8 * 5 * (7 * 8)) * ((8 + 6 + 8 + 4) + (9 * 6) * 6 * 7) * 4 * (9 * 4 + 9 * 3 + (7 + 2 + 7 * 2 * 8 * 2) + 8) + 5
              5 + (4 + 3) * 5 * 9 * 2 * 2
              (2 + 6 * 7) * 5 * 9 * (7 + (2 * 7))
              5 + 6 + ((9 * 3 * 9 + 7 + 9) + 8 * 6 + (8 * 3 * 3 * 8 * 5)) + 2
              ((4 * 5 + 8 * 7 * 2 * 7) * 5 * 5) + 6 + 3
              (5 + 3 + 8 * (6 + 8) + 2 * 9) * 9 + 7 * 7 * 6
              9 + 7 * 6 * 5 + (8 * (5 + 4 + 3 + 3) * 9 + 5 + 7 * 6) + 6
              3 * 6 * 6 + (2 + 5 + 9 * 6 + 3 * 4)
              (9 * 2 * 5 + 9 + 4 * 6) + 3
              (4 + (4 * 4) * 2 + 4 + 6 + 5) * 5 * 3 + 4 + 9
              ((5 + 4) + 2) * 5 * (5 + 2 + 8 + 7 + (3 * 7))
              (4 * (4 + 6 * 5) + 5 + 7 + 2) * (2 * 6 * (3 * 4 * 4 + 8))
              8 * (3 * 5 * 6) + 5 + 8
              6 * (2 * (9 * 6 + 3 * 3 + 9) * 3 + 4) * 7
              (2 + 8 + 9 + 6 + 7) + 8 * (4 + 9 + 9 + 4 + 9 + 8)
              2 + 4 * ((3 + 2 + 7) + (9 + 9 + 6) + 2 * 4 * 8) * 5
              5 + 7 + 8 * 9 + ((6 * 3 * 6) * 6 * (8 * 8 + 5) + 4 * 9 * 9)
              6 * 7 * (2 * 3 + 4) + 4
              ((4 * 9) * (7 + 9 * 7 + 9 + 9 * 8) * 9 * (9 * 7 * 5 * 4 + 7) + 4) + 2
              (6 * 4 * (3 + 4 + 2 * 6 * 2) * 2 * 2) + 6 + 3 * 8 * 3 * 2
              2 + 9 * 3 * (6 * 8 + (7 * 9 + 8 * 7) + 8 * 3 + 2) + 4
              (9 + 6 + (3 + 3 + 2 * 9) * (5 * 9)) + 8 + 2
              (7 + 9) + 3 + ((8 * 5 * 9 + 8) * 6 + (5 * 8 * 9)) + 3 * 8 * 7
              3 + 3 + (3 + (4 + 2)) + 5
              7 + ((5 * 6) * 4 + 8 + 4) + 7 * (3 * 5 * 3 * 7)
              2 * 6 * (8 + 6 * 9) + 8 + (8 + 7 + 5 + 3) * 5
              9 + ((4 + 2 + 8) + 2 * 2 + (5 + 2) * (4 + 3 + 4 * 2 * 3 * 5)) * 9 + 8 * (9 * (3 + 3 * 7 + 2 * 3 + 9) + 6)
              8 * ((4 + 4 * 4) * 8 + 4 + 9 + 8 * 6) * (8 * 7 * 6 + 3 + (4 + 2 * 6 + 5 * 7)) + 9 * 2
              3 * 6 * (4 + 9 * 6 * 8 + (8 * 6 + 7) + 2) * 8
              8 * 6 + 8 * 4 * 4
              (7 * 6 + 8 * 8) + 5 * (7 * 2 * (9 * 4) + 3 * 4) * 3 * (9 * 9 * (7 + 4 + 5 * 9 * 6 + 6) * 7) * 9
              4 + (3 + 4 * 8 * 7 + 7) * 9 + 2 + 6 + 4
              2 + 8 * 3 * 4 * (2 * 5 + 7 + (2 * 4 + 4 + 4) + 3 * 2) + 7
              9 + 2 * 3 * 3 * (5 + 4 + 7 + 7 * 2 + 2) * 4
              7 * (3 + (2 * 7 + 5 + 7 + 3) * 6) * 7 + 3 * 4
              8 + 3 * 8 + ((5 * 3 + 6 * 9 * 6 + 2) + 5 + 3 * 5 * (2 + 8 * 7 * 9 * 7)) * 6
              ((6 + 9 + 8) * 2 + 8) + 6 * 7 * 9
              (2 * 6 * (2 + 9 * 5 * 8 + 4) + 7 * 8 + 9) + 5 * (2 * 3 * 6 + (6 + 5 * 9 + 8))
              8 + 5 * 5 + (9 + (7 * 2 * 2 + 8 * 4 * 2)) + 3 + (9 + 3 + 2 + 5)
              9 * 2 + ((8 * 5 + 8) + (5 + 2 + 4) * 3) * (2 + (5 * 4 * 7 + 4 * 4) + 7) * 9 + 4"""


sat =
    [ [ "#", "#", ".", ".", ".", ".", "#", "." ]
    , [ "#", ".", "#", ".", ".", "#", ".", "." ]
    , [ ".", ".", ".", "#", ".", ".", ".", "." ]
    , [ ".", ".", ".", "#", ".", "#", ".", "." ]
    , [ "#", "#", "#", ".", ".", ".", ".", "#" ]
    , [ "#", ".", "#", ".", ".", ".", ".", "#" ]
    , [ ".", "#", ".", ".", ".", ".", "#", "#" ]
    , [ ".", "#", ".", "#", "#", "#", ".", "#" ]
    ]


satTest =
    [ [ ".", "#", "." ]
    , [ ".", ".", "#" ]
    , [ "#", "#", "#" ]
    ]


validRanges =
    [ ( "departure location", ( ( 45, 609 ), ( 616, 954 ) ) )
    , ( "departure station", ( ( 32, 194 ), ( 211, 972 ) ) )
    , ( "departure platform", ( ( 35, 732 ), ( 744, 970 ) ) )
    , ( "departure track", ( ( 40, 626 ), ( 651, 952 ) ) )
    , ( "departure date", ( ( 44, 170 ), ( 184, 962 ) ) )
    , ( "departure time", ( ( 49, 528 ), ( 538, 954 ) ) )
    , ( "arrival location", ( ( 36, 448 ), ( 464, 956 ) ) )
    , ( "arrival station", ( ( 48, 356 ), ( 373, 972 ) ) )
    , ( "arrival platform", ( ( 25, 118 ), ( 132, 954 ) ) )
    , ( "arrival track", ( ( 43, 703 ), ( 719, 965 ) ) )
    , ( "class", ( ( 29, 822 ), ( 828, 961 ) ) )
    , ( "duration", ( ( 25, 131 ), ( 151, 967 ) ) )
    , ( "price", ( ( 44, 784 ), ( 794, 958 ) ) )
    , ( "route", ( ( 25, 498 ), ( 511, 951 ) ) )
    , ( "row", ( ( 44, 905 ), ( 916, 973 ) ) )
    , ( "seat", ( ( 26, 756 ), ( 777, 960 ) ) )
    , ( "train", ( ( 36, 803 ), ( 819, 954 ) ) )
    , ( "type", ( ( 33, 318 ), ( 335, 967 ) ) )
    , ( "wagon", ( ( 46, 558 ), ( 570, 969 ) ) )
    , ( "zone", ( ( 47, 249 ), ( 265, 972 ) ) )
    ]


myTicket =
    [ 73, 167, 113, 61, 89, 59, 191, 103, 67, 83, 163, 109, 101, 71, 97, 151, 107, 79, 157, 53 ]


nearbyTickets =
    [ [ 852, 748, 166, 696, 714, 108, 222, 229, 152, 731, 513, 879, 551, 837, 291, 384, 156, 72, 78, 685 ]
    , [ 617, 653, 290, 113, 846, 782, 621, 607, 231, 117, 411, 920, 442, 249, 434, 597, 528, 702, 201, 684 ]
    , [ 385, 424, 169, 712, 795, 477, 167, 935, 838, 445, 515, 304, 108, 229, 194, 304, 930, 655, 470, 389 ]
    , [ 479, 117, 603, 349, 748, 540, 834, 406, 882, 502, 841, 296, 470, 476, 523, 50, 62, 673, 228, 100 ]
    , [ 943, 616, 662, 858, 840, 616, 156, 152, 943, 284, 588, 861, 582, 215, 747, 392, 374, 826, 895, 730 ]
    , [ 430, 83, 846, 100, 267, 447, 159, 90, 478, 160, 985, 164, 513, 424, 802, 72, 798, 420, 493, 668 ]
    , [ 235, 668, 884, 544, 660, 212, 114, 875, 343, 861, 190, 904, 676, 585, 191, 484, 825, 835, 284, 803 ]
    , [ 164, 691, 481, 839, 421, 868, 897, 615, 373, 835, 949, 664, 154, 316, 870, 414, 306, 719, 446, 654 ]
    , [ 427, 695, 216, 218, 834, 949, 497, 395, 599, 585, 99, 156, 721, 515, 696, 862, 429, 659, 645, 307 ]
    , [ 438, 782, 442, 72, 703, 865, 903, 471, 112, 623, 58, 276, 481, 832, 141, 341, 777, 721, 468, 344 ]
    , [ 555, 653, 944, 292, 870, 94, 696, 926, 544, 830, 424, 343, 61, 51, 119, 584, 444, 296, 700, 572 ]
    , [ 350, 232, 822, 454, 284, 477, 294, 70, 896, 474, 238, 352, 754, 157, 619, 447, 271, 71, 834, 402 ]
    , [ 56, 410, 604, 157, 579, 266, 483, 826, 92, 266, 819, 920, 658, 888, 473, 311, 403, 431, 672, 853 ]
    , [ 353, 10, 862, 588, 837, 547, 686, 104, 79, 877, 158, 676, 497, 894, 380, 821, 99, 246, 69, 663 ]
    , [ 317, 609, 343, 863, 900, 70, 62, 163, 416, 100, 83, 874, 834, 687, 237, 746, 938, 146, 215, 654 ]
    , [ 538, 235, 384, 313, 604, 573, 63, 883, 866, 92, 728, 588, 409, 282, 798, 349, 429, 800, 454, 622 ]
    , [ 88, 512, 392, 70, 229, 686, 887, 643, 727, 318, 858, 349, 96, 274, 723, 475, 393, 97, 290, 605 ]
    , [ 860, 526, 514, 898, 935, 85, 856, 580, 297, 826, 466, 429, 584, 483, 928, 65, 79, 225, 385, 490 ]
    , [ 478, 399, 152, 571, 240, 728, 467, 930, 496, 878, 285, 675, 779, 5, 72, 336, 442, 411, 794, 939 ]
    , [ 678, 231, 165, 54, 100, 596, 663, 469, 161, 835, 293, 699, 475, 229, 572, 282, 624, 847, 892, 990 ]
    , [ 699, 730, 307, 901, 853, 477, 482, 597, 214, 663, 829, 486, 64, 699, 814, 919, 194, 311, 868, 554 ]
    , [ 513, 579, 845, 113, 185, 888, 555, 579, 353, 248, 722, 245, 245, 482, 763, 412, 512, 574, 539, 626 ]
    , [ 456, 749, 526, 93, 678, 282, 585, 308, 245, 485, 938, 616, 867, 114, 239, 446, 727, 885, 376, 617 ]
    , [ 936, 835, 988, 56, 942, 822, 839, 520, 185, 878, 84, 523, 293, 301, 406, 557, 156, 745, 926, 849 ]
    , [ 423, 85, 476, 928, 985, 186, 551, 278, 424, 86, 744, 744, 434, 160, 435, 77, 667, 386, 685, 301 ]
    , [ 90, 167, 540, 448, 889, 919, 894, 378, 237, 533, 186, 408, 86, 900, 498, 384, 217, 184, 244, 621 ]
    , [ 115, 394, 587, 752, 558, 675, 489, 932, 838, 596, 941, 728, 485, 925, 111, 693, 571, 639, 684, 546 ]
    , [ 943, 605, 192, 609, 347, 388, 480, 439, 448, 584, 486, 695, 229, 783, 614, 488, 237, 854, 558, 844 ]
    , [ 411, 215, 396, 674, 829, 314, 923, 846, 94, 63, 690, 572, 721, 64, 4, 189, 421, 945, 845, 300 ]
    , [ 515, 379, 934, 841, 350, 443, 226, 231, 93, 859, 819, 69, 112, 84, 437, 825, 870, 916, 831, 431 ]
    , [ 614, 473, 583, 476, 586, 703, 419, 184, 683, 660, 298, 949, 858, 682, 931, 356, 340, 271, 412, 523 ]
    , [ 892, 413, 849, 194, 248, 341, 192, 60, 442, 381, 887, 243, 185, 473, 588, 790, 78, 666, 110, 336 ]
    , [ 556, 97, 930, 495, 380, 491, 726, 419, 166, 60, 933, 133, 942, 419, 290, 80, 422, 946, 185, 472 ]
    , [ 583, 415, 947, 719, 384, 697, 544, 919, 356, 544, 290, 310, 790, 920, 749, 777, 492, 50, 617, 580 ]
    , [ 407, 65, 665, 78, 507, 269, 89, 874, 901, 314, 622, 698, 112, 308, 927, 656, 832, 226, 307, 783 ]
    , [ 994, 876, 489, 748, 70, 662, 216, 249, 581, 64, 442, 683, 696, 280, 118, 274, 836, 310, 399, 681 ]
    , [ 303, 94, 602, 827, 355, 245, 99, 155, 313, 444, 820, 651, 310, 702, 838, 943, 92, 60, 386, 699 ]
    , [ 211, 570, 889, 698, 848, 934, 187, 105, 470, 907, 99, 349, 294, 724, 155, 573, 665, 63, 929, 277 ]
    , [ 374, 63, 287, 107, 517, 577, 819, 721, 86, 673, 581, 354, 511, 94, 110, 169, 703, 730, 613, 756 ]
    , [ 265, 925, 881, 780, 238, 91, 51, 867, 891, 231, 174, 67, 898, 236, 474, 433, 520, 658, 932, 391 ]
    , [ 84, 779, 860, 82, 212, 858, 749, 223, 152, 225, 118, 220, 306, 471, 380, 61, 698, 4, 88, 730 ]
    , [ 931, 902, 981, 492, 594, 60, 335, 166, 301, 233, 274, 797, 666, 236, 191, 217, 924, 310, 107, 673 ]
    , [ 861, 158, 884, 670, 486, 752, 944, 249, 928, 301, 269, 218, 935, 878, 289, 186, 379, 712, 881, 314 ]
    , [ 95, 81, 672, 616, 409, 184, 306, 436, 871, 355, 422, 821, 877, 676, 716, 408, 187, 848, 520, 687 ]
    , [ 902, 311, 189, 799, 246, 341, 474, 477, 544, 89, 476, 226, 666, 483, 272, 830, 531, 153, 55, 51 ]
    , [ 947, 220, 594, 212, 673, 593, 437, 820, 899, 855, 884, 667, 934, 440, 503, 50, 947, 465, 118, 592 ]
    , [ 194, 724, 887, 730, 934, 465, 841, 427, 693, 487, 526, 236, 538, 468, 828, 652, 175, 386, 781, 90 ]
    , [ 473, 285, 392, 249, 339, 748, 796, 898, 481, 237, 901, 152, 883, 665, 94, 442, 791, 624, 229, 606 ]
    , [ 802, 346, 724, 949, 99, 659, 213, 58, 263, 722, 600, 622, 924, 947, 163, 877, 160, 723, 348, 494 ]
    , [ 801, 268, 937, 11, 60, 265, 118, 929, 109, 152, 470, 832, 697, 110, 161, 396, 604, 101, 97, 99 ]
    , [ 316, 924, 302, 190, 386, 675, 938, 62, 681, 724, 777, 234, 199, 445, 288, 466, 480, 869, 97, 244 ]
    , [ 512, 294, 587, 690, 420, 102, 512, 929, 876, 786, 754, 337, 544, 285, 784, 81, 575, 425, 298, 376 ]
    , [ 479, 652, 918, 435, 773, 492, 618, 936, 298, 99, 82, 477, 780, 466, 523, 945, 98, 511, 162, 755 ]
    , [ 673, 472, 653, 427, 652, 431, 551, 260, 409, 440, 351, 778, 75, 309, 747, 889, 726, 169, 221, 890 ]
    , [ 512, 376, 753, 527, 224, 554, 660, 871, 311, 296, 833, 400, 379, 192, 696, 294, 410, 741, 606, 664 ]
    , [ 923, 348, 343, 297, 304, 225, 827, 83, 876, 672, 219, 722, 550, 600, 389, 820, 229, 673, 297, 544 ]
    , [ 689, 492, 515, 299, 466, 920, 387, 239, 307, 405, 375, 867, 226, 302, 877, 461, 477, 421, 519, 702 ]
    , [ 73, 524, 544, 243, 58, 495, 884, 164, 992, 97, 220, 434, 538, 583, 51, 218, 719, 247, 280, 407 ]
    , [ 277, 552, 925, 51, 168, 316, 404, 899, 903, 941, 376, 103, 436, 917, 722, 19, 355, 698, 407, 298 ]
    , [ 316, 114, 89, 623, 672, 167, 95, 935, 685, 686, 193, 654, 303, 713, 234, 783, 747, 626, 868, 392 ]
    , [ 195, 72, 901, 486, 241, 159, 60, 58, 442, 211, 837, 217, 352, 279, 516, 156, 833, 661, 442, 265 ]
    , [ 872, 267, 101, 83, 349, 513, 486, 533, 241, 113, 236, 445, 885, 672, 833, 675, 854, 931, 574, 165 ]
    , [ 479, 448, 730, 617, 289, 185, 585, 308, 784, 91, 90, 53, 661, 632, 307, 722, 116, 539, 794, 412 ]
    , [ 105, 483, 64, 795, 482, 486, 737, 853, 483, 723, 679, 726, 570, 744, 376, 307, 382, 854, 348, 608 ]
    , [ 134, 443, 920, 418, 553, 753, 217, 624, 311, 75, 555, 382, 597, 297, 309, 855, 153, 89, 778, 583 ]
    , [ 579, 653, 681, 819, 110, 830, 50, 303, 604, 783, 249, 339, 835, 929, 229, 108, 19, 926, 516, 949 ]
    , [ 74, 496, 584, 170, 115, 297, 93, 497, 921, 916, 571, 846, 782, 597, 437, 744, 458, 347, 110, 607 ]
    , [ 903, 488, 448, 355, 377, 852, 872, 773, 511, 731, 429, 81, 393, 228, 518, 192, 625, 61, 490, 239 ]
    , [ 118, 168, 576, 220, 670, 495, 921, 716, 438, 112, 671, 782, 751, 339, 928, 65, 293, 592, 266, 270 ]
    , [ 237, 841, 409, 525, 584, 381, 422, 238, 2, 731, 404, 803, 220, 877, 295, 821, 918, 919, 946, 727 ]
    , [ 387, 528, 847, 619, 498, 782, 745, 68, 444, 597, 545, 315, 580, 794, 700, 660, 343, 936, 718, 57 ]
    , [ 877, 799, 432, 495, 87, 318, 489, 379, 461, 598, 418, 658, 595, 403, 82, 894, 298, 237, 837, 77 ]
    , [ 587, 310, 599, 886, 784, 417, 232, 450, 947, 405, 478, 576, 52, 936, 300, 862, 783, 189, 377, 918 ]
    , [ 113, 390, 605, 584, 870, 542, 308, 791, 300, 603, 883, 798, 586, 841, 685, 777, 782, 587, 895, 151 ]
    , [ 304, 724, 215, 414, 873, 841, 617, 619, 861, 400, 308, 479, 455, 104, 620, 545, 159, 783, 654, 235 ]
    , [ 802, 311, 157, 465, 159, 882, 393, 377, 745, 436, 724, 427, 854, 102, 174, 422, 169, 700, 380, 447 ]
    , [ 91, 862, 280, 399, 464, 396, 407, 134, 117, 678, 903, 307, 341, 747, 875, 243, 550, 728, 926, 555 ]
    , [ 496, 861, 940, 577, 441, 80, 285, 241, 553, 390, 937, 271, 467, 410, 408, 870, 977, 752, 354, 579 ]
    , [ 553, 894, 294, 731, 326, 414, 406, 83, 828, 654, 82, 170, 667, 112, 853, 94, 188, 434, 527, 295 ]
    , [ 803, 557, 169, 672, 82, 655, 464, 350, 157, 399, 691, 160, 745, 975, 902, 428, 877, 891, 213, 108 ]
    , [ 340, 383, 887, 112, 719, 519, 683, 853, 190, 899, 161, 793, 850, 403, 437, 52, 890, 802, 593, 609 ]
    , [ 229, 722, 783, 899, 785, 247, 434, 587, 936, 248, 609, 265, 84, 853, 831, 544, 861, 780, 781, 469 ]
    , [ 301, 312, 675, 897, 263, 397, 392, 476, 928, 67, 467, 653, 697, 861, 288, 231, 623, 246, 669, 839 ]
    , [ 273, 339, 78, 861, 339, 212, 703, 402, 285, 419, 11, 931, 880, 415, 246, 622, 72, 934, 227, 525 ]
    , [ 861, 696, 672, 414, 265, 154, 246, 375, 585, 478, 110, 853, 406, 277, 311, 112, 612, 394, 274, 415 ]
    , [ 896, 868, 338, 782, 467, 314, 60, 925, 224, 585, 267, 297, 984, 169, 272, 683, 390, 347, 784, 292 ]
    , [ 917, 516, 424, 213, 802, 385, 310, 871, 154, 325, 872, 190, 898, 476, 61, 513, 464, 919, 211, 97 ]
    , [ 468, 682, 520, 538, 695, 419, 404, 350, 598, 121, 495, 300, 858, 421, 542, 822, 778, 76, 283, 275 ]
    , [ 752, 71, 896, 151, 851, 842, 606, 608, 667, 257, 97, 744, 288, 317, 233, 778, 618, 276, 487, 492 ]
    , [ 345, 191, 426, 858, 306, 398, 691, 230, 755, 472, 614, 381, 937, 850, 607, 729, 477, 889, 625, 215 ]
    , [ 288, 622, 864, 902, 719, 732, 219, 830, 858, 356, 288, 841, 830, 248, 184, 667, 198, 550, 663, 498 ]
    , [ 246, 428, 5, 690, 693, 745, 238, 223, 153, 220, 193, 852, 744, 192, 596, 575, 832, 944, 585, 401 ]
    , [ 296, 542, 87, 338, 732, 437, 800, 874, 309, 843, 58, 732, 665, 103, 80, 430, 850, 532, 673, 286 ]
    , [ 374, 239, 653, 794, 918, 829, 725, 927, 534, 151, 745, 354, 575, 676, 681, 941, 749, 860, 70, 467 ]
    , [ 60, 185, 832, 191, 373, 841, 845, 292, 797, 811, 82, 883, 270, 931, 552, 218, 575, 690, 239, 190 ]
    , [ 778, 74, 518, 267, 374, 227, 110, 73, 855, 679, 916, 796, 339, 661, 551, 989, 683, 829, 151, 67 ]
    , [ 437, 824, 70, 295, 752, 600, 522, 113, 624, 784, 188, 921, 488, 882, 889, 389, 266, 732, 337, 928 ]
    , [ 803, 345, 300, 869, 232, 868, 703, 247, 796, 217, 834, 17, 599, 919, 856, 277, 160, 468, 287, 55 ]
    , [ 302, 856, 395, 248, 848, 223, 81, 54, 679, 695, 580, 821, 558, 280, 827, 691, 746, 385, 896, 476 ]
    , [ 948, 556, 343, 921, 383, 925, 97, 174, 937, 311, 166, 585, 394, 600, 686, 491, 698, 389, 274, 921 ]
    , [ 240, 749, 50, 291, 430, 603, 899, 545, 156, 403, 456, 386, 658, 703, 382, 73, 337, 315, 929, 681 ]
    , [ 922, 101, 625, 668, 376, 664, 223, 657, 298, 175, 889, 544, 752, 802, 621, 926, 847, 513, 88, 518 ]
    , [ 905, 676, 474, 340, 847, 430, 108, 303, 725, 62, 578, 419, 747, 70, 660, 405, 218, 891, 181, 487 ]
    , [ 406, 420, 674, 67, 931, 297, 314, 942, 586, 396, 245, 623, 551, 652, 250, 590, 77, 100, 657, 558 ]
    , [ 542, 490, 61, 750, 223, 888, 224, 941, 875, 581, 222, 527, 217, 223, 864, 574, 287, 182, 528, 475 ]
    , [ 830, 305, 239, 924, 316, 337, 289, 289, 431, 344, 898, 167, 594, 926, 785, 795, 933, 558, 290, 932 ]
    , [ 934, 873, 488, 729, 756, 240, 933, 130, 51, 489, 512, 621, 79, 671, 408, 229, 102, 872, 68, 523 ]
    , [ 377, 70, 584, 213, 131, 275, 489, 433, 689, 747, 50, 753, 88, 217, 439, 470, 597, 835, 390, 904 ]
    , [ 353, 580, 851, 791, 888, 841, 937, 234, 835, 74, 598, 555, 582, 422, 337, 352, 64, 338, 433, 870 ]
    , [ 750, 701, 156, 249, 725, 857, 354, 703, 126, 851, 660, 243, 623, 492, 695, 76, 490, 844, 335, 886 ]
    , [ 859, 216, 380, 425, 490, 479, 936, 445, 326, 938, 574, 418, 848, 489, 87, 386, 800, 97, 303, 673 ]
    , [ 303, 902, 73, 898, 619, 403, 540, 355, 55, 236, 161, 708, 940, 920, 83, 79, 246, 356, 922, 887 ]
    , [ 318, 79, 157, 888, 586, 213, 526, 659, 318, 945, 570, 496, 947, 799, 419, 779, 128, 860, 154, 440 ]
    , [ 168, 554, 934, 573, 594, 528, 512, 522, 398, 294, 738, 89, 474, 104, 833, 583, 849, 338, 306, 666 ]
    , [ 521, 522, 591, 924, 558, 657, 554, 488, 93, 590, 378, 152, 194, 190, 193, 727, 403, 509, 291, 395 ]
    , [ 943, 50, 379, 392, 427, 422, 916, 894, 273, 473, 68, 284, 341, 514, 847, 301, 494, 295, 384, 134 ]
    , [ 876, 797, 487, 698, 194, 571, 714, 59, 665, 655, 78, 79, 108, 281, 293, 891, 849, 898, 387, 551 ]
    , [ 182, 923, 483, 524, 426, 94, 237, 602, 690, 493, 884, 434, 411, 551, 750, 528, 625, 396, 249, 526 ]
    , [ 343, 495, 784, 355, 794, 494, 240, 678, 191, 719, 848, 753, 243, 148, 115, 211, 842, 750, 390, 622 ]
    , [ 153, 552, 548, 284, 164, 694, 383, 283, 821, 580, 376, 312, 887, 861, 247, 881, 259, 279, 345, 868 ]
    , [ 443, 152, 228, 853, 438, 343, 654, 85, 850, 290, 277, 58, 524, 114, 5, 300, 936, 668, 602, 112 ]
    , [ 884, 976, 606, 239, 900, 872, 863, 397, 306, 866, 866, 864, 938, 586, 905, 594, 497, 899, 394, 828 ]
    , [ 889, 241, 241, 512, 877, 231, 879, 229, 474, 424, 275, 888, 539, 590, 831, 982, 725, 407, 248, 154 ]
    , [ 193, 727, 107, 544, 476, 402, 856, 673, 132, 388, 848, 748, 751, 335, 407, 424, 837, 93, 916, 526 ]
    , [ 655, 395, 931, 744, 405, 780, 75, 286, 429, 679, 580, 876, 543, 525, 932, 670, 699, 920, 138, 936 ]
    , [ 745, 20, 297, 266, 223, 478, 353, 843, 893, 52, 655, 473, 74, 655, 248, 689, 745, 222, 702, 160 ]
    , [ 664, 778, 443, 923, 750, 547, 431, 892, 864, 211, 289, 471, 442, 626, 848, 73, 546, 126, 187, 219 ]
    , [ 692, 685, 289, 479, 378, 238, 884, 443, 317, 151, 787, 877, 109, 482, 850, 753, 945, 621, 352, 689 ]
    , [ 64, 291, 294, 577, 241, 112, 557, 744, 84, 690, 315, 113, 854, 109, 625, 996, 269, 486, 662, 576 ]
    , [ 920, 287, 623, 161, 315, 621, 348, 492, 664, 281, 946, 381, 606, 752, 309, 992, 186, 184, 68, 895 ]
    , [ 879, 577, 107, 432, 654, 870, 439, 467, 419, 236, 447, 549, 219, 353, 485, 936, 213, 412, 823, 288 ]
    , [ 790, 665, 747, 494, 525, 863, 421, 425, 871, 391, 422, 601, 215, 242, 609, 784, 214, 727, 869, 162 ]
    , [ 750, 551, 756, 373, 100, 356, 222, 373, 857, 50, 236, 52, 116, 858, 930, 948, 668, 730, 936, 827 ]
    , [ 485, 899, 839, 584, 622, 867, 242, 373, 654, 209, 169, 87, 80, 349, 538, 271, 820, 222, 483, 620 ]
    , [ 221, 164, 293, 687, 656, 595, 724, 419, 2, 893, 385, 940, 656, 112, 113, 835, 407, 524, 703, 777 ]
    , [ 164, 598, 491, 834, 416, 271, 216, 688, 945, 92, 652, 266, 872, 50, 733, 291, 796, 310, 900, 873 ]
    , [ 230, 918, 93, 892, 376, 412, 470, 679, 823, 526, 353, 426, 474, 609, 674, 114, 876, 540, 278, 221 ]
    , [ 438, 310, 918, 228, 141, 874, 228, 89, 51, 58, 861, 553, 425, 603, 154, 862, 849, 657, 553, 889 ]
    , [ 686, 557, 153, 875, 423, 549, 620, 484, 391, 156, 921, 68, 223, 309, 219, 472, 718, 625, 591, 164 ]
    , [ 656, 487, 240, 520, 276, 439, 239, 888, 834, 95, 132, 65, 413, 557, 90, 303, 299, 890, 247, 590 ]
    , [ 436, 228, 868, 491, 696, 403, 118, 939, 819, 698, 64, 819, 237, 780, 341, 849, 306, 52, 791, 929 ]
    , [ 692, 440, 848, 418, 886, 298, 88, 154, 790, 595, 755, 662, 307, 587, 866, 837, 50, 722, 398, 384 ]
    , [ 124, 894, 570, 311, 428, 938, 52, 661, 348, 703, 599, 624, 441, 168, 588, 606, 292, 105, 819, 582 ]
    , [ 682, 374, 296, 591, 117, 388, 221, 386, 307, 933, 830, 548, 584, 480, 918, 689, 671, 912, 935, 81 ]
    , [ 76, 621, 821, 578, 90, 348, 68, 279, 66, 613, 288, 268, 518, 238, 881, 583, 830, 514, 382, 410 ]
    , [ 99, 385, 317, 864, 265, 831, 801, 209, 374, 413, 420, 117, 939, 802, 590, 651, 433, 380, 931, 858 ]
    , [ 495, 849, 430, 229, 349, 63, 214, 682, 477, 238, 868, 516, 435, 341, 188, 749, 595, 785, 888, 893 ]
    , [ 56, 215, 279, 246, 832, 71, 802, 870, 663, 102, 872, 879, 137, 752, 393, 675, 784, 56, 55, 928 ]
    , [ 396, 691, 335, 448, 492, 402, 243, 780, 665, 753, 782, 556, 383, 799, 332, 409, 162, 389, 936, 719 ]
    , [ 827, 838, 579, 286, 265, 164, 875, 847, 699, 596, 694, 799, 948, 542, 117, 356, 83, 678, 798, 699 ]
    , [ 375, 897, 425, 188, 653, 838, 177, 837, 317, 878, 522, 801, 308, 230, 830, 626, 926, 842, 292, 592 ]
    , [ 90, 932, 56, 266, 335, 830, 675, 64, 193, 828, 930, 902, 946, 520, 483, 232, 738, 521, 842, 577 ]
    , [ 802, 466, 400, 207, 929, 314, 236, 246, 356, 70, 350, 309, 281, 153, 616, 839, 388, 389, 307, 881 ]
    , [ 434, 57, 466, 435, 292, 221, 398, 558, 729, 553, 169, 215, 880, 781, 988, 860, 835, 467, 688, 701 ]
    , [ 525, 475, 270, 552, 225, 169, 106, 190, 236, 700, 266, 413, 414, 651, 167, 283, 527, 615, 282, 233 ]
    , [ 843, 161, 441, 605, 856, 336, 269, 938, 617, 925, 165, 394, 601, 446, 628, 341, 603, 603, 387, 429 ]
    , [ 392, 573, 550, 931, 56, 938, 167, 742, 342, 589, 495, 940, 286, 934, 794, 467, 550, 939, 853, 77 ]
    , [ 54, 476, 748, 674, 355, 665, 576, 440, 480, 85, 88, 317, 898, 679, 459, 836, 843, 436, 388, 436 ]
    , [ 936, 588, 98, 238, 899, 655, 474, 878, 778, 290, 747, 976, 378, 443, 845, 948, 583, 245, 519, 623 ]
    , [ 429, 277, 97, 694, 678, 701, 600, 902, 667, 312, 478, 581, 921, 522, 520, 872, 299, 773, 480, 164 ]
    , [ 543, 684, 242, 572, 825, 400, 59, 226, 77, 902, 78, 604, 720, 890, 684, 71, 242, 99, 864, 594 ]
    , [ 494, 163, 588, 211, 794, 75, 458, 161, 292, 679, 488, 575, 226, 401, 75, 947, 729, 938, 690, 885 ]
    , [ 831, 578, 112, 240, 979, 229, 93, 928, 841, 281, 437, 285, 620, 581, 346, 240, 235, 874, 242, 387 ]
    , [ 836, 95, 374, 822, 843, 211, 306, 82, 945, 690, 24, 114, 543, 470, 58, 218, 117, 658, 617, 724 ]
    , [ 402, 881, 248, 485, 703, 574, 898, 655, 233, 597, 487, 412, 495, 458, 872, 346, 273, 727, 86, 190 ]
    , [ 849, 439, 853, 939, 859, 616, 669, 243, 875, 671, 650, 76, 218, 747, 299, 699, 883, 930, 545, 884 ]
    , [ 104, 513, 76, 170, 591, 587, 403, 896, 693, 487, 703, 836, 710, 92, 231, 228, 830, 226, 288, 53 ]
    , [ 740, 389, 110, 755, 491, 555, 574, 421, 294, 478, 445, 428, 519, 796, 622, 74, 97, 302, 50, 783 ]
    , [ 381, 381, 626, 868, 621, 468, 850, 345, 101, 719, 266, 851, 490, 519, 727, 222, 106, 263, 943, 442 ]
    , [ 289, 313, 317, 783, 448, 698, 74, 117, 83, 834, 835, 432, 595, 74, 533, 475, 356, 872, 189, 106 ]
    , [ 234, 488, 117, 901, 831, 995, 471, 888, 268, 725, 799, 375, 750, 222, 488, 516, 522, 103, 662, 157 ]
    , [ 537, 377, 58, 550, 599, 237, 356, 170, 848, 157, 492, 794, 270, 852, 355, 318, 382, 677, 112, 71 ]
    , [ 473, 277, 749, 593, 311, 888, 278, 670, 376, 463, 732, 779, 99, 486, 552, 356, 113, 597, 376, 871 ]
    , [ 583, 377, 216, 477, 71, 163, 664, 888, 339, 798, 436, 996, 378, 443, 747, 830, 315, 272, 592, 574 ]
    , [ 555, 618, 188, 831, 85, 465, 479, 380, 94, 737, 802, 337, 882, 431, 302, 217, 543, 187, 654, 388 ]
    , [ 527, 93, 943, 549, 891, 70, 792, 589, 899, 409, 393, 234, 703, 350, 378, 517, 783, 347, 546, 783 ]
    , [ 292, 17, 90, 653, 417, 314, 158, 231, 839, 155, 448, 849, 936, 497, 877, 111, 488, 294, 478, 861 ]
    , [ 116, 664, 74, 652, 619, 395, 798, 445, 831, 718, 80, 245, 94, 601, 432, 109, 489, 873, 229, 795 ]
    , [ 214, 109, 436, 871, 558, 516, 946, 239, 223, 936, 601, 667, 392, 208, 441, 420, 308, 598, 602, 798 ]
    , [ 751, 599, 623, 784, 462, 701, 70, 443, 286, 274, 348, 296, 221, 546, 248, 469, 589, 415, 65, 690 ]
    , [ 699, 341, 904, 475, 682, 860, 614, 68, 581, 245, 422, 283, 847, 117, 428, 693, 340, 476, 669, 522 ]
    , [ 880, 237, 66, 52, 879, 346, 597, 603, 679, 840, 530, 924, 378, 340, 667, 586, 384, 57, 90, 526 ]
    , [ 609, 305, 214, 869, 350, 679, 872, 617, 207, 587, 415, 113, 865, 106, 225, 400, 285, 214, 287, 730 ]
    , [ 899, 309, 274, 74, 114, 399, 76, 598, 308, 521, 200, 541, 441, 876, 57, 277, 885, 887, 894, 548 ]
    , [ 410, 186, 317, 307, 402, 436, 483, 920, 470, 753, 492, 66, 553, 844, 283, 604, 755, 197, 554, 315 ]
    , [ 697, 662, 727, 593, 644, 890, 315, 448, 396, 214, 676, 73, 575, 314, 285, 747, 862, 618, 835, 423 ]
    , [ 872, 893, 379, 848, 216, 65, 940, 288, 51, 757, 231, 653, 542, 570, 352, 479, 831, 838, 619, 440 ]
    , [ 576, 695, 665, 304, 745, 793, 470, 306, 609, 555, 842, 431, 860, 662, 284, 897, 659, 784, 598, 512 ]
    , [ 699, 66, 190, 276, 741, 538, 833, 548, 430, 921, 686, 387, 161, 437, 96, 281, 424, 413, 307, 513 ]
    , [ 300, 295, 224, 432, 663, 617, 285, 519, 94, 573, 721, 754, 476, 429, 688, 86, 647, 75, 192, 593 ]
    , [ 617, 53, 289, 551, 755, 90, 137, 304, 493, 67, 446, 408, 95, 618, 796, 700, 847, 720, 106, 118 ]
    , [ 936, 545, 337, 172, 384, 602, 690, 344, 59, 347, 102, 581, 551, 115, 404, 480, 821, 586, 59, 243 ]
    , [ 709, 269, 57, 265, 412, 601, 273, 64, 74, 859, 782, 725, 945, 598, 224, 671, 942, 289, 756, 781 ]
    , [ 476, 5, 219, 93, 306, 693, 94, 374, 929, 95, 350, 680, 302, 226, 939, 274, 681, 528, 75, 850 ]
    , [ 585, 427, 411, 440, 335, 166, 887, 754, 174, 920, 574, 72, 304, 553, 865, 921, 596, 523, 587, 438 ]
    , [ 354, 379, 277, 6, 167, 777, 802, 414, 942, 695, 723, 158, 221, 393, 191, 52, 432, 314, 852, 298 ]
    , [ 160, 266, 997, 690, 590, 432, 890, 302, 857, 526, 284, 237, 394, 464, 189, 169, 289, 687, 247, 52 ]
    , [ 673, 265, 387, 920, 574, 859, 659, 158, 882, 268, 886, 316, 310, 114, 312, 347, 539, 818, 590, 419 ]
    , [ 751, 163, 435, 521, 314, 394, 70, 540, 403, 238, 160, 827, 819, 422, 659, 920, 426, 605, 479, 745 ]
    , [ 476, 719, 519, 151, 997, 422, 301, 684, 944, 383, 275, 93, 656, 392, 218, 729, 513, 626, 493, 293 ]
    , [ 597, 698, 549, 620, 512, 901, 991, 778, 272, 512, 415, 416, 466, 216, 667, 527, 901, 605, 662, 413 ]
    , [ 79, 286, 729, 312, 829, 93, 431, 69, 52, 269, 218, 513, 52, 788, 350, 231, 288, 777, 435, 542 ]
    , [ 394, 589, 93, 90, 162, 375, 295, 799, 84, 939, 160, 461, 239, 213, 856, 798, 547, 374, 337, 723 ]
    , [ 54, 720, 751, 852, 431, 380, 834, 902, 947, 358, 219, 746, 558, 749, 598, 477, 882, 270, 92, 732 ]
    , [ 669, 625, 938, 604, 397, 935, 889, 557, 240, 313, 272, 928, 861, 577, 671, 447, 519, 331, 864, 546 ]
    , [ 749, 579, 600, 398, 692, 447, 443, 56, 623, 998, 165, 871, 233, 213, 284, 527, 683, 583, 242, 588 ]
    , [ 439, 469, 853, 24, 386, 65, 193, 518, 83, 409, 353, 213, 916, 486, 224, 573, 76, 385, 439, 672 ]
    , [ 66, 383, 943, 871, 373, 992, 861, 605, 514, 675, 693, 593, 864, 351, 853, 557, 401, 88, 88, 862 ]
    , [ 597, 439, 484, 431, 378, 271, 796, 344, 713, 899, 597, 870, 59, 277, 784, 512, 588, 66, 897, 868 ]
    , [ 840, 93, 744, 484, 183, 88, 687, 922, 607, 842, 95, 573, 605, 246, 799, 241, 583, 600, 428, 352 ]
    , [ 65, 835, 163, 404, 940, 826, 822, 514, 858, 851, 778, 578, 266, 238, 435, 281, 694, 286, 283, 388 ]
    , [ 687, 869, 54, 272, 536, 266, 572, 853, 478, 726, 403, 722, 919, 943, 840, 756, 828, 248, 466, 164 ]
    , [ 346, 624, 314, 495, 277, 923, 198, 102, 834, 891, 309, 475, 118, 342, 489, 687, 245, 548, 409, 440 ]
    , [ 846, 621, 557, 158, 674, 574, 395, 298, 582, 679, 211, 869, 79, 376, 894, 2, 343, 302, 51, 335 ]
    , [ 558, 439, 61, 466, 350, 106, 111, 668, 298, 291, 282, 905, 835, 547, 101, 20, 604, 899, 55, 655 ]
    , [ 545, 158, 686, 541, 587, 829, 477, 780, 543, 858, 288, 684, 307, 439, 159, 829, 517, 654, 424, 790 ]
    , [ 293, 224, 902, 822, 696, 391, 520, 346, 620, 525, 86, 293, 468, 557, 279, 307, 978, 939, 720, 275 ]
    , [ 291, 279, 439, 678, 338, 932, 345, 545, 747, 676, 72, 393, 498, 936, 302, 889, 16, 515, 689, 900 ]
    , [ 74, 583, 858, 572, 751, 590, 526, 864, 556, 67, 56, 294, 213, 394, 195, 235, 719, 383, 885, 275 ]
    , [ 549, 877, 439, 272, 625, 599, 748, 214, 381, 731, 744, 515, 823, 226, 667, 939, 108, 395, 658, 476 ]
    , [ 58, 223, 60, 217, 349, 164, 273, 903, 836, 686, 823, 587, 518, 597, 314, 291, 73, 466, 223, 675 ]
    , [ 170, 444, 651, 429, 476, 159, 421, 575, 614, 920, 99, 447, 278, 571, 84, 83, 312, 727, 904, 338 ]
    , [ 98, 106, 349, 683, 749, 282, 830, 661, 648, 538, 282, 307, 528, 70, 291, 547, 848, 600, 443, 593 ]
    , [ 781, 350, 616, 698, 589, 581, 185, 724, 104, 147, 68, 69, 522, 490, 606, 695, 653, 799, 897, 318 ]
    , [ 151, 234, 940, 295, 751, 160, 388, 246, 517, 941, 485, 898, 654, 602, 803, 494, 619, 2, 102, 353 ]
    , [ 631, 429, 731, 95, 781, 652, 383, 862, 54, 240, 691, 157, 616, 292, 272, 596, 386, 234, 702, 390 ]
    , [ 528, 51, 994, 96, 189, 472, 291, 831, 156, 169, 56, 623, 471, 663, 108, 212, 354, 385, 725, 652 ]
    , [ 249, 751, 657, 270, 187, 604, 839, 331, 216, 779, 802, 355, 296, 822, 899, 237, 447, 187, 168, 926 ]
    , [ 669, 749, 235, 489, 540, 161, 426, 820, 166, 779, 9, 427, 225, 91, 863, 527, 657, 297, 577, 59 ]
    , [ 51, 164, 116, 586, 547, 102, 890, 410, 440, 192, 921, 592, 484, 825, 423, 375, 191, 347, 284, 399 ]
    , [ 344, 831, 469, 295, 77, 864, 474, 438, 802, 232, 514, 947, 468, 580, 473, 142, 444, 547, 597, 158 ]
    , [ 281, 598, 527, 933, 338, 237, 161, 237, 934, 933, 704, 517, 698, 98, 663, 495, 605, 677, 57, 856 ]
    , [ 887, 95, 395, 701, 221, 728, 574, 400, 730, 427, 167, 94, 56, 860, 784, 444, 847, 662, 780, 980 ]
    , [ 582, 888, 545, 385, 422, 487, 382, 900, 223, 829, 873, 435, 217, 653, 314, 932, 488, 976, 584, 930 ]
    , [ 433, 940, 609, 308, 671, 377, 828, 114, 604, 544, 107, 102, 215, 290, 428, 168, 145, 352, 230, 946 ]
    , [ 309, 382, 394, 693, 613, 549, 666, 918, 473, 832, 220, 169, 848, 874, 292, 343, 161, 782, 492, 160 ]
    , [ 281, 847, 880, 890, 196, 297, 212, 664, 698, 653, 375, 905, 546, 354, 106, 606, 828, 249, 300, 940 ]
    , [ 780, 382, 592, 406, 875, 798, 434, 685, 300, 633, 69, 314, 101, 557, 311, 214, 661, 381, 881, 783 ]
    , [ 524, 578, 295, 141, 389, 162, 299, 79, 596, 873, 443, 576, 841, 747, 539, 80, 731, 345, 603, 347 ]
    , [ 212, 244, 336, 831, 799, 434, 570, 933, 949, 662, 114, 891, 903, 656, 408, 835, 682, 451, 853, 229 ]
    , [ 267, 156, 408, 933, 373, 401, 589, 578, 739, 653, 306, 723, 430, 220, 593, 580, 748, 194, 403, 271 ]
    , [ 487, 851, 152, 636, 434, 528, 851, 63, 575, 606, 284, 695, 658, 783, 337, 223, 90, 489, 189, 948 ]
    , [ 100, 288, 70, 516, 904, 187, 648, 153, 271, 409, 725, 314, 686, 889, 285, 701, 443, 306, 439, 544 ]
    ]


validRangesTest : List ( String, ( ( number, number ), ( number, number ) ) )
validRangesTest =
    [ ( "class", ( ( 0, 1 ), ( 4, 19 ) ) )
    , ( "row", ( ( 0, 5 ), ( 8, 19 ) ) )
    , ( "seat", ( ( 0, 13 ), ( 16, 19 ) ) )
    ]


myTicketTest : List number
myTicketTest =
    [ 11, 12, 13 ]


nearbyTicketsTest : List (List number)
nearbyTicketsTest =
    [ [ 3, 9, 18 ]
    , [ 15, 1, 5 ]
    , [ 5, 14, 9 ]
    ]


d16RangesT =
    [ ( 1, 3 )
    , ( 5, 7 )
    , ( 6, 11 )
    , ( 33, 44 )
    , ( 13, 40 )
    , ( 45, 50 )
    ]


d16Ranges =
    [ ( 45, 609 )
    , ( 616, 954 )
    , ( 32, 194 )
    , ( 211, 972 )
    , ( 35, 732 )
    , ( 744, 970 )
    , ( 40, 626 )
    , ( 651, 952 )
    , ( 44, 170 )
    , ( 184, 962 )
    , ( 49, 528 )
    , ( 538, 954 )
    , ( 36, 448 )
    , ( 464, 956 )
    , ( 48, 356 )
    , ( 373, 972 )
    , ( 25, 118 )
    , ( 132, 954 )
    , ( 43, 703 )
    , ( 719, 965 )
    , ( 29, 822 )
    , ( 828, 961 )
    , ( 25, 131 )
    , ( 151, 967 )
    , ( 44, 784 )
    , ( 794, 958 )
    , ( 25, 498 )
    , ( 511, 951 )
    , ( 44, 905 )
    , ( 916, 973 )
    , ( 26, 756 )
    , ( 777, 960 )
    , ( 36, 803 )
    , ( 819, 954 )
    , ( 33, 318 )
    , ( 335, 967 )
    , ( 46, 558 )
    , ( 570, 969 )
    , ( 47, 249 )
    , ( 265, 972 )
    ]


d16NearbyT =
    [ 7
    , 3
    , 47
    , 40
    , 4
    , 50
    , 55
    , 2
    , 20
    , 38
    , 6
    , 12
    ]


d16Nearby =
    [ 852
    , 748
    , 166
    , 696
    , 714
    , 108
    , 222
    , 229
    , 152
    , 731
    , 513
    , 879
    , 551
    , 837
    , 291
    , 384
    , 156
    , 72
    , 78
    , 685
    , 617
    , 653
    , 290
    , 113
    , 846
    , 782
    , 621
    , 607
    , 231
    , 117
    , 411
    , 920
    , 442
    , 249
    , 434
    , 597
    , 528
    , 702
    , 201
    , 684
    , 385
    , 424
    , 169
    , 712
    , 795
    , 477
    , 167
    , 935
    , 838
    , 445
    , 515
    , 304
    , 108
    , 229
    , 194
    , 304
    , 930
    , 655
    , 470
    , 389
    , 479
    , 117
    , 603
    , 349
    , 748
    , 540
    , 834
    , 406
    , 882
    , 502
    , 841
    , 296
    , 470
    , 476
    , 523
    , 50
    , 62
    , 673
    , 228
    , 100
    , 943
    , 616
    , 662
    , 858
    , 840
    , 616
    , 156
    , 152
    , 943
    , 284
    , 588
    , 861
    , 582
    , 215
    , 747
    , 392
    , 374
    , 826
    , 895
    , 730
    , 430
    , 83
    , 846
    , 100
    , 267
    , 447
    , 159
    , 90
    , 478
    , 160
    , 985
    , 164
    , 513
    , 424
    , 802
    , 72
    , 798
    , 420
    , 493
    , 668
    , 235
    , 668
    , 884
    , 544
    , 660
    , 212
    , 114
    , 875
    , 343
    , 861
    , 190
    , 904
    , 676
    , 585
    , 191
    , 484
    , 825
    , 835
    , 284
    , 803
    , 164
    , 691
    , 481
    , 839
    , 421
    , 868
    , 897
    , 615
    , 373
    , 835
    , 949
    , 664
    , 154
    , 316
    , 870
    , 414
    , 306
    , 719
    , 446
    , 654
    , 427
    , 695
    , 216
    , 218
    , 834
    , 949
    , 497
    , 395
    , 599
    , 585
    , 99
    , 156
    , 721
    , 515
    , 696
    , 862
    , 429
    , 659
    , 645
    , 307
    , 438
    , 782
    , 442
    , 72
    , 703
    , 865
    , 903
    , 471
    , 112
    , 623
    , 58
    , 276
    , 481
    , 832
    , 141
    , 341
    , 777
    , 721
    , 468
    , 344
    , 555
    , 653
    , 944
    , 292
    , 870
    , 94
    , 696
    , 926
    , 544
    , 830
    , 424
    , 343
    , 61
    , 51
    , 119
    , 584
    , 444
    , 296
    , 700
    , 572
    , 350
    , 232
    , 822
    , 454
    , 284
    , 477
    , 294
    , 70
    , 896
    , 474
    , 238
    , 352
    , 754
    , 157
    , 619
    , 447
    , 271
    , 71
    , 834
    , 402
    , 56
    , 410
    , 604
    , 157
    , 579
    , 266
    , 483
    , 826
    , 92
    , 266
    , 819
    , 920
    , 658
    , 888
    , 473
    , 311
    , 403
    , 431
    , 672
    , 853
    , 353
    , 10
    , 862
    , 588
    , 837
    , 547
    , 686
    , 104
    , 79
    , 877
    , 158
    , 676
    , 497
    , 894
    , 380
    , 821
    , 99
    , 246
    , 69
    , 663
    , 317
    , 609
    , 343
    , 863
    , 900
    , 70
    , 62
    , 163
    , 416
    , 100
    , 83
    , 874
    , 834
    , 687
    , 237
    , 746
    , 938
    , 146
    , 215
    , 654
    , 538
    , 235
    , 384
    , 313
    , 604
    , 573
    , 63
    , 883
    , 866
    , 92
    , 728
    , 588
    , 409
    , 282
    , 798
    , 349
    , 429
    , 800
    , 454
    , 622
    , 88
    , 512
    , 392
    , 70
    , 229
    , 686
    , 887
    , 643
    , 727
    , 318
    , 858
    , 349
    , 96
    , 274
    , 723
    , 475
    , 393
    , 97
    , 290
    , 605
    , 860
    , 526
    , 514
    , 898
    , 935
    , 85
    , 856
    , 580
    , 297
    , 826
    , 466
    , 429
    , 584
    , 483
    , 928
    , 65
    , 79
    , 225
    , 385
    , 490
    , 478
    , 399
    , 152
    , 571
    , 240
    , 728
    , 467
    , 930
    , 496
    , 878
    , 285
    , 675
    , 779
    , 5
    , 72
    , 336
    , 442
    , 411
    , 794
    , 939
    , 678
    , 231
    , 165
    , 54
    , 100
    , 596
    , 663
    , 469
    , 161
    , 835
    , 293
    , 699
    , 475
    , 229
    , 572
    , 282
    , 624
    , 847
    , 892
    , 990
    , 699
    , 730
    , 307
    , 901
    , 853
    , 477
    , 482
    , 597
    , 214
    , 663
    , 829
    , 486
    , 64
    , 699
    , 814
    , 919
    , 194
    , 311
    , 868
    , 554
    , 513
    , 579
    , 845
    , 113
    , 185
    , 888
    , 555
    , 579
    , 353
    , 248
    , 722
    , 245
    , 245
    , 482
    , 763
    , 412
    , 512
    , 574
    , 539
    , 626
    , 456
    , 749
    , 526
    , 93
    , 678
    , 282
    , 585
    , 308
    , 245
    , 485
    , 938
    , 616
    , 867
    , 114
    , 239
    , 446
    , 727
    , 885
    , 376
    , 617
    , 936
    , 835
    , 988
    , 56
    , 942
    , 822
    , 839
    , 520
    , 185
    , 878
    , 84
    , 523
    , 293
    , 301
    , 406
    , 557
    , 156
    , 745
    , 926
    , 849
    , 423
    , 85
    , 476
    , 928
    , 985
    , 186
    , 551
    , 278
    , 424
    , 86
    , 744
    , 744
    , 434
    , 160
    , 435
    , 77
    , 667
    , 386
    , 685
    , 301
    , 90
    , 167
    , 540
    , 448
    , 889
    , 919
    , 894
    , 378
    , 237
    , 533
    , 186
    , 408
    , 86
    , 900
    , 498
    , 384
    , 217
    , 184
    , 244
    , 621
    , 115
    , 394
    , 587
    , 752
    , 558
    , 675
    , 489
    , 932
    , 838
    , 596
    , 941
    , 728
    , 485
    , 925
    , 111
    , 693
    , 571
    , 639
    , 684
    , 546
    , 943
    , 605
    , 192
    , 609
    , 347
    , 388
    , 480
    , 439
    , 448
    , 584
    , 486
    , 695
    , 229
    , 783
    , 614
    , 488
    , 237
    , 854
    , 558
    , 844
    , 411
    , 215
    , 396
    , 674
    , 829
    , 314
    , 923
    , 846
    , 94
    , 63
    , 690
    , 572
    , 721
    , 64
    , 4
    , 189
    , 421
    , 945
    , 845
    , 300
    , 515
    , 379
    , 934
    , 841
    , 350
    , 443
    , 226
    , 231
    , 93
    , 859
    , 819
    , 69
    , 112
    , 84
    , 437
    , 825
    , 870
    , 916
    , 831
    , 431
    , 614
    , 473
    , 583
    , 476
    , 586
    , 703
    , 419
    , 184
    , 683
    , 660
    , 298
    , 949
    , 858
    , 682
    , 931
    , 356
    , 340
    , 271
    , 412
    , 523
    , 892
    , 413
    , 849
    , 194
    , 248
    , 341
    , 192
    , 60
    , 442
    , 381
    , 887
    , 243
    , 185
    , 473
    , 588
    , 790
    , 78
    , 666
    , 110
    , 336
    , 556
    , 97
    , 930
    , 495
    , 380
    , 491
    , 726
    , 419
    , 166
    , 60
    , 933
    , 133
    , 942
    , 419
    , 290
    , 80
    , 422
    , 946
    , 185
    , 472
    , 583
    , 415
    , 947
    , 719
    , 384
    , 697
    , 544
    , 919
    , 356
    , 544
    , 290
    , 310
    , 790
    , 920
    , 749
    , 777
    , 492
    , 50
    , 617
    , 580
    , 407
    , 65
    , 665
    , 78
    , 507
    , 269
    , 89
    , 874
    , 901
    , 314
    , 622
    , 698
    , 112
    , 308
    , 927
    , 656
    , 832
    , 226
    , 307
    , 783
    , 994
    , 876
    , 489
    , 748
    , 70
    , 662
    , 216
    , 249
    , 581
    , 64
    , 442
    , 683
    , 696
    , 280
    , 118
    , 274
    , 836
    , 310
    , 399
    , 681
    , 303
    , 94
    , 602
    , 827
    , 355
    , 245
    , 99
    , 155
    , 313
    , 444
    , 820
    , 651
    , 310
    , 702
    , 838
    , 943
    , 92
    , 60
    , 386
    , 699
    , 211
    , 570
    , 889
    , 698
    , 848
    , 934
    , 187
    , 105
    , 470
    , 907
    , 99
    , 349
    , 294
    , 724
    , 155
    , 573
    , 665
    , 63
    , 929
    , 277
    , 374
    , 63
    , 287
    , 107
    , 517
    , 577
    , 819
    , 721
    , 86
    , 673
    , 581
    , 354
    , 511
    , 94
    , 110
    , 169
    , 703
    , 730
    , 613
    , 756
    , 265
    , 925
    , 881
    , 780
    , 238
    , 91
    , 51
    , 867
    , 891
    , 231
    , 174
    , 67
    , 898
    , 236
    , 474
    , 433
    , 520
    , 658
    , 932
    , 391
    , 84
    , 779
    , 860
    , 82
    , 212
    , 858
    , 749
    , 223
    , 152
    , 225
    , 118
    , 220
    , 306
    , 471
    , 380
    , 61
    , 698
    , 4
    , 88
    , 730
    , 931
    , 902
    , 981
    , 492
    , 594
    , 60
    , 335
    , 166
    , 301
    , 233
    , 274
    , 797
    , 666
    , 236
    , 191
    , 217
    , 924
    , 310
    , 107
    , 673
    , 861
    , 158
    , 884
    , 670
    , 486
    , 752
    , 944
    , 249
    , 928
    , 301
    , 269
    , 218
    , 935
    , 878
    , 289
    , 186
    , 379
    , 712
    , 881
    , 314
    , 95
    , 81
    , 672
    , 616
    , 409
    , 184
    , 306
    , 436
    , 871
    , 355
    , 422
    , 821
    , 877
    , 676
    , 716
    , 408
    , 187
    , 848
    , 520
    , 687
    , 902
    , 311
    , 189
    , 799
    , 246
    , 341
    , 474
    , 477
    , 544
    , 89
    , 476
    , 226
    , 666
    , 483
    , 272
    , 830
    , 531
    , 153
    , 55
    , 51
    , 947
    , 220
    , 594
    , 212
    , 673
    , 593
    , 437
    , 820
    , 899
    , 855
    , 884
    , 667
    , 934
    , 440
    , 503
    , 50
    , 947
    , 465
    , 118
    , 592
    , 194
    , 724
    , 887
    , 730
    , 934
    , 465
    , 841
    , 427
    , 693
    , 487
    , 526
    , 236
    , 538
    , 468
    , 828
    , 652
    , 175
    , 386
    , 781
    , 90
    , 473
    , 285
    , 392
    , 249
    , 339
    , 748
    , 796
    , 898
    , 481
    , 237
    , 901
    , 152
    , 883
    , 665
    , 94
    , 442
    , 791
    , 624
    , 229
    , 606
    , 802
    , 346
    , 724
    , 949
    , 99
    , 659
    , 213
    , 58
    , 263
    , 722
    , 600
    , 622
    , 924
    , 947
    , 163
    , 877
    , 160
    , 723
    , 348
    , 494
    , 801
    , 268
    , 937
    , 11
    , 60
    , 265
    , 118
    , 929
    , 109
    , 152
    , 470
    , 832
    , 697
    , 110
    , 161
    , 396
    , 604
    , 101
    , 97
    , 99
    , 316
    , 924
    , 302
    , 190
    , 386
    , 675
    , 938
    , 62
    , 681
    , 724
    , 777
    , 234
    , 199
    , 445
    , 288
    , 466
    , 480
    , 869
    , 97
    , 244
    , 512
    , 294
    , 587
    , 690
    , 420
    , 102
    , 512
    , 929
    , 876
    , 786
    , 754
    , 337
    , 544
    , 285
    , 784
    , 81
    , 575
    , 425
    , 298
    , 376
    , 479
    , 652
    , 918
    , 435
    , 773
    , 492
    , 618
    , 936
    , 298
    , 99
    , 82
    , 477
    , 780
    , 466
    , 523
    , 945
    , 98
    , 511
    , 162
    , 755
    , 673
    , 472
    , 653
    , 427
    , 652
    , 431
    , 551
    , 260
    , 409
    , 440
    , 351
    , 778
    , 75
    , 309
    , 747
    , 889
    , 726
    , 169
    , 221
    , 890
    , 512
    , 376
    , 753
    , 527
    , 224
    , 554
    , 660
    , 871
    , 311
    , 296
    , 833
    , 400
    , 379
    , 192
    , 696
    , 294
    , 410
    , 741
    , 606
    , 664
    , 923
    , 348
    , 343
    , 297
    , 304
    , 225
    , 827
    , 83
    , 876
    , 672
    , 219
    , 722
    , 550
    , 600
    , 389
    , 820
    , 229
    , 673
    , 297
    , 544
    , 689
    , 492
    , 515
    , 299
    , 466
    , 920
    , 387
    , 239
    , 307
    , 405
    , 375
    , 867
    , 226
    , 302
    , 877
    , 461
    , 477
    , 421
    , 519
    , 702
    , 73
    , 524
    , 544
    , 243
    , 58
    , 495
    , 884
    , 164
    , 992
    , 97
    , 220
    , 434
    , 538
    , 583
    , 51
    , 218
    , 719
    , 247
    , 280
    , 407
    , 277
    , 552
    , 925
    , 51
    , 168
    , 316
    , 404
    , 899
    , 903
    , 941
    , 376
    , 103
    , 436
    , 917
    , 722
    , 19
    , 355
    , 698
    , 407
    , 298
    , 316
    , 114
    , 89
    , 623
    , 672
    , 167
    , 95
    , 935
    , 685
    , 686
    , 193
    , 654
    , 303
    , 713
    , 234
    , 783
    , 747
    , 626
    , 868
    , 392
    , 195
    , 72
    , 901
    , 486
    , 241
    , 159
    , 60
    , 58
    , 442
    , 211
    , 837
    , 217
    , 352
    , 279
    , 516
    , 156
    , 833
    , 661
    , 442
    , 265
    , 872
    , 267
    , 101
    , 83
    , 349
    , 513
    , 486
    , 533
    , 241
    , 113
    , 236
    , 445
    , 885
    , 672
    , 833
    , 675
    , 854
    , 931
    , 574
    , 165
    , 479
    , 448
    , 730
    , 617
    , 289
    , 185
    , 585
    , 308
    , 784
    , 91
    , 90
    , 53
    , 661
    , 632
    , 307
    , 722
    , 116
    , 539
    , 794
    , 412
    , 105
    , 483
    , 64
    , 795
    , 482
    , 486
    , 737
    , 853
    , 483
    , 723
    , 679
    , 726
    , 570
    , 744
    , 376
    , 307
    , 382
    , 854
    , 348
    , 608
    , 134
    , 443
    , 920
    , 418
    , 553
    , 753
    , 217
    , 624
    , 311
    , 75
    , 555
    , 382
    , 597
    , 297
    , 309
    , 855
    , 153
    , 89
    , 778
    , 583
    , 579
    , 653
    , 681
    , 819
    , 110
    , 830
    , 50
    , 303
    , 604
    , 783
    , 249
    , 339
    , 835
    , 929
    , 229
    , 108
    , 19
    , 926
    , 516
    , 949
    , 74
    , 496
    , 584
    , 170
    , 115
    , 297
    , 93
    , 497
    , 921
    , 916
    , 571
    , 846
    , 782
    , 597
    , 437
    , 744
    , 458
    , 347
    , 110
    , 607
    , 903
    , 488
    , 448
    , 355
    , 377
    , 852
    , 872
    , 773
    , 511
    , 731
    , 429
    , 81
    , 393
    , 228
    , 518
    , 192
    , 625
    , 61
    , 490
    , 239
    , 118
    , 168
    , 576
    , 220
    , 670
    , 495
    , 921
    , 716
    , 438
    , 112
    , 671
    , 782
    , 751
    , 339
    , 928
    , 65
    , 293
    , 592
    , 266
    , 270
    , 237
    , 841
    , 409
    , 525
    , 584
    , 381
    , 422
    , 238
    , 2
    , 731
    , 404
    , 803
    , 220
    , 877
    , 295
    , 821
    , 918
    , 919
    , 946
    , 727
    , 387
    , 528
    , 847
    , 619
    , 498
    , 782
    , 745
    , 68
    , 444
    , 597
    , 545
    , 315
    , 580
    , 794
    , 700
    , 660
    , 343
    , 936
    , 718
    , 57
    , 877
    , 799
    , 432
    , 495
    , 87
    , 318
    , 489
    , 379
    , 461
    , 598
    , 418
    , 658
    , 595
    , 403
    , 82
    , 894
    , 298
    , 237
    , 837
    , 77
    , 587
    , 310
    , 599
    , 886
    , 784
    , 417
    , 232
    , 450
    , 947
    , 405
    , 478
    , 576
    , 52
    , 936
    , 300
    , 862
    , 783
    , 189
    , 377
    , 918
    , 113
    , 390
    , 605
    , 584
    , 870
    , 542
    , 308
    , 791
    , 300
    , 603
    , 883
    , 798
    , 586
    , 841
    , 685
    , 777
    , 782
    , 587
    , 895
    , 151
    , 304
    , 724
    , 215
    , 414
    , 873
    , 841
    , 617
    , 619
    , 861
    , 400
    , 308
    , 479
    , 455
    , 104
    , 620
    , 545
    , 159
    , 783
    , 654
    , 235
    , 802
    , 311
    , 157
    , 465
    , 159
    , 882
    , 393
    , 377
    , 745
    , 436
    , 724
    , 427
    , 854
    , 102
    , 174
    , 422
    , 169
    , 700
    , 380
    , 447
    , 91
    , 862
    , 280
    , 399
    , 464
    , 396
    , 407
    , 134
    , 117
    , 678
    , 903
    , 307
    , 341
    , 747
    , 875
    , 243
    , 550
    , 728
    , 926
    , 555
    , 496
    , 861
    , 940
    , 577
    , 441
    , 80
    , 285
    , 241
    , 553
    , 390
    , 937
    , 271
    , 467
    , 410
    , 408
    , 870
    , 977
    , 752
    , 354
    , 579
    , 553
    , 894
    , 294
    , 731
    , 326
    , 414
    , 406
    , 83
    , 828
    , 654
    , 82
    , 170
    , 667
    , 112
    , 853
    , 94
    , 188
    , 434
    , 527
    , 295
    , 803
    , 557
    , 169
    , 672
    , 82
    , 655
    , 464
    , 350
    , 157
    , 399
    , 691
    , 160
    , 745
    , 975
    , 902
    , 428
    , 877
    , 891
    , 213
    , 108
    , 340
    , 383
    , 887
    , 112
    , 719
    , 519
    , 683
    , 853
    , 190
    , 899
    , 161
    , 793
    , 850
    , 403
    , 437
    , 52
    , 890
    , 802
    , 593
    , 609
    , 229
    , 722
    , 783
    , 899
    , 785
    , 247
    , 434
    , 587
    , 936
    , 248
    , 609
    , 265
    , 84
    , 853
    , 831
    , 544
    , 861
    , 780
    , 781
    , 469
    , 301
    , 312
    , 675
    , 897
    , 263
    , 397
    , 392
    , 476
    , 928
    , 67
    , 467
    , 653
    , 697
    , 861
    , 288
    , 231
    , 623
    , 246
    , 669
    , 839
    , 273
    , 339
    , 78
    , 861
    , 339
    , 212
    , 703
    , 402
    , 285
    , 419
    , 11
    , 931
    , 880
    , 415
    , 246
    , 622
    , 72
    , 934
    , 227
    , 525
    , 861
    , 696
    , 672
    , 414
    , 265
    , 154
    , 246
    , 375
    , 585
    , 478
    , 110
    , 853
    , 406
    , 277
    , 311
    , 112
    , 612
    , 394
    , 274
    , 415
    , 896
    , 868
    , 338
    , 782
    , 467
    , 314
    , 60
    , 925
    , 224
    , 585
    , 267
    , 297
    , 984
    , 169
    , 272
    , 683
    , 390
    , 347
    , 784
    , 292
    , 917
    , 516
    , 424
    , 213
    , 802
    , 385
    , 310
    , 871
    , 154
    , 325
    , 872
    , 190
    , 898
    , 476
    , 61
    , 513
    , 464
    , 919
    , 211
    , 97
    , 468
    , 682
    , 520
    , 538
    , 695
    , 419
    , 404
    , 350
    , 598
    , 121
    , 495
    , 300
    , 858
    , 421
    , 542
    , 822
    , 778
    , 76
    , 283
    , 275
    , 752
    , 71
    , 896
    , 151
    , 851
    , 842
    , 606
    , 608
    , 667
    , 257
    , 97
    , 744
    , 288
    , 317
    , 233
    , 778
    , 618
    , 276
    , 487
    , 492
    , 345
    , 191
    , 426
    , 858
    , 306
    , 398
    , 691
    , 230
    , 755
    , 472
    , 614
    , 381
    , 937
    , 850
    , 607
    , 729
    , 477
    , 889
    , 625
    , 215
    , 288
    , 622
    , 864
    , 902
    , 719
    , 732
    , 219
    , 830
    , 858
    , 356
    , 288
    , 841
    , 830
    , 248
    , 184
    , 667
    , 198
    , 550
    , 663
    , 498
    , 246
    , 428
    , 5
    , 690
    , 693
    , 745
    , 238
    , 223
    , 153
    , 220
    , 193
    , 852
    , 744
    , 192
    , 596
    , 575
    , 832
    , 944
    , 585
    , 401
    , 296
    , 542
    , 87
    , 338
    , 732
    , 437
    , 800
    , 874
    , 309
    , 843
    , 58
    , 732
    , 665
    , 103
    , 80
    , 430
    , 850
    , 532
    , 673
    , 286
    , 374
    , 239
    , 653
    , 794
    , 918
    , 829
    , 725
    , 927
    , 534
    , 151
    , 745
    , 354
    , 575
    , 676
    , 681
    , 941
    , 749
    , 860
    , 70
    , 467
    , 60
    , 185
    , 832
    , 191
    , 373
    , 841
    , 845
    , 292
    , 797
    , 811
    , 82
    , 883
    , 270
    , 931
    , 552
    , 218
    , 575
    , 690
    , 239
    , 190
    , 778
    , 74
    , 518
    , 267
    , 374
    , 227
    , 110
    , 73
    , 855
    , 679
    , 916
    , 796
    , 339
    , 661
    , 551
    , 989
    , 683
    , 829
    , 151
    , 67
    , 437
    , 824
    , 70
    , 295
    , 752
    , 600
    , 522
    , 113
    , 624
    , 784
    , 188
    , 921
    , 488
    , 882
    , 889
    , 389
    , 266
    , 732
    , 337
    , 928
    , 803
    , 345
    , 300
    , 869
    , 232
    , 868
    , 703
    , 247
    , 796
    , 217
    , 834
    , 17
    , 599
    , 919
    , 856
    , 277
    , 160
    , 468
    , 287
    , 55
    , 302
    , 856
    , 395
    , 248
    , 848
    , 223
    , 81
    , 54
    , 679
    , 695
    , 580
    , 821
    , 558
    , 280
    , 827
    , 691
    , 746
    , 385
    , 896
    , 476
    , 948
    , 556
    , 343
    , 921
    , 383
    , 925
    , 97
    , 174
    , 937
    , 311
    , 166
    , 585
    , 394
    , 600
    , 686
    , 491
    , 698
    , 389
    , 274
    , 921
    , 240
    , 749
    , 50
    , 291
    , 430
    , 603
    , 899
    , 545
    , 156
    , 403
    , 456
    , 386
    , 658
    , 703
    , 382
    , 73
    , 337
    , 315
    , 929
    , 681
    , 922
    , 101
    , 625
    , 668
    , 376
    , 664
    , 223
    , 657
    , 298
    , 175
    , 889
    , 544
    , 752
    , 802
    , 621
    , 926
    , 847
    , 513
    , 88
    , 518
    , 905
    , 676
    , 474
    , 340
    , 847
    , 430
    , 108
    , 303
    , 725
    , 62
    , 578
    , 419
    , 747
    , 70
    , 660
    , 405
    , 218
    , 891
    , 181
    , 487
    , 406
    , 420
    , 674
    , 67
    , 931
    , 297
    , 314
    , 942
    , 586
    , 396
    , 245
    , 623
    , 551
    , 652
    , 250
    , 590
    , 77
    , 100
    , 657
    , 558
    , 542
    , 490
    , 61
    , 750
    , 223
    , 888
    , 224
    , 941
    , 875
    , 581
    , 222
    , 527
    , 217
    , 223
    , 864
    , 574
    , 287
    , 182
    , 528
    , 475
    , 830
    , 305
    , 239
    , 924
    , 316
    , 337
    , 289
    , 289
    , 431
    , 344
    , 898
    , 167
    , 594
    , 926
    , 785
    , 795
    , 933
    , 558
    , 290
    , 932
    , 934
    , 873
    , 488
    , 729
    , 756
    , 240
    , 933
    , 130
    , 51
    , 489
    , 512
    , 621
    , 79
    , 671
    , 408
    , 229
    , 102
    , 872
    , 68
    , 523
    , 377
    , 70
    , 584
    , 213
    , 131
    , 275
    , 489
    , 433
    , 689
    , 747
    , 50
    , 753
    , 88
    , 217
    , 439
    , 470
    , 597
    , 835
    , 390
    , 904
    , 353
    , 580
    , 851
    , 791
    , 888
    , 841
    , 937
    , 234
    , 835
    , 74
    , 598
    , 555
    , 582
    , 422
    , 337
    , 352
    , 64
    , 338
    , 433
    , 870
    , 750
    , 701
    , 156
    , 249
    , 725
    , 857
    , 354
    , 703
    , 126
    , 851
    , 660
    , 243
    , 623
    , 492
    , 695
    , 76
    , 490
    , 844
    , 335
    , 886
    , 859
    , 216
    , 380
    , 425
    , 490
    , 479
    , 936
    , 445
    , 326
    , 938
    , 574
    , 418
    , 848
    , 489
    , 87
    , 386
    , 800
    , 97
    , 303
    , 673
    , 303
    , 902
    , 73
    , 898
    , 619
    , 403
    , 540
    , 355
    , 55
    , 236
    , 161
    , 708
    , 940
    , 920
    , 83
    , 79
    , 246
    , 356
    , 922
    , 887
    , 318
    , 79
    , 157
    , 888
    , 586
    , 213
    , 526
    , 659
    , 318
    , 945
    , 570
    , 496
    , 947
    , 799
    , 419
    , 779
    , 128
    , 860
    , 154
    , 440
    , 168
    , 554
    , 934
    , 573
    , 594
    , 528
    , 512
    , 522
    , 398
    , 294
    , 738
    , 89
    , 474
    , 104
    , 833
    , 583
    , 849
    , 338
    , 306
    , 666
    , 521
    , 522
    , 591
    , 924
    , 558
    , 657
    , 554
    , 488
    , 93
    , 590
    , 378
    , 152
    , 194
    , 190
    , 193
    , 727
    , 403
    , 509
    , 291
    , 395
    , 943
    , 50
    , 379
    , 392
    , 427
    , 422
    , 916
    , 894
    , 273
    , 473
    , 68
    , 284
    , 341
    , 514
    , 847
    , 301
    , 494
    , 295
    , 384
    , 134
    , 876
    , 797
    , 487
    , 698
    , 194
    , 571
    , 714
    , 59
    , 665
    , 655
    , 78
    , 79
    , 108
    , 281
    , 293
    , 891
    , 849
    , 898
    , 387
    , 551
    , 182
    , 923
    , 483
    , 524
    , 426
    , 94
    , 237
    , 602
    , 690
    , 493
    , 884
    , 434
    , 411
    , 551
    , 750
    , 528
    , 625
    , 396
    , 249
    , 526
    , 343
    , 495
    , 784
    , 355
    , 794
    , 494
    , 240
    , 678
    , 191
    , 719
    , 848
    , 753
    , 243
    , 148
    , 115
    , 211
    , 842
    , 750
    , 390
    , 622
    , 153
    , 552
    , 548
    , 284
    , 164
    , 694
    , 383
    , 283
    , 821
    , 580
    , 376
    , 312
    , 887
    , 861
    , 247
    , 881
    , 259
    , 279
    , 345
    , 868
    , 443
    , 152
    , 228
    , 853
    , 438
    , 343
    , 654
    , 85
    , 850
    , 290
    , 277
    , 58
    , 524
    , 114
    , 5
    , 300
    , 936
    , 668
    , 602
    , 112
    , 884
    , 976
    , 606
    , 239
    , 900
    , 872
    , 863
    , 397
    , 306
    , 866
    , 866
    , 864
    , 938
    , 586
    , 905
    , 594
    , 497
    , 899
    , 394
    , 828
    , 889
    , 241
    , 241
    , 512
    , 877
    , 231
    , 879
    , 229
    , 474
    , 424
    , 275
    , 888
    , 539
    , 590
    , 831
    , 982
    , 725
    , 407
    , 248
    , 154
    , 193
    , 727
    , 107
    , 544
    , 476
    , 402
    , 856
    , 673
    , 132
    , 388
    , 848
    , 748
    , 751
    , 335
    , 407
    , 424
    , 837
    , 93
    , 916
    , 526
    , 655
    , 395
    , 931
    , 744
    , 405
    , 780
    , 75
    , 286
    , 429
    , 679
    , 580
    , 876
    , 543
    , 525
    , 932
    , 670
    , 699
    , 920
    , 138
    , 936
    , 745
    , 20
    , 297
    , 266
    , 223
    , 478
    , 353
    , 843
    , 893
    , 52
    , 655
    , 473
    , 74
    , 655
    , 248
    , 689
    , 745
    , 222
    , 702
    , 160
    , 664
    , 778
    , 443
    , 923
    , 750
    , 547
    , 431
    , 892
    , 864
    , 211
    , 289
    , 471
    , 442
    , 626
    , 848
    , 73
    , 546
    , 126
    , 187
    , 219
    , 692
    , 685
    , 289
    , 479
    , 378
    , 238
    , 884
    , 443
    , 317
    , 151
    , 787
    , 877
    , 109
    , 482
    , 850
    , 753
    , 945
    , 621
    , 352
    , 689
    , 64
    , 291
    , 294
    , 577
    , 241
    , 112
    , 557
    , 744
    , 84
    , 690
    , 315
    , 113
    , 854
    , 109
    , 625
    , 996
    , 269
    , 486
    , 662
    , 576
    , 920
    , 287
    , 623
    , 161
    , 315
    , 621
    , 348
    , 492
    , 664
    , 281
    , 946
    , 381
    , 606
    , 752
    , 309
    , 992
    , 186
    , 184
    , 68
    , 895
    , 879
    , 577
    , 107
    , 432
    , 654
    , 870
    , 439
    , 467
    , 419
    , 236
    , 447
    , 549
    , 219
    , 353
    , 485
    , 936
    , 213
    , 412
    , 823
    , 288
    , 790
    , 665
    , 747
    , 494
    , 525
    , 863
    , 421
    , 425
    , 871
    , 391
    , 422
    , 601
    , 215
    , 242
    , 609
    , 784
    , 214
    , 727
    , 869
    , 162
    , 750
    , 551
    , 756
    , 373
    , 100
    , 356
    , 222
    , 373
    , 857
    , 50
    , 236
    , 52
    , 116
    , 858
    , 930
    , 948
    , 668
    , 730
    , 936
    , 827
    , 485
    , 899
    , 839
    , 584
    , 622
    , 867
    , 242
    , 373
    , 654
    , 209
    , 169
    , 87
    , 80
    , 349
    , 538
    , 271
    , 820
    , 222
    , 483
    , 620
    , 221
    , 164
    , 293
    , 687
    , 656
    , 595
    , 724
    , 419
    , 2
    , 893
    , 385
    , 940
    , 656
    , 112
    , 113
    , 835
    , 407
    , 524
    , 703
    , 777
    , 164
    , 598
    , 491
    , 834
    , 416
    , 271
    , 216
    , 688
    , 945
    , 92
    , 652
    , 266
    , 872
    , 50
    , 733
    , 291
    , 796
    , 310
    , 900
    , 873
    , 230
    , 918
    , 93
    , 892
    , 376
    , 412
    , 470
    , 679
    , 823
    , 526
    , 353
    , 426
    , 474
    , 609
    , 674
    , 114
    , 876
    , 540
    , 278
    , 221
    , 438
    , 310
    , 918
    , 228
    , 141
    , 874
    , 228
    , 89
    , 51
    , 58
    , 861
    , 553
    , 425
    , 603
    , 154
    , 862
    , 849
    , 657
    , 553
    , 889
    , 686
    , 557
    , 153
    , 875
    , 423
    , 549
    , 620
    , 484
    , 391
    , 156
    , 921
    , 68
    , 223
    , 309
    , 219
    , 472
    , 718
    , 625
    , 591
    , 164
    , 656
    , 487
    , 240
    , 520
    , 276
    , 439
    , 239
    , 888
    , 834
    , 95
    , 132
    , 65
    , 413
    , 557
    , 90
    , 303
    , 299
    , 890
    , 247
    , 590
    , 436
    , 228
    , 868
    , 491
    , 696
    , 403
    , 118
    , 939
    , 819
    , 698
    , 64
    , 819
    , 237
    , 780
    , 341
    , 849
    , 306
    , 52
    , 791
    , 929
    , 692
    , 440
    , 848
    , 418
    , 886
    , 298
    , 88
    , 154
    , 790
    , 595
    , 755
    , 662
    , 307
    , 587
    , 866
    , 837
    , 50
    , 722
    , 398
    , 384
    , 124
    , 894
    , 570
    , 311
    , 428
    , 938
    , 52
    , 661
    , 348
    , 703
    , 599
    , 624
    , 441
    , 168
    , 588
    , 606
    , 292
    , 105
    , 819
    , 582
    , 682
    , 374
    , 296
    , 591
    , 117
    , 388
    , 221
    , 386
    , 307
    , 933
    , 830
    , 548
    , 584
    , 480
    , 918
    , 689
    , 671
    , 912
    , 935
    , 81
    , 76
    , 621
    , 821
    , 578
    , 90
    , 348
    , 68
    , 279
    , 66
    , 613
    , 288
    , 268
    , 518
    , 238
    , 881
    , 583
    , 830
    , 514
    , 382
    , 410
    , 99
    , 385
    , 317
    , 864
    , 265
    , 831
    , 801
    , 209
    , 374
    , 413
    , 420
    , 117
    , 939
    , 802
    , 590
    , 651
    , 433
    , 380
    , 931
    , 858
    , 495
    , 849
    , 430
    , 229
    , 349
    , 63
    , 214
    , 682
    , 477
    , 238
    , 868
    , 516
    , 435
    , 341
    , 188
    , 749
    , 595
    , 785
    , 888
    , 893
    , 56
    , 215
    , 279
    , 246
    , 832
    , 71
    , 802
    , 870
    , 663
    , 102
    , 872
    , 879
    , 137
    , 752
    , 393
    , 675
    , 784
    , 56
    , 55
    , 928
    , 396
    , 691
    , 335
    , 448
    , 492
    , 402
    , 243
    , 780
    , 665
    , 753
    , 782
    , 556
    , 383
    , 799
    , 332
    , 409
    , 162
    , 389
    , 936
    , 719
    , 827
    , 838
    , 579
    , 286
    , 265
    , 164
    , 875
    , 847
    , 699
    , 596
    , 694
    , 799
    , 948
    , 542
    , 117
    , 356
    , 83
    , 678
    , 798
    , 699
    , 375
    , 897
    , 425
    , 188
    , 653
    , 838
    , 177
    , 837
    , 317
    , 878
    , 522
    , 801
    , 308
    , 230
    , 830
    , 626
    , 926
    , 842
    , 292
    , 592
    , 90
    , 932
    , 56
    , 266
    , 335
    , 830
    , 675
    , 64
    , 193
    , 828
    , 930
    , 902
    , 946
    , 520
    , 483
    , 232
    , 738
    , 521
    , 842
    , 577
    , 802
    , 466
    , 400
    , 207
    , 929
    , 314
    , 236
    , 246
    , 356
    , 70
    , 350
    , 309
    , 281
    , 153
    , 616
    , 839
    , 388
    , 389
    , 307
    , 881
    , 434
    , 57
    , 466
    , 435
    , 292
    , 221
    , 398
    , 558
    , 729
    , 553
    , 169
    , 215
    , 880
    , 781
    , 988
    , 860
    , 835
    , 467
    , 688
    , 701
    , 525
    , 475
    , 270
    , 552
    , 225
    , 169
    , 106
    , 190
    , 236
    , 700
    , 266
    , 413
    , 414
    , 651
    , 167
    , 283
    , 527
    , 615
    , 282
    , 233
    , 843
    , 161
    , 441
    , 605
    , 856
    , 336
    , 269
    , 938
    , 617
    , 925
    , 165
    , 394
    , 601
    , 446
    , 628
    , 341
    , 603
    , 603
    , 387
    , 429
    , 392
    , 573
    , 550
    , 931
    , 56
    , 938
    , 167
    , 742
    , 342
    , 589
    , 495
    , 940
    , 286
    , 934
    , 794
    , 467
    , 550
    , 939
    , 853
    , 77
    , 54
    , 476
    , 748
    , 674
    , 355
    , 665
    , 576
    , 440
    , 480
    , 85
    , 88
    , 317
    , 898
    , 679
    , 459
    , 836
    , 843
    , 436
    , 388
    , 436
    , 936
    , 588
    , 98
    , 238
    , 899
    , 655
    , 474
    , 878
    , 778
    , 290
    , 747
    , 976
    , 378
    , 443
    , 845
    , 948
    , 583
    , 245
    , 519
    , 623
    , 429
    , 277
    , 97
    , 694
    , 678
    , 701
    , 600
    , 902
    , 667
    , 312
    , 478
    , 581
    , 921
    , 522
    , 520
    , 872
    , 299
    , 773
    , 480
    , 164
    , 543
    , 684
    , 242
    , 572
    , 825
    , 400
    , 59
    , 226
    , 77
    , 902
    , 78
    , 604
    , 720
    , 890
    , 684
    , 71
    , 242
    , 99
    , 864
    , 594
    , 494
    , 163
    , 588
    , 211
    , 794
    , 75
    , 458
    , 161
    , 292
    , 679
    , 488
    , 575
    , 226
    , 401
    , 75
    , 947
    , 729
    , 938
    , 690
    , 885
    , 831
    , 578
    , 112
    , 240
    , 979
    , 229
    , 93
    , 928
    , 841
    , 281
    , 437
    , 285
    , 620
    , 581
    , 346
    , 240
    , 235
    , 874
    , 242
    , 387
    , 836
    , 95
    , 374
    , 822
    , 843
    , 211
    , 306
    , 82
    , 945
    , 690
    , 24
    , 114
    , 543
    , 470
    , 58
    , 218
    , 117
    , 658
    , 617
    , 724
    , 402
    , 881
    , 248
    , 485
    , 703
    , 574
    , 898
    , 655
    , 233
    , 597
    , 487
    , 412
    , 495
    , 458
    , 872
    , 346
    , 273
    , 727
    , 86
    , 190
    , 849
    , 439
    , 853
    , 939
    , 859
    , 616
    , 669
    , 243
    , 875
    , 671
    , 650
    , 76
    , 218
    , 747
    , 299
    , 699
    , 883
    , 930
    , 545
    , 884
    , 104
    , 513
    , 76
    , 170
    , 591
    , 587
    , 403
    , 896
    , 693
    , 487
    , 703
    , 836
    , 710
    , 92
    , 231
    , 228
    , 830
    , 226
    , 288
    , 53
    , 740
    , 389
    , 110
    , 755
    , 491
    , 555
    , 574
    , 421
    , 294
    , 478
    , 445
    , 428
    , 519
    , 796
    , 622
    , 74
    , 97
    , 302
    , 50
    , 783
    , 381
    , 381
    , 626
    , 868
    , 621
    , 468
    , 850
    , 345
    , 101
    , 719
    , 266
    , 851
    , 490
    , 519
    , 727
    , 222
    , 106
    , 263
    , 943
    , 442
    , 289
    , 313
    , 317
    , 783
    , 448
    , 698
    , 74
    , 117
    , 83
    , 834
    , 835
    , 432
    , 595
    , 74
    , 533
    , 475
    , 356
    , 872
    , 189
    , 106
    , 234
    , 488
    , 117
    , 901
    , 831
    , 995
    , 471
    , 888
    , 268
    , 725
    , 799
    , 375
    , 750
    , 222
    , 488
    , 516
    , 522
    , 103
    , 662
    , 157
    , 537
    , 377
    , 58
    , 550
    , 599
    , 237
    , 356
    , 170
    , 848
    , 157
    , 492
    , 794
    , 270
    , 852
    , 355
    , 318
    , 382
    , 677
    , 112
    , 71
    , 473
    , 277
    , 749
    , 593
    , 311
    , 888
    , 278
    , 670
    , 376
    , 463
    , 732
    , 779
    , 99
    , 486
    , 552
    , 356
    , 113
    , 597
    , 376
    , 871
    , 583
    , 377
    , 216
    , 477
    , 71
    , 163
    , 664
    , 888
    , 339
    , 798
    , 436
    , 996
    , 378
    , 443
    , 747
    , 830
    , 315
    , 272
    , 592
    , 574
    , 555
    , 618
    , 188
    , 831
    , 85
    , 465
    , 479
    , 380
    , 94
    , 737
    , 802
    , 337
    , 882
    , 431
    , 302
    , 217
    , 543
    , 187
    , 654
    , 388
    , 527
    , 93
    , 943
    , 549
    , 891
    , 70
    , 792
    , 589
    , 899
    , 409
    , 393
    , 234
    , 703
    , 350
    , 378
    , 517
    , 783
    , 347
    , 546
    , 783
    , 292
    , 17
    , 90
    , 653
    , 417
    , 314
    , 158
    , 231
    , 839
    , 155
    , 448
    , 849
    , 936
    , 497
    , 877
    , 111
    , 488
    , 294
    , 478
    , 861
    , 116
    , 664
    , 74
    , 652
    , 619
    , 395
    , 798
    , 445
    , 831
    , 718
    , 80
    , 245
    , 94
    , 601
    , 432
    , 109
    , 489
    , 873
    , 229
    , 795
    , 214
    , 109
    , 436
    , 871
    , 558
    , 516
    , 946
    , 239
    , 223
    , 936
    , 601
    , 667
    , 392
    , 208
    , 441
    , 420
    , 308
    , 598
    , 602
    , 798
    , 751
    , 599
    , 623
    , 784
    , 462
    , 701
    , 70
    , 443
    , 286
    , 274
    , 348
    , 296
    , 221
    , 546
    , 248
    , 469
    , 589
    , 415
    , 65
    , 690
    , 699
    , 341
    , 904
    , 475
    , 682
    , 860
    , 614
    , 68
    , 581
    , 245
    , 422
    , 283
    , 847
    , 117
    , 428
    , 693
    , 340
    , 476
    , 669
    , 522
    , 880
    , 237
    , 66
    , 52
    , 879
    , 346
    , 597
    , 603
    , 679
    , 840
    , 530
    , 924
    , 378
    , 340
    , 667
    , 586
    , 384
    , 57
    , 90
    , 526
    , 609
    , 305
    , 214
    , 869
    , 350
    , 679
    , 872
    , 617
    , 207
    , 587
    , 415
    , 113
    , 865
    , 106
    , 225
    , 400
    , 285
    , 214
    , 287
    , 730
    , 899
    , 309
    , 274
    , 74
    , 114
    , 399
    , 76
    , 598
    , 308
    , 521
    , 200
    , 541
    , 441
    , 876
    , 57
    , 277
    , 885
    , 887
    , 894
    , 548
    , 410
    , 186
    , 317
    , 307
    , 402
    , 436
    , 483
    , 920
    , 470
    , 753
    , 492
    , 66
    , 553
    , 844
    , 283
    , 604
    , 755
    , 197
    , 554
    , 315
    , 697
    , 662
    , 727
    , 593
    , 644
    , 890
    , 315
    , 448
    , 396
    , 214
    , 676
    , 73
    , 575
    , 314
    , 285
    , 747
    , 862
    , 618
    , 835
    , 423
    , 872
    , 893
    , 379
    , 848
    , 216
    , 65
    , 940
    , 288
    , 51
    , 757
    , 231
    , 653
    , 542
    , 570
    , 352
    , 479
    , 831
    , 838
    , 619
    , 440
    , 576
    , 695
    , 665
    , 304
    , 745
    , 793
    , 470
    , 306
    , 609
    , 555
    , 842
    , 431
    , 860
    , 662
    , 284
    , 897
    , 659
    , 784
    , 598
    , 512
    , 699
    , 66
    , 190
    , 276
    , 741
    , 538
    , 833
    , 548
    , 430
    , 921
    , 686
    , 387
    , 161
    , 437
    , 96
    , 281
    , 424
    , 413
    , 307
    , 513
    , 300
    , 295
    , 224
    , 432
    , 663
    , 617
    , 285
    , 519
    , 94
    , 573
    , 721
    , 754
    , 476
    , 429
    , 688
    , 86
    , 647
    , 75
    , 192
    , 593
    , 617
    , 53
    , 289
    , 551
    , 755
    , 90
    , 137
    , 304
    , 493
    , 67
    , 446
    , 408
    , 95
    , 618
    , 796
    , 700
    , 847
    , 720
    , 106
    , 118
    , 936
    , 545
    , 337
    , 172
    , 384
    , 602
    , 690
    , 344
    , 59
    , 347
    , 102
    , 581
    , 551
    , 115
    , 404
    , 480
    , 821
    , 586
    , 59
    , 243
    , 709
    , 269
    , 57
    , 265
    , 412
    , 601
    , 273
    , 64
    , 74
    , 859
    , 782
    , 725
    , 945
    , 598
    , 224
    , 671
    , 942
    , 289
    , 756
    , 781
    , 476
    , 5
    , 219
    , 93
    , 306
    , 693
    , 94
    , 374
    , 929
    , 95
    , 350
    , 680
    , 302
    , 226
    , 939
    , 274
    , 681
    , 528
    , 75
    , 850
    , 585
    , 427
    , 411
    , 440
    , 335
    , 166
    , 887
    , 754
    , 174
    , 920
    , 574
    , 72
    , 304
    , 553
    , 865
    , 921
    , 596
    , 523
    , 587
    , 438
    , 354
    , 379
    , 277
    , 6
    , 167
    , 777
    , 802
    , 414
    , 942
    , 695
    , 723
    , 158
    , 221
    , 393
    , 191
    , 52
    , 432
    , 314
    , 852
    , 298
    , 160
    , 266
    , 997
    , 690
    , 590
    , 432
    , 890
    , 302
    , 857
    , 526
    , 284
    , 237
    , 394
    , 464
    , 189
    , 169
    , 289
    , 687
    , 247
    , 52
    , 673
    , 265
    , 387
    , 920
    , 574
    , 859
    , 659
    , 158
    , 882
    , 268
    , 886
    , 316
    , 310
    , 114
    , 312
    , 347
    , 539
    , 818
    , 590
    , 419
    , 751
    , 163
    , 435
    , 521
    , 314
    , 394
    , 70
    , 540
    , 403
    , 238
    , 160
    , 827
    , 819
    , 422
    , 659
    , 920
    , 426
    , 605
    , 479
    , 745
    , 476
    , 719
    , 519
    , 151
    , 997
    , 422
    , 301
    , 684
    , 944
    , 383
    , 275
    , 93
    , 656
    , 392
    , 218
    , 729
    , 513
    , 626
    , 493
    , 293
    , 597
    , 698
    , 549
    , 620
    , 512
    , 901
    , 991
    , 778
    , 272
    , 512
    , 415
    , 416
    , 466
    , 216
    , 667
    , 527
    , 901
    , 605
    , 662
    , 413
    , 79
    , 286
    , 729
    , 312
    , 829
    , 93
    , 431
    , 69
    , 52
    , 269
    , 218
    , 513
    , 52
    , 788
    , 350
    , 231
    , 288
    , 777
    , 435
    , 542
    , 394
    , 589
    , 93
    , 90
    , 162
    , 375
    , 295
    , 799
    , 84
    , 939
    , 160
    , 461
    , 239
    , 213
    , 856
    , 798
    , 547
    , 374
    , 337
    , 723
    , 54
    , 720
    , 751
    , 852
    , 431
    , 380
    , 834
    , 902
    , 947
    , 358
    , 219
    , 746
    , 558
    , 749
    , 598
    , 477
    , 882
    , 270
    , 92
    , 732
    , 669
    , 625
    , 938
    , 604
    , 397
    , 935
    , 889
    , 557
    , 240
    , 313
    , 272
    , 928
    , 861
    , 577
    , 671
    , 447
    , 519
    , 331
    , 864
    , 546
    , 749
    , 579
    , 600
    , 398
    , 692
    , 447
    , 443
    , 56
    , 623
    , 998
    , 165
    , 871
    , 233
    , 213
    , 284
    , 527
    , 683
    , 583
    , 242
    , 588
    , 439
    , 469
    , 853
    , 24
    , 386
    , 65
    , 193
    , 518
    , 83
    , 409
    , 353
    , 213
    , 916
    , 486
    , 224
    , 573
    , 76
    , 385
    , 439
    , 672
    , 66
    , 383
    , 943
    , 871
    , 373
    , 992
    , 861
    , 605
    , 514
    , 675
    , 693
    , 593
    , 864
    , 351
    , 853
    , 557
    , 401
    , 88
    , 88
    , 862
    , 597
    , 439
    , 484
    , 431
    , 378
    , 271
    , 796
    , 344
    , 713
    , 899
    , 597
    , 870
    , 59
    , 277
    , 784
    , 512
    , 588
    , 66
    , 897
    , 868
    , 840
    , 93
    , 744
    , 484
    , 183
    , 88
    , 687
    , 922
    , 607
    , 842
    , 95
    , 573
    , 605
    , 246
    , 799
    , 241
    , 583
    , 600
    , 428
    , 352
    , 65
    , 835
    , 163
    , 404
    , 940
    , 826
    , 822
    , 514
    , 858
    , 851
    , 778
    , 578
    , 266
    , 238
    , 435
    , 281
    , 694
    , 286
    , 283
    , 388
    , 687
    , 869
    , 54
    , 272
    , 536
    , 266
    , 572
    , 853
    , 478
    , 726
    , 403
    , 722
    , 919
    , 943
    , 840
    , 756
    , 828
    , 248
    , 466
    , 164
    , 346
    , 624
    , 314
    , 495
    , 277
    , 923
    , 198
    , 102
    , 834
    , 891
    , 309
    , 475
    , 118
    , 342
    , 489
    , 687
    , 245
    , 548
    , 409
    , 440
    , 846
    , 621
    , 557
    , 158
    , 674
    , 574
    , 395
    , 298
    , 582
    , 679
    , 211
    , 869
    , 79
    , 376
    , 894
    , 2
    , 343
    , 302
    , 51
    , 335
    , 558
    , 439
    , 61
    , 466
    , 350
    , 106
    , 111
    , 668
    , 298
    , 291
    , 282
    , 905
    , 835
    , 547
    , 101
    , 20
    , 604
    , 899
    , 55
    , 655
    , 545
    , 158
    , 686
    , 541
    , 587
    , 829
    , 477
    , 780
    , 543
    , 858
    , 288
    , 684
    , 307
    , 439
    , 159
    , 829
    , 517
    , 654
    , 424
    , 790
    , 293
    , 224
    , 902
    , 822
    , 696
    , 391
    , 520
    , 346
    , 620
    , 525
    , 86
    , 293
    , 468
    , 557
    , 279
    , 307
    , 978
    , 939
    , 720
    , 275
    , 291
    , 279
    , 439
    , 678
    , 338
    , 932
    , 345
    , 545
    , 747
    , 676
    , 72
    , 393
    , 498
    , 936
    , 302
    , 889
    , 16
    , 515
    , 689
    , 900
    , 74
    , 583
    , 858
    , 572
    , 751
    , 590
    , 526
    , 864
    , 556
    , 67
    , 56
    , 294
    , 213
    , 394
    , 195
    , 235
    , 719
    , 383
    , 885
    , 275
    , 549
    , 877
    , 439
    , 272
    , 625
    , 599
    , 748
    , 214
    , 381
    , 731
    , 744
    , 515
    , 823
    , 226
    , 667
    , 939
    , 108
    , 395
    , 658
    , 476
    , 58
    , 223
    , 60
    , 217
    , 349
    , 164
    , 273
    , 903
    , 836
    , 686
    , 823
    , 587
    , 518
    , 597
    , 314
    , 291
    , 73
    , 466
    , 223
    , 675
    , 170
    , 444
    , 651
    , 429
    , 476
    , 159
    , 421
    , 575
    , 614
    , 920
    , 99
    , 447
    , 278
    , 571
    , 84
    , 83
    , 312
    , 727
    , 904
    , 338
    , 98
    , 106
    , 349
    , 683
    , 749
    , 282
    , 830
    , 661
    , 648
    , 538
    , 282
    , 307
    , 528
    , 70
    , 291
    , 547
    , 848
    , 600
    , 443
    , 593
    , 781
    , 350
    , 616
    , 698
    , 589
    , 581
    , 185
    , 724
    , 104
    , 147
    , 68
    , 69
    , 522
    , 490
    , 606
    , 695
    , 653
    , 799
    , 897
    , 318
    , 151
    , 234
    , 940
    , 295
    , 751
    , 160
    , 388
    , 246
    , 517
    , 941
    , 485
    , 898
    , 654
    , 602
    , 803
    , 494
    , 619
    , 2
    , 102
    , 353
    , 631
    , 429
    , 731
    , 95
    , 781
    , 652
    , 383
    , 862
    , 54
    , 240
    , 691
    , 157
    , 616
    , 292
    , 272
    , 596
    , 386
    , 234
    , 702
    , 390
    , 528
    , 51
    , 994
    , 96
    , 189
    , 472
    , 291
    , 831
    , 156
    , 169
    , 56
    , 623
    , 471
    , 663
    , 108
    , 212
    , 354
    , 385
    , 725
    , 652
    , 249
    , 751
    , 657
    , 270
    , 187
    , 604
    , 839
    , 331
    , 216
    , 779
    , 802
    , 355
    , 296
    , 822
    , 899
    , 237
    , 447
    , 187
    , 168
    , 926
    , 669
    , 749
    , 235
    , 489
    , 540
    , 161
    , 426
    , 820
    , 166
    , 779
    , 9
    , 427
    , 225
    , 91
    , 863
    , 527
    , 657
    , 297
    , 577
    , 59
    , 51
    , 164
    , 116
    , 586
    , 547
    , 102
    , 890
    , 410
    , 440
    , 192
    , 921
    , 592
    , 484
    , 825
    , 423
    , 375
    , 191
    , 347
    , 284
    , 399
    , 344
    , 831
    , 469
    , 295
    , 77
    , 864
    , 474
    , 438
    , 802
    , 232
    , 514
    , 947
    , 468
    , 580
    , 473
    , 142
    , 444
    , 547
    , 597
    , 158
    , 281
    , 598
    , 527
    , 933
    , 338
    , 237
    , 161
    , 237
    , 934
    , 933
    , 704
    , 517
    , 698
    , 98
    , 663
    , 495
    , 605
    , 677
    , 57
    , 856
    , 887
    , 95
    , 395
    , 701
    , 221
    , 728
    , 574
    , 400
    , 730
    , 427
    , 167
    , 94
    , 56
    , 860
    , 784
    , 444
    , 847
    , 662
    , 780
    , 980
    , 582
    , 888
    , 545
    , 385
    , 422
    , 487
    , 382
    , 900
    , 223
    , 829
    , 873
    , 435
    , 217
    , 653
    , 314
    , 932
    , 488
    , 976
    , 584
    , 930
    , 433
    , 940
    , 609
    , 308
    , 671
    , 377
    , 828
    , 114
    , 604
    , 544
    , 107
    , 102
    , 215
    , 290
    , 428
    , 168
    , 145
    , 352
    , 230
    , 946
    , 309
    , 382
    , 394
    , 693
    , 613
    , 549
    , 666
    , 918
    , 473
    , 832
    , 220
    , 169
    , 848
    , 874
    , 292
    , 343
    , 161
    , 782
    , 492
    , 160
    , 281
    , 847
    , 880
    , 890
    , 196
    , 297
    , 212
    , 664
    , 698
    , 653
    , 375
    , 905
    , 546
    , 354
    , 106
    , 606
    , 828
    , 249
    , 300
    , 940
    , 780
    , 382
    , 592
    , 406
    , 875
    , 798
    , 434
    , 685
    , 300
    , 633
    , 69
    , 314
    , 101
    , 557
    , 311
    , 214
    , 661
    , 381
    , 881
    , 783
    , 524
    , 578
    , 295
    , 141
    , 389
    , 162
    , 299
    , 79
    , 596
    , 873
    , 443
    , 576
    , 841
    , 747
    , 539
    , 80
    , 731
    , 345
    , 603
    , 347
    , 212
    , 244
    , 336
    , 831
    , 799
    , 434
    , 570
    , 933
    , 949
    , 662
    , 114
    , 891
    , 903
    , 656
    , 408
    , 835
    , 682
    , 451
    , 853
    , 229
    , 267
    , 156
    , 408
    , 933
    , 373
    , 401
    , 589
    , 578
    , 739
    , 653
    , 306
    , 723
    , 430
    , 220
    , 593
    , 580
    , 748
    , 194
    , 403
    , 271
    , 487
    , 851
    , 152
    , 636
    , 434
    , 528
    , 851
    , 63
    , 575
    , 606
    , 284
    , 695
    , 658
    , 783
    , 337
    , 223
    , 90
    , 489
    , 189
    , 948
    , 100
    , 288
    , 70
    , 516
    , 904
    , 187
    , 648
    , 153
    , 271
    , 409
    , 725
    , 314
    , 686
    , 889
    , 285
    , 701
    , 443
    , 306
    , 439
    , 544
    ]


dockingData =
    """mask = 00110X11X0000110X0000001000111010X00
       mem[39993] = 276
       mem[23021] = 365
       mem[59102] = 45645
       mem[30606] = 2523
       mem[38004] = 4503
       mem[47790] = 1221939
       mem[24194] = 3417
       mask = 00X10011000001X00X1010XX11X000011000
       mem[61385] = 13441
       mem[44092] = 46615
       mem[14640] = 11081
       mask = 100X01110X000110XX11X100X0111000XX01
       mem[14433] = 189475544
       mem[64841] = 3883
       mem[4069] = 144204
       mem[5170] = 5792
       mem[25427] = 1964230
       mask = 0110100100000000X00X000000010X0X1011
       mem[35438] = 52679760
       mem[34307] = 9317256
       mem[6470] = 209486
       mem[26430] = 534922265
       mask = 00X1X0X10000X11001100011X01X1X0X110X
       mem[41736] = 426776809
       mem[25126] = 35833440
       mem[11780] = 753
       mask = 00110X11000XXXX0110XX00X000001110101
       mem[57910] = 364
       mem[62893] = 40679789
       mem[35161] = 14855
       mem[58135] = 811747892
       mem[4593] = 5704
       mem[19917] = 426377
       mem[10939] = 13720296
       mask = 01110011X0XX001X01100110101000111X00
       mem[49208] = 3791
       mem[5202] = 64942111
       mem[11788] = 756
       mem[29268] = 23261551
       mask = 0X110011X0000X1001100010001X001110X0
       mem[11306] = 51811618
       mem[39974] = 1197590
       mem[31813] = 5989606
       mem[21215] = 25665
       mem[11780] = 69453544
       mem[39432] = 974
       mem[51730] = 1753761
       mask = 01111X11X010X1101011X10000011000101X
       mem[57467] = 303811
       mem[3619] = 43533
       mem[24649] = 65
       mem[57938] = 673428
       mem[35983] = 762324
       mem[53753] = 220608750
       mem[56343] = 20780764
       mask = 00X0100X00110X110101010110000X011101
       mem[15325] = 582
       mem[56283] = 3587012
       mem[17506] = 5008610
       mem[23689] = 699422813
       mem[58192] = 184520
       mem[11790] = 280477068
       mask = 000X00010001X1X011001X1111X101010100
       mem[12126] = 1370
       mem[19917] = 798054
       mem[16463] = 81889099
       mem[19502] = 1208125
       mem[62502] = 28996053
       mem[59832] = 11583256
       mem[62653] = 41447256
       mask = 0XX1X0010000011X01001101X11100011X01
       mem[3474] = 29351
       mem[48682] = 118578
       mem[5119] = 7070455
       mask = X011101101000110011010X10X10001X1010
       mem[26228] = 42448
       mem[4405] = 165485096
       mem[19948] = 495733
       mem[19917] = 950689
       mem[1342] = 3928
       mask = 00XX00110000001X01X000XXXX00011010X0
       mem[12742] = 190173218
       mem[16011] = 78978
       mem[8444] = 1013
       mask = 00111111000000101000110XX0X001X10010
       mem[15064] = 4146529
       mem[5074] = 1944
       mem[30343] = 850813
       mask = XX1100110X000XX0001000X0X000X0000101
       mem[18316] = 8163
       mem[64715] = 15571290
       mem[1214] = 1713
       mem[61047] = 64709
       mem[20756] = 1147352
       mask = 00110001000X0X10011X001X10001X0X1101
       mem[3681] = 850069711
       mem[5973] = 1125998
       mask = X001X0X1000000100100X00101100XX100X0
       mem[1929] = 14146987
       mem[13059] = 8779
       mem[42005] = 567
       mem[60928] = 265
       mask = 001X00110000X110101000100X00X10X1XXX
       mem[13504] = 14255518
       mem[51994] = 233872
       mem[10991] = 973591
       mem[35474] = 24432220
       mask = 00110XXX00010X1011010X010X0X1101X10X
       mem[4192] = 110876960
       mem[4950] = 94274
       mask = 1001001X000000100X00X0X1011110011001
       mem[45254] = 108909
       mem[1243] = 42640
       mem[11540] = 1287588
       mem[1435] = 101075962
       mem[55422] = 2489605
       mem[27943] = 237052
       mem[13919] = 322879
       mask = 001110XX0X1111100001X1011001X001X0XX
       mem[22850] = 20403
       mem[5085] = 699192
       mem[795] = 12220
       mem[15000] = 533734472
       mem[24156] = 1559
       mem[58987] = 30566
       mask = 0X11XX1100000X10X0XX10101X1010X11000
       mem[45569] = 409625967
       mem[57938] = 65950
       mem[51493] = 15020
       mem[3658] = 49142096
       mem[61554] = 1715
       mem[21280] = 62875
       mask = 001100X10X000010010010101110XX000010
       mem[13312] = 180240
       mem[18063] = 163048
       mem[61345] = 3681
       mem[19515] = 70772
       mask = 0011X01X0X000XX001101001001000001100
       mem[8507] = 831
       mem[30799] = 3945225
       mem[43021] = 38069025
       mem[8616] = 6336
       mem[42508] = 3881
       mem[45701] = 291464663
       mask = 11110XX10X000X100010X000000000X000X0
       mem[59117] = 1890
       mem[15170] = 9191049
       mem[25487] = 1912118
       mem[55290] = 37016118
       mem[59202] = 1014
       mem[59954] = 2563775
       mask = 000X0001X00100100100X010X110100X0011
       mem[4836] = 7617
       mem[47275] = 2228407
       mem[65165] = 1522
       mask = X01110110XX00110011000110000100011X0
       mem[7621] = 296673
       mem[17506] = 16935
       mem[63093] = 3615
       mem[11916] = 621
       mem[28656] = 680078
       mask = X1110011000001X0XX1001X00011X0XX1010
       mem[34586] = 30085
       mem[16813] = 2168
       mem[34601] = 35895
       mem[24803] = 5778196
       mem[35258] = 821331
       mem[14101] = 211836855
       mask = X01101110X00011X000X100101X1X110XXX0
       mem[33761] = 33198459
       mem[22161] = 321
       mem[51493] = 46379
       mem[1690] = 31082
       mem[56363] = 2140768
       mem[32820] = 2372
       mask = 100X001X00010110X1X0000X10101001111X
       mem[37121] = 41426
       mem[54579] = 1404300
       mem[30203] = 13421546
       mem[8416] = 97191816
       mem[11543] = 400
       mem[54537] = 3977
       mask = 1X11X0X10000010011X0011X1X1XX0111000
       mem[43930] = 2943829
       mem[55989] = 980
       mem[40086] = 3544935
       mem[15470] = 20240516
       mem[55262] = 2905
       mask = 001100110000X1100X10X01XX00X100100X1
       mem[31135] = 253828651
       mem[24090] = 678221
       mem[60327] = 97259969
       mem[55343] = 15817621
       mem[40424] = 5231731
       mem[46338] = 66393
       mask = 0X1111110X00X0XX0X111111101X1011100X
       mem[57938] = 168093095
       mem[65010] = 124
       mem[824] = 949416
       mem[33479] = 59626746
       mem[12404] = 255489211
       mem[48500] = 1887
       mask = 0010100X00110X1XX101X0X111X001001001
       mem[61047] = 1737698
       mem[51408] = 214082306
       mem[12504] = 12416442
       mask = 001X100100X1X1100X01X0111X1X1X0110X1
       mem[63754] = 33335770
       mem[18348] = 859493
       mem[58299] = 1250593
       mem[5451] = 921477
       mem[45756] = 2133
       mask = 0X1XX001X00000X00X001000X100X00010X1
       mem[1821] = 128635964
       mem[23027] = 875178
       mem[33673] = 649
       mem[26141] = 99067
       mask = 101101110XX10110X0100X00001001110X01
       mem[33831] = 618529
       mem[25128] = 991279383
       mask = 00X1100000101X10X1XX1101010XX1X00100
       mem[63253] = 268
       mem[52232] = 216465
       mem[42043] = 5905706
       mem[8751] = 132566
       mask = XX110011X000011001X001000X00X0001010
       mem[63384] = 1706
       mem[1762] = 161
       mem[59954] = 1850009
       mask = 00111X01X0001110X11010111X1111001XX0
       mem[54740] = 30662
       mem[2700] = 1281
       mem[21215] = 335
       mem[28127] = 13197
       mem[44108] = 4437085
       mem[11384] = 823
       mem[17046] = 8187086
       mask = 00X10010010001X001X0010110X110111000
       mem[40883] = 16674851
       mem[46228] = 2507
       mem[26744] = 1863
       mask = X00XX011000000100100000X0011X1100011
       mem[36388] = 3511
       mem[14194] = 12399516
       mem[23021] = 124697
       mask = 000110010001X1X001X100000X110X0X0000
       mem[48126] = 883934
       mem[33479] = 97083
       mem[33726] = 25752888
       mem[23103] = 6517
       mem[14640] = 2093310
       mask = 00110X1101X0X111000100XX000XX0010110
       mem[34550] = 61257
       mem[7986] = 1426
       mem[22379] = 13364
       mask = 0001001X0X00011001000100XX0X1110XXX0
       mem[22026] = 85877539
       mem[47661] = 14501
       mem[1342] = 1445
       mem[32088] = 3647786
       mask = 10010011000XX0100X100000X0001X011010
       mem[24227] = 10435012
       mem[58203] = 670756
       mem[21449] = 164149
       mask = X011010X0000X1000001001XX000X0001001
       mem[41589] = 24160
       mem[15421] = 273923
       mem[25992] = 3492
       mem[64180] = 466
       mem[5022] = 487154
       mem[37319] = 3415593
       mask = XX1X0001000001110100010X10X010110101
       mem[56949] = 5258979
       mem[11118] = 511
       mem[15407] = 68406
       mem[28684] = 1830666
       mem[40414] = 579757347
       mask = X01101X1000001X00X0100X1010X100X1X00
       mem[43416] = 11
       mem[26901] = 961
       mem[1243] = 157807197
       mem[36027] = 19575946
       mem[35438] = 2032
       mem[38761] = 785
       mask = 00110011X0000110000000X010X0010100X0
       mem[23936] = 131273
       mem[32250] = 103180884
       mem[24677] = 857528
       mem[63384] = 28869743
       mem[59102] = 16387091
       mem[3728] = 1554
       mask = 00111X110XX00110X1101101101010010010
       mem[33309] = 28221348
       mem[48561] = 2083820
       mem[46739] = 8163
       mem[33761] = 127116816
       mask = 011XX111X0X00110101X00X0X00010001XX0
       mem[12742] = 132493
       mem[43900] = 88228616
       mem[63861] = 1437
       mem[5451] = 720
       mem[35578] = 2817839
       mask = XXX1001XX10X0000001010100110X0X10111
       mem[58454] = 76647097
       mem[29150] = 944
       mask = X01X01110000011100000XXX000X11100100
       mem[60923] = 22109903
       mem[38868] = 106087
       mem[17765] = 119357
       mask = 0X0111X1X00X0010010110XX1X0101X1001X
       mem[62893] = 50
       mem[49594] = 5927931
       mem[13666] = 1327697
       mask = 1X01001000XX0110001011X001X1010X01X0
       mem[16472] = 13341
       mem[45283] = 3714606
       mem[6470] = 18908
       mask = X011011101X0011100X1X1000X10101011X1
       mem[14618] = 8208185
       mem[18071] = 443979262
       mem[37845] = 1669414
       mem[61643] = 645819046
       mem[16813] = 2459221
       mem[19338] = 2679
       mask = 0X11111X0X001X0X0X111X1110101100X00X
       mem[16170] = 28844
       mem[14304] = 619904
       mem[49274] = 357683641
       mem[16557] = 530
       mem[27360] = 1888
       mask = 00110011000001100XX00X0X0110X00X1XX0
       mem[17819] = 761
       mem[60100] = 35804
       mem[45183] = 27290500
       mem[6470] = 43199598
       mem[47790] = 267
       mem[27203] = 514
       mem[29139] = 233
       mask = X1X10111110X0X10101X11XX10001X0101X1
       mem[58246] = 671
       mem[62565] = 8080
       mem[61223] = 7938455
       mem[15182] = 14008978
       mem[7671] = 80450
       mem[2177] = 31228566
       mask = 00110X1X0100011X000100000100111010X1
       mem[37293] = 15109044
       mem[35385] = 6191200
       mask = 00011XX100010X10X101X0X0000101110XX0
       mem[4719] = 28188
       mem[15398] = 1042847981
       mem[3265] = 866517
       mask = 0X11X0110000011001101110X1100X11XX1X
       mem[23021] = 14305158
       mem[8507] = 975
       mem[3730] = 9185151
       mem[53044] = 10995
       mem[45498] = 90339105
       mem[48682] = 63450985
       mask = X0110011X0000110001001001X11110110X0
       mem[23188] = 49324288
       mem[63384] = 78110998
       mem[44309] = 96353816
       mem[56415] = 3693910
       mask = 0010100100111X100001011XX010X0010X00
       mem[58071] = 226920
       mem[15001] = 62196
       mem[19406] = 6446
       mem[48757] = 214
       mem[1588] = 4269459
       mask = 10110X11X00001100010011XX10011XXX001
       mem[45262] = 898066400
       mem[32757] = 128312164
       mem[51994] = 47881
       mem[47628] = 4260948
       mem[8616] = 26844
       mem[56654] = 6502607
       mask = 00010001000000100X0001XXX1XX010X1101
       mem[51090] = 71071
       mem[56791] = 999397616
       mem[32678] = 1006
       mem[61864] = 198837
       mem[22106] = 1085
       mem[40441] = 407881805
       mask = 0111X11100100X10X011X0X100010100X111
       mem[17898] = 65188
       mem[48736] = 9807
       mem[3265] = 77937
       mem[12945] = 12393
       mem[30805] = 5328372
       mem[33309] = 874
       mask = 01X1101100X00X10X00110111X0011111X10
       mem[28288] = 6469
       mem[46228] = 417227912
       mem[54160] = 14918153
       mem[25407] = 761
       mem[25075] = 154341
       mask = 00XX1001X001111001010X0X000100X1X000
       mem[54263] = 59757
       mem[56693] = 431013
       mem[4214] = 91351325
       mem[31232] = 43516
       mem[37563] = 30520
       mem[47761] = 11088
       mem[23142] = 41590584
       mask = 0111011X1XX00110X01X10X01000XXX00101
       mem[53694] = 109623913
       mem[18737] = 615
       mem[2947] = 1300365
       mem[34516] = 872678
       mem[55345] = 36487080
       mem[60504] = 8609
       mask = 10X10X11000X0X1X001X0X00001X0000X011
       mem[8123] = 61329
       mem[27793] = 505707
       mem[50807] = 20350526
       mem[671] = 7492988
       mem[24879] = 1834
       mask = 101100110X00011X0X001100X1101010X101
       mem[23372] = 490861
       mem[34213] = 18446
       mem[46919] = 12820036
       mem[1037] = 94
       mem[59289] = 5698817
       mem[9246] = 6369951
       mem[44175] = 1022
       mask = 00X1100X00X011100XX010X11X00X1001100
       mem[15244] = 150895487
       mem[4382] = 2034
       mem[23689] = 13824429
       mem[53832] = 66
       mem[60616] = 8670
       mask = 01110X010000010101000X0X01001111X101
       mem[61442] = 31208
       mem[24575] = 58731
       mem[3794] = 65157
       mem[47566] = 717369
       mask = 00110011000X01X00010010X0X1X1X011XX0
       mem[43732] = 558
       mem[54174] = 199024688
       mem[16067] = 21241
       mem[47566] = 35858
       mem[38280] = 58237
       mem[29588] = 68845
       mask = 01X11XX10000011010X10010000011X01010
       mem[12554] = 11888832
       mem[36307] = 3774
       mem[15027] = 3330
       mask = 0X111111100X0X1010X10001010000001001
       mem[4544] = 214688486
       mem[41589] = 551947
       mem[17831] = 7102892
       mem[6419] = 6209
       mem[51730] = 136655518
       mask = 01110XX10000011001XX11111X01X11100X0
       mem[18280] = 4784
       mem[52507] = 1422040
       mem[37826] = 32
       mem[56693] = 2071
       mask = 1001X0110000X1100X0X1XX0101X10101X00
       mem[6048] = 404771
       mem[29139] = 805240
       mem[43827] = 850198
       mask = 1011X01X01000000001X000000X01X111011
       mem[5784] = 5804365
       mem[24803] = 11278142
       mem[4069] = 599
       mem[46705] = 4208955
       mem[24156] = 8304
       mem[1037] = 491457387
       mem[58203] = 2637430
       mask = 0XX1X00100010110X10X00010011X1X10X01
       mem[63802] = 17278483
       mem[1435] = 40050
       mem[39638] = 84832833
       mem[59545] = 11052657
       mem[671] = 81865
       mask = X01100110000X110011001100XX011011000
       mem[23936] = 91965703
       mem[42570] = 9138
       mem[40640] = 198926
       mem[35396] = 130233
       mem[13312] = 1566
       mask = XX010111000X0110X01101001100001XXX11
       mem[45594] = 215458
       mem[19244] = 32591
       mem[24193] = 42172
       mem[49817] = 2028
       mask = 0011X01100X0011XX0X00111011001001010
       mem[27713] = 3933
       mem[31764] = 1123
       mem[27360] = 7350
       mem[17819] = 370397713
       mask = 00X1001XX10001X0010X0111001XX110X001
       mem[10544] = 8239404
       mem[26653] = 435
       mem[28032] = 7113
       mem[31135] = 440352137
       mem[18852] = 107163784
       mem[62121] = 75937434
       mask = X0X100X1000X0X100100000X01101XX01011
       mem[13423] = 135389
       mem[53044] = 5752
       mem[40299] = 71200
       mem[16067] = 8902343
       mem[63631] = 620503
       mem[5074] = 6398
       mask = XX1X001100X001100X101X1X11X00101111X
       mem[49782] = 116187
       mem[55567] = 18423
       mem[27243] = 94093
       mem[10700] = 1629004
       mem[27260] = 846554
       mask = 1XX10011000001X0010011X0110X10001X0X
       mem[37121] = 23863458
       mem[32680] = 93207
       mem[14763] = 743440178
       mem[17125] = 6145
       mem[35256] = 8386766
       mem[34491] = 500
       mask = 01110XX1000001XX0100X10X1010X111X000
       mem[23599] = 12706141
       mem[41736] = 142454
       mem[53248] = 32654570
       mem[49974] = 5849425
       mem[31261] = 235163561
       mem[58224] = 195171
       mask = 000100010X01011X110000X1X01XX1011111
       mem[1891] = 122340
       mem[7977] = 3547751
       mem[64715] = 5987
       mem[65347] = 142696506
       mask = 0X1100X10XX1011X01X00000111011101101
       mem[40640] = 364032486
       mem[26393] = 19961298
       mem[10444] = 29458337
       mem[7908] = 7672
       mem[39989] = 26162
       mask = 1XX1001X0000X110001001X001X1X0X1101X
       mem[30901] = 220690365
       mem[23027] = 223104229
       mem[30343] = 128442725
       mem[49886] = 27135842
       mem[34353] = 3523425
       mem[7277] = 711863
       mask = 1XX100100100000000X0101X01100X100111
       mem[50807] = 39698
       mem[44788] = 7177995
       mem[33750] = 114972
       mem[38868] = 170666
       mask = 1011001000001X1000X0X00000X1X1111011
       mem[59642] = 2340
       mem[64014] = 57896
       mem[50588] = 1014812
       mask = 0X100111X010011010X110100001111X1000
       mem[45498] = 1948666
       mem[15407] = 4448778
       mem[63541] = 799098
       mem[61798] = 8671931
       mem[5880] = 16223788
       mem[29467] = 235434
       mem[13444] = 50684587
       mask = 01X101X1000X0X100111110110010110X011
       mem[40727] = 112801751
       mem[41331] = 174
       mask = 011110110000X01000010010001X1000X0X0
       mem[28796] = 2129
       mem[671] = 406992
       mem[13709] = 920
       mem[35056] = 1781
       mem[39993] = 12612
       mask = 00X11111X0000X1X1000X111101110X11000
       mem[33221] = 354442
       mem[17428] = 491
       mem[51456] = 16477783""" |> parseDockingData


dockingDataTest : List ( String, String )
dockingDataTest =
    """mask = 000000000000000000000000000000X1001X
       mem[42] = 100
       mask = 00000000000000000000000000000000X0XX
       mem[26] = 1"""
        |> parseDockingData


parseDockingData =
    Regex.split splitLines
        >> List.filterMap
            (\str ->
                case String.split "=" str of
                    [ k, v ] ->
                        Just
                            ( String.trim k |> String.replace "mem[" "" |> String.replace "]" ""
                            , String.trim v
                            )

                    _ ->
                        Debug.todo "💥"
            )


busSchedulesTest =
    ( 939
    , "7,13,x,x,59,x,31,19"
    )


busSchedules =
    ( 1005162
    , "19,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,823,x,x,x,x,x,x,x,23,x,x,x,x,x,x,x,x,17,x,x,x,x,x,x,x,x,x,x,x,29,x,443,x,x,x,x,x,37,x,x,x,x,x,x,13"
    )


navTest =
    [ ( "F", 10 )
    , ( "N", 3 )
    , ( "F", 7 )
    , ( "R", 90 )
    , ( "F", 11 )
    ]


nav =
    [ ( "N", 2 )
    , ( "S", 5 )
    , ( "E", 2 )
    , ( "F", 35 )
    , ( "N", 2 )
    , ( "W", 5 )
    , ( "F", 83 )
    , ( "S", 5 )
    , ( "R", 180 )
    , ( "S", 3 )
    , ( "L", 270 )
    , ( "N", 1 )
    , ( "F", 35 )
    , ( "N", 1 )
    , ( "W", 4 )
    , ( "S", 3 )
    , ( "L", 180 )
    , ( "F", 46 )
    , ( "R", 180 )
    , ( "S", 4 )
    , ( "F", 29 )
    , ( "R", 90 )
    , ( "S", 3 )
    , ( "E", 1 )
    , ( "F", 65 )
    , ( "E", 4 )
    , ( "F", 29 )
    , ( "S", 4 )
    , ( "E", 5 )
    , ( "F", 33 )
    , ( "L", 90 )
    , ( "F", 28 )
    , ( "L", 270 )
    , ( "E", 3 )
    , ( "S", 5 )
    , ( "E", 2 )
    , ( "S", 5 )
    , ( "F", 82 )
    , ( "R", 270 )
    , ( "F", 81 )
    , ( "S", 3 )
    , ( "F", 68 )
    , ( "R", 180 )
    , ( "W", 5 )
    , ( "S", 3 )
    , ( "F", 70 )
    , ( "W", 4 )
    , ( "L", 180 )
    , ( "E", 2 )
    , ( "L", 90 )
    , ( "F", 28 )
    , ( "L", 270 )
    , ( "S", 4 )
    , ( "R", 90 )
    , ( "W", 2 )
    , ( "F", 39 )
    , ( "R", 90 )
    , ( "N", 5 )
    , ( "W", 5 )
    , ( "L", 180 )
    , ( "E", 3 )
    , ( "F", 66 )
    , ( "S", 5 )
    , ( "W", 3 )
    , ( "N", 5 )
    , ( "L", 90 )
    , ( "S", 2 )
    , ( "W", 4 )
    , ( "F", 77 )
    , ( "E", 1 )
    , ( "L", 90 )
    , ( "E", 3 )
    , ( "W", 1 )
    , ( "S", 3 )
    , ( "E", 4 )
    , ( "N", 4 )
    , ( "W", 5 )
    , ( "S", 1 )
    , ( "F", 55 )
    , ( "S", 3 )
    , ( "L", 90 )
    , ( "F", 20 )
    , ( "W", 2 )
    , ( "N", 2 )
    , ( "F", 23 )
    , ( "W", 2 )
    , ( "F", 48 )
    , ( "L", 90 )
    , ( "N", 1 )
    , ( "E", 3 )
    , ( "R", 90 )
    , ( "N", 4 )
    , ( "F", 73 )
    , ( "S", 4 )
    , ( "F", 7 )
    , ( "S", 1 )
    , ( "R", 90 )
    , ( "R", 90 )
    , ( "W", 3 )
    , ( "S", 3 )
    , ( "F", 71 )
    , ( "E", 5 )
    , ( "N", 1 )
    , ( "W", 1 )
    , ( "L", 90 )
    , ( "W", 3 )
    , ( "R", 180 )
    , ( "F", 60 )
    , ( "W", 2 )
    , ( "S", 5 )
    , ( "L", 90 )
    , ( "W", 2 )
    , ( "F", 6 )
    , ( "L", 180 )
    , ( "W", 4 )
    , ( "S", 2 )
    , ( "F", 28 )
    , ( "N", 4 )
    , ( "F", 56 )
    , ( "N", 4 )
    , ( "E", 4 )
    , ( "L", 90 )
    , ( "F", 67 )
    , ( "L", 90 )
    , ( "N", 1 )
    , ( "L", 90 )
    , ( "W", 3 )
    , ( "F", 43 )
    , ( "S", 2 )
    , ( "W", 4 )
    , ( "S", 1 )
    , ( "F", 67 )
    , ( "F", 72 )
    , ( "E", 2 )
    , ( "L", 90 )
    , ( "W", 2 )
    , ( "L", 180 )
    , ( "F", 35 )
    , ( "L", 90 )
    , ( "N", 2 )
    , ( "W", 1 )
    , ( "S", 5 )
    , ( "F", 58 )
    , ( "R", 180 )
    , ( "F", 68 )
    , ( "E", 2 )
    , ( "S", 5 )
    , ( "F", 61 )
    , ( "W", 4 )
    , ( "L", 180 )
    , ( "W", 2 )
    , ( "S", 2 )
    , ( "F", 35 )
    , ( "W", 4 )
    , ( "F", 50 )
    , ( "E", 3 )
    , ( "L", 90 )
    , ( "E", 3 )
    , ( "N", 5 )
    , ( "F", 16 )
    , ( "E", 2 )
    , ( "N", 4 )
    , ( "F", 87 )
    , ( "W", 4 )
    , ( "R", 180 )
    , ( "F", 25 )
    , ( "N", 3 )
    , ( "F", 6 )
    , ( "L", 90 )
    , ( "F", 57 )
    , ( "R", 180 )
    , ( "E", 2 )
    , ( "R", 90 )
    , ( "E", 1 )
    , ( "F", 99 )
    , ( "W", 1 )
    , ( "L", 90 )
    , ( "W", 4 )
    , ( "F", 76 )
    , ( "W", 2 )
    , ( "F", 48 )
    , ( "S", 1 )
    , ( "F", 19 )
    , ( "N", 1 )
    , ( "F", 54 )
    , ( "L", 90 )
    , ( "F", 66 )
    , ( "E", 4 )
    , ( "F", 88 )
    , ( "R", 90 )
    , ( "S", 5 )
    , ( "L", 180 )
    , ( "W", 2 )
    , ( "R", 90 )
    , ( "S", 2 )
    , ( "F", 54 )
    , ( "L", 90 )
    , ( "S", 2 )
    , ( "L", 180 )
    , ( "S", 4 )
    , ( "F", 14 )
    , ( "N", 2 )
    , ( "F", 51 )
    , ( "E", 3 )
    , ( "F", 83 )
    , ( "N", 2 )
    , ( "W", 1 )
    , ( "F", 61 )
    , ( "S", 1 )
    , ( "W", 3 )
    , ( "N", 2 )
    , ( "F", 15 )
    , ( "R", 180 )
    , ( "S", 3 )
    , ( "E", 3 )
    , ( "R", 90 )
    , ( "F", 50 )
    , ( "R", 90 )
    , ( "E", 5 )
    , ( "L", 90 )
    , ( "F", 53 )
    , ( "S", 3 )
    , ( "L", 90 )
    , ( "S", 5 )
    , ( "F", 22 )
    , ( "R", 90 )
    , ( "S", 5 )
    , ( "E", 3 )
    , ( "L", 90 )
    , ( "E", 4 )
    , ( "F", 88 )
    , ( "W", 1 )
    , ( "F", 10 )
    , ( "S", 2 )
    , ( "W", 4 )
    , ( "F", 68 )
    , ( "W", 3 )
    , ( "W", 2 )
    , ( "S", 3 )
    , ( "R", 90 )
    , ( "F", 1 )
    , ( "S", 1 )
    , ( "L", 270 )
    , ( "F", 51 )
    , ( "S", 2 )
    , ( "R", 90 )
    , ( "E", 3 )
    , ( "F", 6 )
    , ( "S", 1 )
    , ( "R", 90 )
    , ( "W", 2 )
    , ( "L", 180 )
    , ( "N", 1 )
    , ( "W", 5 )
    , ( "F", 51 )
    , ( "W", 1 )
    , ( "N", 1 )
    , ( "R", 90 )
    , ( "E", 1 )
    , ( "S", 3 )
    , ( "F", 21 )
    , ( "W", 3 )
    , ( "R", 180 )
    , ( "N", 1 )
    , ( "R", 180 )
    , ( "N", 1 )
    , ( "W", 4 )
    , ( "F", 21 )
    , ( "R", 180 )
    , ( "W", 3 )
    , ( "S", 5 )
    , ( "E", 3 )
    , ( "S", 5 )
    , ( "L", 180 )
    , ( "F", 3 )
    , ( "N", 4 )
    , ( "L", 90 )
    , ( "W", 5 )
    , ( "F", 23 )
    , ( "S", 3 )
    , ( "N", 5 )
    , ( "E", 1 )
    , ( "F", 88 )
    , ( "L", 90 )
    , ( "E", 4 )
    , ( "F", 18 )
    , ( "E", 3 )
    , ( "F", 27 )
    , ( "F", 51 )
    , ( "E", 3 )
    , ( "F", 58 )
    , ( "N", 5 )
    , ( "R", 180 )
    , ( "F", 36 )
    , ( "N", 4 )
    , ( "E", 2 )
    , ( "F", 14 )
    , ( "N", 4 )
    , ( "L", 180 )
    , ( "F", 87 )
    , ( "L", 180 )
    , ( "E", 3 )
    , ( "F", 67 )
    , ( "E", 4 )
    , ( "L", 90 )
    , ( "E", 2 )
    , ( "F", 62 )
    , ( "E", 3 )
    , ( "F", 60 )
    , ( "R", 90 )
    , ( "W", 2 )
    , ( "S", 1 )
    , ( "F", 47 )
    , ( "S", 5 )
    , ( "L", 90 )
    , ( "W", 2 )
    , ( "F", 11 )
    , ( "N", 2 )
    , ( "F", 29 )
    , ( "S", 2 )
    , ( "W", 1 )
    , ( "S", 1 )
    , ( "W", 1 )
    , ( "N", 2 )
    , ( "F", 73 )
    , ( "N", 3 )
    , ( "F", 92 )
    , ( "S", 2 )
    , ( "F", 1 )
    , ( "R", 180 )
    , ( "W", 4 )
    , ( "R", 90 )
    , ( "S", 5 )
    , ( "W", 4 )
    , ( "F", 33 )
    , ( "E", 2 )
    , ( "N", 2 )
    , ( "F", 40 )
    , ( "S", 1 )
    , ( "L", 180 )
    , ( "S", 2 )
    , ( "L", 90 )
    , ( "F", 95 )
    , ( "E", 2 )
    , ( "W", 2 )
    , ( "R", 180 )
    , ( "F", 26 )
    , ( "E", 1 )
    , ( "S", 3 )
    , ( "S", 1 )
    , ( "R", 90 )
    , ( "N", 4 )
    , ( "W", 4 )
    , ( "S", 5 )
    , ( "L", 90 )
    , ( "N", 1 )
    , ( "E", 5 )
    , ( "F", 9 )
    , ( "W", 5 )
    , ( "N", 1 )
    , ( "F", 89 )
    , ( "R", 180 )
    , ( "E", 5 )
    , ( "L", 90 )
    , ( "N", 2 )
    , ( "F", 90 )
    , ( "W", 4 )
    , ( "F", 33 )
    , ( "W", 2 )
    , ( "F", 62 )
    , ( "E", 1 )
    , ( "N", 4 )
    , ( "W", 4 )
    , ( "S", 5 )
    , ( "L", 90 )
    , ( "L", 90 )
    , ( "F", 81 )
    , ( "E", 3 )
    , ( "N", 5 )
    , ( "F", 81 )
    , ( "S", 1 )
    , ( "E", 3 )
    , ( "F", 89 )
    , ( "N", 3 )
    , ( "R", 90 )
    , ( "N", 3 )
    , ( "W", 3 )
    , ( "L", 90 )
    , ( "N", 2 )
    , ( "F", 93 )
    , ( "L", 90 )
    , ( "F", 48 )
    , ( "N", 5 )
    , ( "R", 180 )
    , ( "F", 66 )
    , ( "E", 5 )
    , ( "S", 1 )
    , ( "F", 47 )
    , ( "R", 180 )
    , ( "F", 61 )
    , ( "L", 90 )
    , ( "N", 2 )
    , ( "F", 74 )
    , ( "N", 1 )
    , ( "L", 180 )
    , ( "E", 2 )
    , ( "S", 5 )
    , ( "F", 39 )
    , ( "R", 180 )
    , ( "N", 5 )
    , ( "F", 26 )
    , ( "E", 5 )
    , ( "F", 12 )
    , ( "R", 90 )
    , ( "R", 90 )
    , ( "S", 4 )
    , ( "F", 7 )
    , ( "W", 5 )
    , ( "L", 90 )
    , ( "W", 1 )
    , ( "R", 90 )
    , ( "W", 2 )
    , ( "N", 2 )
    , ( "E", 2 )
    , ( "N", 1 )
    , ( "F", 15 )
    , ( "L", 90 )
    , ( "W", 4 )
    , ( "S", 2 )
    , ( "R", 90 )
    , ( "E", 3 )
    , ( "R", 180 )
    , ( "F", 86 )
    , ( "N", 5 )
    , ( "S", 5 )
    , ( "E", 2 )
    , ( "R", 90 )
    , ( "W", 1 )
    , ( "F", 64 )
    , ( "S", 2 )
    , ( "W", 3 )
    , ( "R", 180 )
    , ( "S", 4 )
    , ( "L", 180 )
    , ( "F", 58 )
    , ( "L", 90 )
    , ( "F", 100 )
    , ( "S", 2 )
    , ( "E", 4 )
    , ( "S", 2 )
    , ( "F", 52 )
    , ( "W", 2 )
    , ( "N", 4 )
    , ( "W", 4 )
    , ( "R", 90 )
    , ( "N", 2 )
    , ( "F", 45 )
    , ( "E", 5 )
    , ( "F", 84 )
    , ( "N", 3 )
    , ( "W", 2 )
    , ( "R", 90 )
    , ( "F", 36 )
    , ( "R", 90 )
    , ( "F", 85 )
    , ( "N", 5 )
    , ( "L", 90 )
    , ( "F", 6 )
    , ( "L", 90 )
    , ( "S", 4 )
    , ( "F", 21 )
    , ( "R", 90 )
    , ( "E", 5 )
    , ( "F", 9 )
    , ( "S", 4 )
    , ( "F", 53 )
    , ( "L", 90 )
    , ( "R", 90 )
    , ( "E", 1 )
    , ( "F", 55 )
    , ( "R", 90 )
    , ( "F", 56 )
    , ( "L", 90 )
    , ( "E", 4 )
    , ( "L", 90 )
    , ( "N", 1 )
    , ( "E", 1 )
    , ( "L", 90 )
    , ( "N", 1 )
    , ( "R", 90 )
    , ( "F", 51 )
    , ( "W", 1 )
    , ( "F", 39 )
    , ( "S", 5 )
    , ( "F", 96 )
    , ( "R", 90 )
    , ( "S", 1 )
    , ( "R", 180 )
    , ( "F", 72 )
    , ( "E", 1 )
    , ( "N", 4 )
    , ( "N", 3 )
    , ( "F", 77 )
    , ( "E", 3 )
    , ( "L", 90 )
    , ( "W", 4 )
    , ( "S", 3 )
    , ( "F", 53 )
    , ( "F", 92 )
    , ( "W", 5 )
    , ( "L", 90 )
    , ( "E", 4 )
    , ( "N", 2 )
    , ( "R", 180 )
    , ( "R", 90 )
    , ( "S", 3 )
    , ( "E", 2 )
    , ( "S", 3 )
    , ( "W", 1 )
    , ( "N", 1 )
    , ( "F", 86 )
    , ( "E", 3 )
    , ( "F", 46 )
    , ( "W", 1 )
    , ( "L", 90 )
    , ( "F", 97 )
    , ( "W", 3 )
    , ( "F", 45 )
    , ( "W", 4 )
    , ( "F", 73 )
    , ( "W", 2 )
    , ( "S", 2 )
    , ( "R", 90 )
    , ( "N", 2 )
    , ( "L", 180 )
    , ( "N", 4 )
    , ( "L", 90 )
    , ( "W", 1 )
    , ( "N", 2 )
    , ( "L", 90 )
    , ( "E", 1 )
    , ( "F", 93 )
    , ( "F", 36 )
    , ( "E", 2 )
    , ( "F", 74 )
    , ( "E", 3 )
    , ( "F", 49 )
    , ( "W", 5 )
    , ( "L", 180 )
    , ( "S", 3 )
    , ( "F", 5 )
    , ( "L", 180 )
    , ( "F", 53 )
    , ( "S", 2 )
    , ( "E", 3 )
    , ( "N", 1 )
    , ( "F", 96 )
    , ( "L", 90 )
    , ( "F", 44 )
    , ( "S", 3 )
    , ( "F", 32 )
    , ( "W", 1 )
    , ( "S", 2 )
    , ( "L", 90 )
    , ( "N", 2 )
    , ( "E", 3 )
    , ( "F", 17 )
    , ( "R", 90 )
    , ( "F", 34 )
    , ( "L", 90 )
    , ( "N", 4 )
    , ( "F", 22 )
    , ( "W", 2 )
    , ( "F", 58 )
    , ( "S", 2 )
    , ( "R", 90 )
    , ( "S", 2 )
    , ( "R", 90 )
    , ( "F", 12 )
    , ( "S", 5 )
    , ( "W", 5 )
    , ( "N", 5 )
    , ( "R", 90 )
    , ( "N", 3 )
    , ( "F", 12 )
    , ( "S", 4 )
    , ( "E", 1 )
    , ( "F", 86 )
    , ( "W", 3 )
    , ( "F", 6 )
    , ( "R", 90 )
    , ( "S", 5 )
    , ( "L", 90 )
    , ( "E", 4 )
    , ( "L", 180 )
    , ( "N", 2 )
    , ( "E", 4 )
    , ( "F", 50 )
    , ( "S", 5 )
    , ( "F", 85 )
    , ( "R", 90 )
    , ( "F", 13 )
    , ( "S", 1 )
    , ( "F", 69 )
    , ( "S", 2 )
    , ( "F", 97 )
    , ( "S", 1 )
    , ( "F", 66 )
    , ( "S", 4 )
    , ( "F", 86 )
    , ( "N", 5 )
    , ( "F", 34 )
    , ( "S", 2 )
    , ( "W", 5 )
    , ( "R", 180 )
    , ( "F", 42 )
    , ( "W", 4 )
    , ( "F", 72 )
    , ( "E", 3 )
    , ( "R", 270 )
    , ( "S", 3 )
    , ( "R", 90 )
    , ( "E", 2 )
    , ( "N", 4 )
    , ( "E", 5 )
    , ( "R", 90 )
    , ( "E", 2 )
    , ( "L", 180 )
    , ( "S", 2 )
    , ( "F", 35 )
    , ( "E", 4 )
    , ( "S", 2 )
    , ( "F", 50 )
    , ( "S", 1 )
    , ( "R", 90 )
    , ( "W", 3 )
    , ( "F", 100 )
    , ( "N", 3 )
    , ( "F", 10 )
    , ( "W", 4 )
    , ( "L", 90 )
    , ( "F", 19 )
    , ( "E", 2 )
    , ( "F", 10 )
    , ( "R", 90 )
    , ( "F", 27 )
    , ( "S", 4 )
    , ( "W", 3 )
    , ( "R", 90 )
    , ( "F", 53 )
    , ( "R", 90 )
    , ( "N", 3 )
    , ( "L", 90 )
    , ( "N", 5 )
    , ( "F", 46 )
    , ( "R", 90 )
    , ( "F", 3 )
    , ( "N", 1 )
    , ( "S", 4 )
    , ( "F", 17 )
    , ( "L", 270 )
    , ( "E", 2 )
    , ( "S", 2 )
    , ( "R", 90 )
    , ( "N", 4 )
    , ( "W", 4 )
    , ( "L", 180 )
    , ( "E", 3 )
    , ( "R", 90 )
    , ( "F", 86 )
    , ( "N", 5 )
    , ( "W", 1 )
    , ( "S", 4 )
    , ( "R", 90 )
    , ( "E", 4 )
    , ( "N", 4 )
    , ( "E", 5 )
    , ( "S", 4 )
    , ( "W", 1 )
    , ( "L", 90 )
    , ( "L", 180 )
    , ( "S", 1 )
    , ( "F", 42 )
    , ( "S", 2 )
    , ( "E", 2 )
    , ( "S", 5 )
    , ( "E", 1 )
    , ( "R", 90 )
    , ( "W", 1 )
    , ( "N", 4 )
    , ( "R", 90 )
    , ( "N", 3 )
    , ( "F", 58 )
    , ( "E", 3 )
    , ( "S", 1 )
    , ( "N", 5 )
    , ( "F", 65 )
    , ( "N", 5 )
    , ( "E", 4 )
    , ( "R", 180 )
    , ( "N", 5 )
    , ( "R", 90 )
    , ( "F", 90 )
    , ( "N", 3 )
    , ( "F", 1 )
    , ( "R", 180 )
    , ( "S", 2 )
    , ( "W", 3 )
    , ( "R", 90 )
    , ( "W", 1 )
    , ( "W", 2 )
    , ( "R", 180 )
    , ( "S", 1 )
    , ( "F", 93 )
    , ( "S", 2 )
    , ( "F", 35 )
    , ( "W", 2 )
    , ( "F", 62 )
    , ( "L", 90 )
    , ( "F", 15 )
    , ( "W", 3 )
    , ( "F", 79 )
    , ( "E", 5 )
    , ( "N", 4 )
    , ( "R", 180 )
    , ( "R", 90 )
    , ( "L", 90 )
    , ( "E", 2 )
    , ( "N", 2 )
    , ( "E", 5 )
    , ( "L", 270 )
    , ( "N", 3 )
    , ( "F", 31 )
    , ( "W", 3 )
    , ( "F", 39 )
    , ( "E", 5 )
    , ( "N", 3 )
    , ( "R", 90 )
    , ( "N", 2 )
    , ( "E", 3 )
    , ( "L", 90 )
    , ( "F", 50 )
    , ( "L", 90 )
    , ( "W", 5 )
    , ( "S", 3 )
    , ( "F", 68 )
    , ( "S", 3 )
    , ( "W", 3 )
    , ( "F", 20 )
    , ( "W", 3 )
    , ( "S", 2 )
    , ( "F", 7 )
    , ( "W", 1 )
    , ( "N", 1 )
    , ( "R", 90 )
    , ( "E", 2 )
    , ( "L", 180 )
    , ( "W", 4 )
    , ( "L", 90 )
    , ( "W", 4 )
    , ( "N", 5 )
    , ( "E", 5 )
    , ( "F", 19 )
    , ( "F", 11 )
    , ( "E", 2 )
    , ( "L", 90 )
    , ( "S", 3 )
    , ( "F", 30 )
    , ( "N", 2 )
    , ( "E", 5 )
    , ( "F", 51 )
    ]


seats =
    """LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLL..LLLLLLLL.LLLLLLLL.LLLLLLLL..LLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL..LLLLLL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLL.LLLL.LLLLLLLLLLLL.LLLLLLLLL.LLLL.LLL.LLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLL.LLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.L.LLLLLLLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       LLLLL.LLLL.LLLLLLLLL.LLLLL.LLLLLLLLLLLLLLL.LLL.LLLLLLLLLLLLL.LLL.LLLL.LLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LL.LLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLL.LLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL...LLLLLLLLLLL.
       LL..LL..L..L.L...L.L..L.L....L.LL..L.L......LL.LL....LL..LL..LLLL.L.LLL.L.....LLL.LL........L.....
       LLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLL.LLL..LL.LLLLLLL.LL.LLL.LLLL.LLLLLLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLL.LLLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLL.LLLLL.LL.LLLLLLL..LLLLLLLL.LL.LLLLLLLLLLLLLLLLLLLLL
       LLLLLLLLL..LLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL.LLLLLLLLL.LLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLL.L.LLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL
       ...........L.....L............LL..L...LL...L.LLL.L....L.L.L......L..L...LL......L.L.L.........LL..
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LL.LLLLLLLLLLLLLLLLL.LLLL.LLLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLL.L.LLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL..LLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
       ............L......L......L...L....L.....LLL....L.......L.....L.L..L....L..L.L....LL.....L....L.L.
       LLLLLLLLLL..LLLLLLLLLLLLLL.LLLL.LLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LL.LLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLL.LLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLL
       LLLL.LLLLL.LLLLLL.LLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLL.LLLLLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLLLLLLLLLLLLLLLL.L.LLLLL.LLLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       .LL........L.......L....LL.L..L.L...L.LLLLLL.L..............L.L.........LL........L....L.LL.....L.
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLL.L.LLLLLLL.LLLLL.LLLLLLLL.LLLLL.LL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LL.LLLLLL.LLL.LLLLLLLLLLLLLLLLLLLLL.LLLL.LLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLL.LLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLL.
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLL.
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLL.L.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       ...L..L..L.LL.L.L.L......L.LLLL.L..L.L..L..L.L...L.LL.L...L....LL..L.L..L.L...........L.L..L..LL..
       LLLLLL.LLL.LLLLLLLLL.LLLLLLLLL.L.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLL
       LLLLL.LLLL.LLL.LLLLL.LLLLL.LLLLLLLLLLLL.LLLLLL.L.LLLLLLLLLLLLLLL..LLLLLLL.LLLLLLLLL.LLLLLLLLLLLL.L
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLLLLLL.LLLLLLLLLLLLLL
       LLLL.LL.LLLLLLLLLLLL.LLLLL.L.LLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LL.LLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLL.LLLLL.LLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.L.LLL..LLL.LLL.LLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       ...LL.L..L..........L......L.L..L.LL.......LL...L.LL..L.L..L.L......L..L......L..L..L..L.L........
       LLLLLLL.LL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLL.LLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLL.L.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLL.LLL.LLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLL.LLL.LLL.L.LLLLLLLLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLL.LLLLLLLLLL
       LLLLLLL.LLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLLLLLL.L.LLLLLLLL.LLLLLLL.LLLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       L.....L..LL.L.......L.L..L....L..L.L...L.LLLL.......L.L...L....LL.L...L.L.L.LL.L......L.L.L.L.L...
       LLL.LLLLLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLL..L.LLLLLLLLLLLLLLLLLLLLL
       L.LLLLLLLL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL
       LLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLL..LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLLLLLLLLLLL.LLLLLLL..LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLL..LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL
       .......L..L..L.L....LLLLLL..L..LL.LLL..LL..L..L...L...LL.....L..LL.LL..L.L..L.L..L.L.L....LL....L.
       LLLLLLLLLLLLLLLL.LLL.LLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLL.LLLL.LLLLLLLLL.L.LLLLLLLLLLLL
       LLLLLLL.LL.LLLLLLLLLLLL.LL.LLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLL.LLLLL.LL.LLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLLLLL.LL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLL..LLLLLLLLL.LLLLLLLL.LLLLL
       .....L.L..L.......L.LL..........L...LLLL.LL..L...L.L.L.LLLL...L.....L...L.LLLLLL..L..........LL...
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL
       LLLLLLLLLL..LLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLL.L.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLL
       L.LLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLLL
       ..L.........L..L.L...L................LLL..L..LLL.L......L....L.L.....L.L.L.L.L..L.L.L.L....L....L
       LLLLLLLLLL..LLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LL.LLLLLL.LLLLLLLLLLLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLL.
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLL..LLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLL.L.LLLLLL.LLLLL
       LLLLL.LLLLLLLLLLLLLL.LLLLLLLLLLL.LLLLLLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLL.LLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLL
       LLLLLLLLLLLLLLLLLLL..LLLLL.LLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLL
       ...LLL.....L..L.LL.L.L.LL.....L..LL.LLLL...L.L....LL.L...L..LL...L..LLL......LL..L..L.L..L.L...LL.
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLL.LLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LL.LLLLLLL.LLLLLLLLL.LLLL.LLLLLLLL.LLLLLLLL.LL.LLLLL.LLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLL.LLLLLLLL.LLLLLLLLLL.LLLLLLLLLLLLLLL.LL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLLLLLLLLLLL.LLL.LLLL.LLLLLLLLL.LLLLLL.L.LLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLL..LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.L.LLLLLL.LLLLL
       LL.LLLLLL..LLLLLLLLL.LLLLL.LLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLL..LLL.LLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLLLLLLLLLL.LLLLL.LLLLLLLL..LLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLL.LLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLL
       ...L....L..L.L..L..L.LLLL....L..L.....L.....L.L..L.L.L...L.L.........L....L..L..L.LL.L...L.L...L..
       LLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL..LLLLL.LL.LLLLLLLLLLLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLL..LLLLL.LLLLLLLLLLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL..LL.LLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLLL.LLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLLLLLLLLLLL.LLLLLLLL.LL.LL
       LLLLLLLLLL.LLLLLLLLL.LLLLL.LLLLL.L.LLLLL.LLLLL.LLLLLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       LLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLLL.LLL.LLLLLLLLLL.LLLLLLL.LLLLL
       LLLLLLLLLL.LLLLLLLLLLLLLLLLLLLLL.LLLLLL..LLLLLLLLLLLLLL.LLLLLLLL.LLLLLLLL..LLLLLLLL.LLLLLLLL.LLLLL
       LLLLLL.L.L.LLLLLLLLLLLLLLLLLLLLL.LLLLLL.LLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLL.LLLLLLLLL.LLLLLLLL.LLLLL
       L.LLLLLLLLLLLLLLLLLLLLLLLL.LLLLL.LLLLLLL.LL.LLLLLLLLLLLLLLLLLLLLLLLLLLLLL.LLLLLLLLLLLLLL.LLL..LLLL"""
        |> splitSeats


seatsTest =
    """L.LL.LL.LL
               LLLLLLL.LL
               L.L.L..L..
               LLLL.LL.LL
               L.LL.LL.LL
               L.LLLLL.LL
               ..L.L.....
               LLLLLLLLLL
               L.LLLLLL.L
               L.LLLLL.LL"""
        |> splitSeats


splitSeats str =
    str
        |> Regex.split splitLines
        |> List.map (String.trim >> String.reverse >> (++) "x" >> String.reverse)
        |> (String.join "" >> String.split "")
        |> Array.fromList


splitLines =
    Regex.fromStringWith { caseInsensitive = True, multiline = True } "\\n"
        |> Maybe.withDefault Regex.never


adaptersTestSmol =
    List.sort <|
        [ 16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4 ]


adaptersTest : List number
adaptersTest =
    List.sort <|
        [ 28, 33, 18, 42, 31, 14, 46, 20, 48, 47, 24, 23, 49, 45, 19, 38, 39, 11, 1, 32, 25, 35, 8, 17, 7, 9, 4, 2, 34, 10, 3 ]


adaptersTestSum : number
adaptersTestSum =
    19208


adapters : List number
adapters =
    List.sort <|
        [ 48
        , 171
        , 156
        , 51
        , 26
        , 6
        , 80
        , 62
        , 65
        , 82
        , 130
        , 97
        , 49
        , 31
        , 142
        , 83
        , 75
        , 20
        , 154
        , 119
        , 56
        , 114
        , 92
        , 33
        , 140
        , 74
        , 118
        , 1
        , 96
        , 44
        , 128
        , 134
        , 121
        , 64
        , 158
        , 27
        , 17
        , 101
        , 59
        , 12
        , 89
        , 88
        , 145
        , 167
        , 11
        , 3
        , 39
        , 43
        , 105
        , 16
        , 170
        , 63
        , 111
        , 2
        , 108
        , 21
        , 146
        , 77
        , 45
        , 52
        , 32
        , 127
        , 147
        , 76
        , 58
        , 37
        , 86
        , 129
        , 57
        , 133
        , 120
        , 163
        , 138
        , 161
        , 139
        , 71
        , 9
        , 141
        , 168
        , 164
        , 124
        , 157
        , 95
        , 25
        , 38
        , 69
        , 87
        , 155
        , 135
        , 15
        , 102
        , 70
        , 34
        , 42
        , 24
        , 50
        , 68
        , 169
        , 10
        , 55
        , 117
        , 30
        , 81
        , 151
        , 100
        , 162
        , 148
        ]


xmas =
    [ 13
    , 47
    , 42
    , 30
    , 4
    , 32
    , 5
    , 45
    , 16
    , 27
    , 49
    , 41
    , 7
    , 46
    , 2
    , 28
    , 33
    , 34
    , 35
    , 24
    , 20
    , 19
    , 25
    , 14
    , 36
    , 43
    , 21
    , 23
    , 63
    , 38
    , 9
    , 71
    , 11
    , 57
    , 13
    , 15
    , 16
    , 17
    , 18
    , 22
    , 26
    , 60
    , 33
    , 27
    , 28
    , 42
    , 30
    , 20
    , 25
    , 74
    , 101
    , 24
    , 51
    , 29
    , 31
    , 36
    , 108
    , 37
    , 39
    , 32
    , 67
    , 47
    , 49
    , 38
    , 44
    , 45
    , 66
    , 48
    , 50
    , 52
    , 53
    , 98
    , 54
    , 55
    , 65
    , 56
    , 60
    , 61
    , 114
    , 63
    , 68
    , 69
    , 70
    , 100
    , 108
    , 87
    , 131
    , 118
    , 94
    , 102
    , 159
    , 101
    , 103
    , 110
    , 220
    , 116
    , 109
    , 111
    , 115
    , 121
    , 117
    , 123
    , 168
    , 132
    , 138
    , 137
    , 169
    , 189
    , 181
    , 196
    , 240
    , 195
    , 296
    , 197
    , 203
    , 204
    , 214
    , 218
    , 219
    , 227
    , 254
    , 320
    , 226
    , 298
    , 317
    , 255
    , 260
    , 333
    , 269
    , 275
    , 306
    , 517
    , 378
    , 376
    , 398
    , 392
    , 478
    , 400
    , 619
    , 407
    , 481
    , 724
    , 437
    , 711
    , 618
    , 750
    , 738
    , 486
    , 623
    , 515
    , 524
    , 529
    , 544
    , 888
    , 581
    , 682
    , 754
    , 813
    , 768
    , 790
    , 792
    , 807
    , 1044
    , 1109
    , 1145
    , 918
    , 923
    , 952
    , 1030
    , 1138
    , 1001
    , 1420
    , 1010
    , 1322
    , 1039
    , 1105
    , 1283
    , 1125
    , 1263
    , 2247
    , 1436
    , 1522
    , 1560
    , 1558
    , 1582
    , 1599
    , 1725
    , 1841
    , 2707
    , 1870
    , 2597
    , 1875
    , 1953
    , 2011
    , 2040
    , 2049
    , 2115
    , 2135
    , 2388
    , 2764
    , 2541
    , 3970
    , 5406
    , 2785
    , 3142
    , 2958
    , 3881
    , 3118
    , 3140
    , 4582
    , 3469
    , 4266
    , 3711
    , 3823
    , 3745
    , 3828
    , 3964
    , 4089
    , 4126
    , 4155
    , 4590
    , 6290
    , 4523
    , 5857
    , 7851
    , 5326
    , 5743
    , 12033
    , 7722
    , 6786
    , 6076
    , 7626
    , 6258
    , 6609
    , 7180
    , 7534
    , 8230
    , 7456
    , 7568
    , 7573
    , 7792
    , 12112
    , 8215
    , 8281
    , 8678
    , 9113
    , 9849
    , 13438
    , 11069
    , 20894
    , 11402
    , 11819
    , 15160
    , 14714
    , 31963
    , 12334
    , 13714
    , 12867
    , 21082
    , 14636
    , 15024
    , 15029
    , 15141
    , 15360
    , 15365
    , 20100
    , 16893
    , 46677
    , 16959
    , 17791
    , 18962
    , 29610
    , 22471
    , 22888
    , 23736
    , 26581
    , 24153
    , 27363
    , 27503
    , 25201
    , 28743
    , 27891
    , 27896
    , 29660
    , 29996
    , 44256
    , 30506
    , 39096
    , 30725
    , 32258
    , 33852
    , 57506
    , 49354
    , 45702
    , 36753
    , 52704
    , 45359
    , 68409
    , 46624
    , 47889
    , 50734
    , 53944
    , 52564
    , 58397
    , 53092
    , 76084
    , 55787
    , 57892
    , 102148
    , 61231
    , 110210
    , 64358
    , 62983
    , 64577
    , 82455
    , 70605
    , 89317
    , 99328
    , 83377
    , 93248
    , 91983
    , 107855
    , 138607
    , 94513
    , 118521
    , 109731
    , 105656
    , 191465
    , 117669
    , 108879
    , 140442
    , 113679
    , 128935
    , 169933
    , 124214
    , 127341
    , 127560
    , 133588
    , 147954
    , 162588
    , 204244
    , 248297
    , 175360
    , 210937
    , 293881
    , 275295
    , 200169
    , 203392
    , 213034
    , 214535
    , 272168
    , 375529
    , 506915
    , 264656
    , 222558
    , 426802
    , 237893
    , 251555
    , 290148
    , 590064
    , 302920
    , 261148
    , 281542
    , 310542
    , 337948
    , 817457
    , 378752
    , 386297
    , 510711
    , 403561
    , 618096
    , 435592
    , 416426
    , 427569
    , 517455
    , 693709
    , 460451
    , 474113
    , 483706
    , 489448
    , 991568
    , 499041
    , 512703
    , 1117137
    , 571690
    , 542690
    , 592084
    , 619490
    , 724245
    , 716700
    , 795178
    , 875745
    , 789858
    , 819987
    , 831130
    , 1140671
    , 843995
    , 876877
    , 1247556
    , 934564
    , 944157
    , 1994014
    , 973154
    , 1061138
    , 1785383
    , 1011744
    , 1041731
    , 1134774
    , 1191180
    , 1850031
    , 1162180
    , 1211574
    , 2827114
    , 1440945
    , 1511878
    , 1585036
    , 1763012
    , 1985888
    , 1651117
    , 1675125
    , 3671109
    , 1778559
    , 2146518
    , 3438137
    , 2096744
    , 2646652
    , 2053475
    , 2325954
    , 2072882
    , 2173924
    , 2925192
    , 2809899
    , 2346348
    , 2837305
    , 2990133
    , 2652519
    , 4461016
    , 2952823
    , 3025981
    , 3096914
    , 3236153
    , 3326242
    , 3429676
    , 3875303
    , 3453684
    , 5183653
    , 4320442
    , 4126357
    , 7556595
    , 4150219
    , 4398836
    , 4890780
    , 4246806
    , 5627608
    , 4520272
    , 4998867
    , 5156247
    , 5299171
    , 6526590
    , 7201545
    , 6755918
    , 6262134
    , 5978804
    , 8625413
    , 6333067
    , 6562395
    , 8766083
    , 6883360
    , 11706814
    , 9432488
    , 8276576
    , 8446799
    , 10129023
    , 8397025
    , 8549055
    , 8767078
    , 15152943
    , 12055089
    , 9519139
    , 13286355
    , 13318313
    , 12788724
    , 16315848
    , 14527859
    , 17965938
    , 16691418
    , 12240938
    , 12311871
    , 19983390
    , 14959420
    , 27464814
    , 15280385
    , 15159936
    , 16673601
    , 16723375
    , 16825631
    , 19648162
    , 32003760
    , 21831010
    , 18068194
    , 18286217
    , 21574228
    , 39631552
    , 22805494
    , 25100595
    , 29003289
    , 24552809
    , 57699746
    , 26768797
    , 28914539
    , 29035246
    , 27200358
    , 30440321
    , 43405238
    , 44074475
    , 44836991
    , 36371537
    , 35111848
    , 33499232
    , 34791569
    , 34893825
    , 47289506
    , 36354411
    , 73077764
    , 39642422
    , 56686076
    , 46127037
    , 47358303
    , 47906089
    , 49653404
    , 51321606
    , 65406783
    , 55804043
    , 68290801
    , 74433991
    , 63571895
    , 57640679
    , 66794732
    , 135085533
    , 68393057
    , 85769459
    , 69685394
    , 114076413
    , 69853643
    , 91579901
    , 82799914
    , 92158454
    , 93040487
    , 87000725
    , 87548511
    , 152407508
    , 104998982
    , 138603957
    , 99227695
    , 113225299
    , 157233905
    , 113444722
    , 119375938
    , 121212574
    , 182027609
    , 124435411
    , 135187789
    , 136480126
    , 186228420
    , 152485308
    , 179706965
    , 196578883
    , 152653557
    , 291227402
    , 169800639
    , 289133683
    , 240033819
    , 174549236
    , 186776206
    , 192547493
    , 356029059
    , 305138865
    , 212452994
    , 304142376
    , 234657296
    , 232820660
    , 243811349
    , 254563727
    , 366379522
    , 287841346
    , 259623200
    , 271667915
    , 523790979
    , 322285947
    , 322454196
    , 404457935
    , 344349875
    , 327202793
    , 356576845
    , 382253633
    , 361325442
    , 367096729
    , 441339933
    , 419596866
    , 489221023
    , 445273654
    , 478468645
    , 476632009
    , 467477956
    , 487384387
    , 801850499
    , 503434549
    , 945946601
    , 531291115
    , 610127293
    , 628244760
    , 593953862
    , 644740143
    , 649488740
    , 649656989
    , 743579075
    , 683779638
    , 843728738
    , 717902287
    , 786693595
    , 1121372152
    , 854481116
    , 860936799
    , 1126120749
    , 912751610
    , 921905663
    , 944109965
    , 1095722716
    , 1277733500
    , 1097388411
    , 1034725664
    , 1113561842
    , 1159535875
    , 1125244977
    , 1204081155
    , 1489181559
    , 1238694005
    , 1809900387
    , 2731806050
    , 1333436627
    , 1561631025
    , 3013981542
    , 1787838703
    , 1504595882
    , 1715417915
    , 1767232726
    , 1773688409
    , 1782842462
    , 1834657273
    , 2125986818
    , 2047150640
    , 1978835629
    , 3076224040
    , 1639024365
    , 2238806819
    , 2148287506
    , 2273097717
    , 2284780852
    , 2329326132
    , 4252675547
    , 2572130632
    , 4970612869
    , 2895067652
    , 3765011183
    , 3066226907
    , 3143620247
    , 3954224734
    , 3220013797
    , 6019908273
    , 7147743199
    , 4557878569
    , 3608345682
    , 5737067196
    , 3877831184
    , 3617859994
    , 3686175005
    , 6400963053
    , 3787311871
    , 5935599377
    , 6761480241
    , 5970955857
    , 11756975469
    , 4856911484
    , 4901456764
    , 5467198284
    , 6674572589
    , 5961294559
    , 7174238531
    , 6837873791
    , 6209847154
    , 6751965929
    , 11438154141
    , 6828359479
    , 13575201584
    , 12808829648
    , 7226205676
    , 7294520687
    , 7304034999
    , 7564006189
    , 7405171865
    , 10087138058
    , 8644223355
    , 14699692552
    , 20869722271
    , 11618391725
    , 16915497537
    , 9758368248
    , 15938744042
    , 14659825012
    , 11428492843
    , 12171141713
    , 19560795577
    , 12961813083
    , 13038206633
    , 13513882153
    , 14157137794
    , 14054565155
    , 19735147902
    , 14520726363
    , 14530240675
    , 14598555686
    , 14709206864
    , 14868041188
    , 14969178054
    , 19845506306
    , 24467575112
    , 21376759973
    , 21186861091
    , 26673865785
    , 22720181331
    , 21929509961
    , 22796574881
    , 23599634556
    , 24390305926
    , 35896067955
    , 25132954796
    , 26000019716
    , 26475695236
    , 29239447539
    , 28034608516
    , 28584805830
    , 28575291518
    , 29050967038
    , 55913313324
    , 41074250922
    , 29567733740
    , 29577248052
    , 29837219242
    , 34814684360
    , 41032367397
    , 42563621064
    , 49411368489
    , 43116371052
    , 46319815887
    , 68249325848
    , 53176882608
    , 51847541919
    , 47989940482
    , 50390325642
    , 54034628232
    , 51132974512
    , 52475714952
    , 54510303752
    , 96598249296
    , 56609900034
    , 57160097348
    , 59404952982
    , 95039336016
    , 81415275659
    , 59144981792
    , 88982201034
    , 59414467294
    , 64651903602
    , 75847051757
    , 93506696694
    , 111120203786
    , 89436186939
    , 91106311534
    , 109795278624
    , 101523300154
    , 107404407776
    , 156003202278
    , 98380266124
    , 126980026269
    , 103608689464
    , 105643278264
    , 156012716590
    , 115754881826
    , 113769997382
    , 116014853016
    , 175159834808
    , 118549934774
    , 165283238696
    , 118559449086
    , 123796885394
    , 160937767448
    , 140498955359
    , 154088090541
    , 184613008228
    , 187816453063
    , 180542498473
    , 196840594715
    , 219623542480
    , 204023544388
    , 271758084104
    , 216939715210
    , 201988955588
    , 209251967728
    , 304339383867
    , 303571334889
    , 219413275646
    , 404026283874
    , 229524879208
    , 242346820168
    , 291174687824
    , 237109383860
    , 242356334480
    , 294587045900
    , 345550775676
    , 425846174645
    , 349750923087
    , 328315408422
    , 334630589014
    , 365155506701
    , 389794466201
    , 377383093188
    , 513591351595
    , 498610590288
    , 718023865934
    , 680181364690
    , 680954428077
    , 411240923316
    , 471881213688
    , 461769610126
    , 448938154854
    , 456522659506
    , 466634263068
    , 471871699376
    , 812185038744
    , 863342274682
    , 479465718340
    , 587907110156
    , 1310795629032
    , 714906429788
    , 887615784771
    , 662945997436
    , 693470915123
    , 754949972902
    , 821678166207
    , 935988377846
    , 788624016504
    , 1356416912559
    , 909851513604
    , 867763582822
    , 860179078170
    , 920819368542
    , 918292269632
    , 1567135011646
    , 915572417922
    , 1731529679811
    , 923156922574
    , 938505962444
    , 1451570013940
    , 1342807993022
    , 1268089734844
    , 1067372828496
    , 2619145464582
    , 1377852427224
    , 1408377344911
    , 1417895970338
    , 2826273315249
    , 1841449192206
    , 1576628139109
    , 1656387599326
    , 2908822020702
    , 1648803094674
    , 1777615096426
    , 1727942660992
    , 1775751496092
    , 2475750173407
    , 2333468388260
    , 2374726936514
    , 1854078380366
    , 1861662885018
    , 1990529751070
    , 2005878790940
    , 2410180821518
    , 2335462563340
    , 2485268798834
    , 2645942162068
    , 2445225255720
    , 2786229772135
    , 2985005484020
    , 2994524109447
    , 3193647466430
    , 3354243235535
    , 4111214059432
    , 3582506930049
    , 3766281247162
    , 3733821451932
    , 3376745755666
    , 3503694157084
    , 4365256687584
    , 4979410550328
    , 4228805316880
    , 7354137486842
    , 3715741265384
    , 3844608131436
    , 5756810998232
    , 3996408542010
    , 4341341354280
    , 4745643384858
    , 4780687819060
    , 4930494054554
    , 6718826935952
    , 7845035511364
    , 5780753881582
    , 5979529593467
    , 6570393222096
    , 9483223750551
    , 8696775301716
    , 6880439912750
    , 6959252685715
    , 9344667237912
    , 7092487021050
    , 11109245229630
    , 8080997952968
    , 7560349396820
    , 9625362013018
    , 8073413448316
    , 18669594626450
    , 8461384650242
    , 7841016673446
    , 13529645907811
    , 8337749896290
    , 10911734576376
    , 9526331203918
    , 16891264169843
    , 10711247936136
    , 11760283475049
    , 15641347349788
    , 14800269359161
    , 15341824562992
    , 13450833134846
    , 13839692598465
    , 13972926933800
    , 14051739706765
    , 14519602082535
    , 14652836417870
    , 14933503694496
    , 15898099293110
    , 16534798098558
    , 22213185814690
    , 15914430121762
    , 16302401323688
    , 16178766569736
    , 16799134546532
    , 19048997832426
    , 24872547994848
    , 36732787897225
    , 22471531411185
    , 28571341789300
    , 24162081070982
    , 28792657697838
    , 25211116609895
    , 27290525733311
    , 27423760068646
    , 29753234458534
    , 27812619532265
    , 27891432305230
    , 44089660279843
    , 28704576124635
    , 29172438500405
    , 29586340112366
    , 30847933816258
    , 31812529414872
    , 32977901116268
    , 32093196691498
    , 39270665957717
    , 44222894615178
    , 35227764402162
    , 35848132378958
    , 41520529243611
    , 52057871523551
    , 88312554895021
    , 46633612482167
    , 49373197680877
    , 53102548915125
    , 52501642343206
    , 52634876678541
    , 121290456011289
    , 63040383934427
    , 55704051837495
    , 71363862649215
    , 56596008429865
    , 65071097807766
    , 74498430359879
    , 70118599773975
    , 60434273928624
    , 82481744861125
    ]


bootcode =
    [ ( "acc", -7 )
    , ( "acc", 2 )
    , ( "acc", 20 )
    , ( "acc", 14 )
    , ( "jmp", 191 )
    , ( "acc", 47 )
    , ( "nop", 339 )
    , ( "acc", 49 )
    , ( "jmp", 104 )
    , ( "jmp", 629 )
    , ( "jmp", 374 )
    , ( "acc", 24 )
    , ( "jmp", 220 )
    , ( "nop", 474 )
    , ( "acc", 25 )
    , ( "jmp", 340 )
    , ( "acc", 16 )
    , ( "acc", 3 )
    , ( "acc", 41 )
    , ( "jmp", 566 )
    , ( "jmp", 296 )
    , ( "acc", 15 )
    , ( "jmp", 452 )
    , ( "acc", 21 )
    , ( "jmp", 129 )
    , ( "acc", 10 )
    , ( "acc", -8 )
    , ( "acc", 39 )
    , ( "jmp", 396 )
    , ( "acc", 5 )
    , ( "acc", -4 )
    , ( "acc", 0 )
    , ( "jmp", 496 )
    , ( "nop", 181 )
    , ( "acc", 48 )
    , ( "acc", 7 )
    , ( "jmp", 1 )
    , ( "jmp", 370 )
    , ( "acc", 16 )
    , ( "acc", -18 )
    , ( "acc", 47 )
    , ( "acc", 48 )
    , ( "jmp", 99 )
    , ( "nop", 17 )
    , ( "acc", 25 )
    , ( "acc", -15 )
    , ( "jmp", 285 )
    , ( "nop", 545 )
    , ( "nop", 147 )
    , ( "nop", 479 )
    , ( "acc", -4 )
    , ( "jmp", 386 )
    , ( "acc", 36 )
    , ( "acc", -12 )
    , ( "jmp", 50 )
    , ( "acc", 37 )
    , ( "nop", 133 )
    , ( "acc", 11 )
    , ( "acc", 20 )
    , ( "jmp", 32 )
    , ( "jmp", 1 )
    , ( "nop", 210 )
    , ( "acc", -15 )
    , ( "acc", -6 )
    , ( "jmp", 446 )
    , ( "acc", 25 )
    , ( "acc", 1 )
    , ( "acc", 17 )
    , ( "acc", -4 )
    , ( "jmp", 355 )
    , ( "acc", -4 )
    , ( "jmp", 292 )
    , ( "acc", 16 )
    , ( "acc", 44 )
    , ( "acc", 26 )
    , ( "jmp", 157 )
    , ( "acc", -18 )
    , ( "acc", 15 )
    , ( "acc", -8 )
    , ( "acc", -3 )
    , ( "jmp", 46 )
    , ( "acc", 30 )
    , ( "acc", 16 )
    , ( "jmp", -7 )
    , ( "acc", 34 )
    , ( "jmp", 515 )
    , ( "acc", 11 )
    , ( "acc", -8 )
    , ( "acc", -9 )
    , ( "acc", -3 )
    , ( "jmp", 548 )
    , ( "jmp", 278 )
    , ( "nop", 332 )
    , ( "acc", -19 )
    , ( "acc", 49 )
    , ( "jmp", 536 )
    , ( "acc", -9 )
    , ( "acc", 46 )
    , ( "jmp", 124 )
    , ( "acc", 41 )
    , ( "acc", 47 )
    , ( "acc", -5 )
    , ( "acc", -13 )
    , ( "jmp", 41 )
    , ( "nop", 178 )
    , ( "acc", 12 )
    , ( "acc", 45 )
    , ( "jmp", 461 )
    , ( "acc", 37 )
    , ( "acc", 12 )
    , ( "acc", 38 )
    , ( "jmp", -68 )
    , ( "acc", -6 )
    , ( "nop", 494 )
    , ( "acc", -9 )
    , ( "jmp", -63 )
    , ( "acc", 42 )
    , ( "acc", 16 )
    , ( "acc", 30 )
    , ( "jmp", 70 )
    , ( "acc", 13 )
    , ( "jmp", 1 )
    , ( "acc", -18 )
    , ( "jmp", 528 )
    , ( "acc", 48 )
    , ( "jmp", 493 )
    , ( "nop", 402 )
    , ( "jmp", 381 )
    , ( "acc", -8 )
    , ( "jmp", 372 )
    , ( "acc", 20 )
    , ( "acc", 25 )
    , ( "jmp", 425 )
    , ( "acc", -10 )
    , ( "jmp", 510 )
    , ( "jmp", 439 )
    , ( "nop", 78 )
    , ( "acc", 36 )
    , ( "acc", 7 )
    , ( "nop", 281 )
    , ( "jmp", 504 )
    , ( "jmp", -108 )
    , ( "acc", 40 )
    , ( "jmp", -122 )
    , ( "acc", 23 )
    , ( "acc", -2 )
    , ( "acc", 7 )
    , ( "jmp", 370 )
    , ( "acc", 25 )
    , ( "nop", -5 )
    , ( "acc", 33 )
    , ( "acc", 37 )
    , ( "jmp", 70 )
    , ( "acc", -6 )
    , ( "nop", 336 )
    , ( "jmp", 34 )
    , ( "jmp", 1 )
    , ( "acc", -18 )
    , ( "jmp", 473 )
    , ( "jmp", 1 )
    , ( "acc", 20 )
    , ( "acc", 4 )
    , ( "acc", 25 )
    , ( "jmp", -87 )
    , ( "acc", -12 )
    , ( "acc", 47 )
    , ( "acc", 49 )
    , ( "jmp", 323 )
    , ( "jmp", 1 )
    , ( "jmp", 1 )
    , ( "jmp", 167 )
    , ( "acc", -10 )
    , ( "acc", 45 )
    , ( "jmp", 355 )
    , ( "acc", 32 )
    , ( "acc", 38 )
    , ( "acc", 2 )
    , ( "jmp", -93 )
    , ( "acc", 8 )
    , ( "acc", 20 )
    , ( "acc", 4 )
    , ( "acc", -1 )
    , ( "jmp", 108 )
    , ( "nop", 164 )
    , ( "acc", 41 )
    , ( "jmp", 440 )
    , ( "acc", -16 )
    , ( "acc", 47 )
    , ( "jmp", 355 )
    , ( "acc", -13 )
    , ( "acc", 29 )
    , ( "acc", 50 )
    , ( "jmp", -101 )
    , ( "acc", -8 )
    , ( "jmp", 316 )
    , ( "acc", 27 )
    , ( "acc", 31 )
    , ( "nop", -29 )
    , ( "jmp", 1 )
    , ( "jmp", 250 )
    , ( "acc", 12 )
    , ( "acc", -13 )
    , ( "jmp", 73 )
    , ( "jmp", 72 )
    , ( "acc", 36 )
    , ( "acc", 44 )
    , ( "jmp", 1 )
    , ( "jmp", -33 )
    , ( "acc", -18 )
    , ( "acc", 16 )
    , ( "acc", -8 )
    , ( "acc", 6 )
    , ( "jmp", 104 )
    , ( "jmp", 295 )
    , ( "acc", 10 )
    , ( "nop", -80 )
    , ( "jmp", 74 )
    , ( "acc", -13 )
    , ( "jmp", 1 )
    , ( "acc", 22 )
    , ( "acc", 50 )
    , ( "jmp", 280 )
    , ( "jmp", 265 )
    , ( "jmp", 278 )
    , ( "acc", 46 )
    , ( "acc", -14 )
    , ( "acc", -17 )
    , ( "jmp", -19 )
    , ( "acc", 39 )
    , ( "acc", 31 )
    , ( "acc", -11 )
    , ( "jmp", 400 )
    , ( "jmp", 80 )
    , ( "acc", 0 )
    , ( "acc", 27 )
    , ( "nop", 209 )
    , ( "jmp", -184 )
    , ( "acc", 12 )
    , ( "acc", 21 )
    , ( "acc", 23 )
    , ( "jmp", 352 )
    , ( "acc", 29 )
    , ( "jmp", -5 )
    , ( "acc", 15 )
    , ( "acc", 7 )
    , ( "jmp", 6 )
    , ( "acc", 31 )
    , ( "acc", -5 )
    , ( "nop", 83 )
    , ( "acc", 31 )
    , ( "jmp", -239 )
    , ( "acc", 8 )
    , ( "acc", -2 )
    , ( "acc", 49 )
    , ( "acc", -12 )
    , ( "jmp", -52 )
    , ( "acc", -15 )
    , ( "acc", -14 )
    , ( "jmp", 126 )
    , ( "jmp", 385 )
    , ( "acc", 30 )
    , ( "acc", -5 )
    , ( "acc", 6 )
    , ( "jmp", -187 )
    , ( "acc", 39 )
    , ( "acc", 40 )
    , ( "acc", 0 )
    , ( "acc", 6 )
    , ( "jmp", 24 )
    , ( "acc", 20 )
    , ( "jmp", 131 )
    , ( "jmp", -127 )
    , ( "acc", 8 )
    , ( "acc", 30 )
    , ( "jmp", -265 )
    , ( "acc", -2 )
    , ( "jmp", -265 )
    , ( "acc", 22 )
    , ( "acc", -19 )
    , ( "acc", -9 )
    , ( "nop", 10 )
    , ( "jmp", 148 )
    , ( "acc", -14 )
    , ( "acc", 38 )
    , ( "acc", 50 )
    , ( "acc", -7 )
    , ( "jmp", 197 )
    , ( "acc", 11 )
    , ( "acc", 22 )
    , ( "jmp", 201 )
    , ( "jmp", -155 )
    , ( "jmp", -32 )
    , ( "acc", 48 )
    , ( "nop", -50 )
    , ( "jmp", -99 )
    , ( "jmp", -5 )
    , ( "acc", 11 )
    , ( "acc", -18 )
    , ( "jmp", -186 )
    , ( "acc", 6 )
    , ( "acc", 43 )
    , ( "jmp", 159 )
    , ( "jmp", 249 )
    , ( "acc", 44 )
    , ( "acc", 29 )
    , ( "nop", 313 )
    , ( "acc", 23 )
    , ( "jmp", 311 )
    , ( "jmp", 152 )
    , ( "acc", 0 )
    , ( "acc", 41 )
    , ( "jmp", -251 )
    , ( "jmp", 102 )
    , ( "nop", -17 )
    , ( "nop", 176 )
    , ( "jmp", 40 )
    , ( "acc", 28 )
    , ( "jmp", -21 )
    , ( "acc", -4 )
    , ( "acc", -10 )
    , ( "acc", -19 )
    , ( "acc", -15 )
    , ( "jmp", 23 )
    , ( "nop", 144 )
    , ( "acc", 9 )
    , ( "acc", 18 )
    , ( "jmp", 141 )
    , ( "acc", -19 )
    , ( "acc", -10 )
    , ( "acc", 48 )
    , ( "jmp", -7 )
    , ( "acc", 46 )
    , ( "acc", -9 )
    , ( "jmp", -174 )
    , ( "acc", 30 )
    , ( "acc", 30 )
    , ( "jmp", -201 )
    , ( "acc", 34 )
    , ( "acc", 24 )
    , ( "acc", 37 )
    , ( "acc", 44 )
    , ( "jmp", -158 )
    , ( "acc", 4 )
    , ( "acc", 39 )
    , ( "jmp", -52 )
    , ( "jmp", -329 )
    , ( "jmp", 68 )
    , ( "acc", 25 )
    , ( "nop", -105 )
    , ( "acc", -15 )
    , ( "acc", 34 )
    , ( "jmp", -6 )
    , ( "jmp", 1 )
    , ( "acc", 1 )
    , ( "jmp", 163 )
    , ( "nop", -285 )
    , ( "acc", 8 )
    , ( "acc", 48 )
    , ( "jmp", 143 )
    , ( "acc", -3 )
    , ( "nop", -269 )
    , ( "acc", -16 )
    , ( "jmp", -310 )
    , ( "acc", -5 )
    , ( "jmp", -304 )
    , ( "acc", 45 )
    , ( "nop", -231 )
    , ( "jmp", 1 )
    , ( "jmp", 245 )
    , ( "nop", -243 )
    , ( "jmp", 187 )
    , ( "acc", -6 )
    , ( "acc", 7 )
    , ( "acc", 17 )
    , ( "acc", 6 )
    , ( "jmp", -111 )
    , ( "acc", 24 )
    , ( "acc", -10 )
    , ( "acc", 21 )
    , ( "jmp", -97 )
    , ( "jmp", 1 )
    , ( "acc", -12 )
    , ( "acc", 10 )
    , ( "jmp", 127 )
    , ( "acc", 0 )
    , ( "jmp", -211 )
    , ( "acc", -11 )
    , ( "acc", 36 )
    , ( "acc", 45 )
    , ( "acc", -19 )
    , ( "jmp", -182 )
    , ( "jmp", -366 )
    , ( "acc", 38 )
    , ( "acc", -11 )
    , ( "acc", 32 )
    , ( "jmp", -260 )
    , ( "acc", 6 )
    , ( "acc", 31 )
    , ( "jmp", 3 )
    , ( "acc", 5 )
    , ( "jmp", 101 )
    , ( "jmp", -64 )
    , ( "acc", 48 )
    , ( "acc", 5 )
    , ( "nop", 40 )
    , ( "acc", -13 )
    , ( "jmp", 95 )
    , ( "nop", 76 )
    , ( "acc", 44 )
    , ( "acc", 43 )
    , ( "acc", 43 )
    , ( "jmp", 196 )
    , ( "acc", 34 )
    , ( "jmp", 161 )
    , ( "acc", 5 )
    , ( "acc", 45 )
    , ( "acc", 7 )
    , ( "jmp", 20 )
    , ( "acc", 13 )
    , ( "jmp", -127 )
    , ( "acc", 5 )
    , ( "acc", 18 )
    , ( "jmp", -239 )
    , ( "jmp", -76 )
    , ( "nop", 214 )
    , ( "jmp", -284 )
    , ( "acc", 10 )
    , ( "acc", -8 )
    , ( "jmp", -81 )
    , ( "acc", 48 )
    , ( "acc", -3 )
    , ( "jmp", -55 )
    , ( "nop", -288 )
    , ( "acc", 37 )
    , ( "acc", 1 )
    , ( "acc", -12 )
    , ( "jmp", 1 )
    , ( "nop", 91 )
    , ( "acc", 20 )
    , ( "acc", 18 )
    , ( "jmp", 4 )
    , ( "acc", -7 )
    , ( "acc", -10 )
    , ( "jmp", -229 )
    , ( "nop", -230 )
    , ( "nop", 45 )
    , ( "acc", 37 )
    , ( "jmp", 127 )
    , ( "jmp", 69 )
    , ( "jmp", -153 )
    , ( "acc", -15 )
    , ( "acc", -19 )
    , ( "acc", 32 )
    , ( "jmp", -33 )
    , ( "nop", 164 )
    , ( "acc", 32 )
    , ( "jmp", -133 )
    , ( "acc", 20 )
    , ( "acc", -8 )
    , ( "jmp", 8 )
    , ( "acc", -11 )
    , ( "nop", 82 )
    , ( "acc", 7 )
    , ( "acc", 40 )
    , ( "jmp", 79 )
    , ( "acc", 0 )
    , ( "jmp", 159 )
    , ( "acc", 4 )
    , ( "acc", -8 )
    , ( "acc", 20 )
    , ( "nop", 143 )
    , ( "jmp", -351 )
    , ( "acc", -7 )
    , ( "jmp", 78 )
    , ( "acc", 0 )
    , ( "acc", 4 )
    , ( "jmp", 20 )
    , ( "jmp", -3 )
    , ( "acc", 2 )
    , ( "acc", 23 )
    , ( "jmp", -256 )
    , ( "acc", 33 )
    , ( "jmp", -473 )
    , ( "acc", 29 )
    , ( "acc", -13 )
    , ( "jmp", 77 )
    , ( "jmp", 158 )
    , ( "acc", -16 )
    , ( "jmp", -10 )
    , ( "jmp", -181 )
    , ( "jmp", -135 )
    , ( "nop", -95 )
    , ( "acc", 46 )
    , ( "acc", 39 )
    , ( "acc", -3 )
    , ( "jmp", -94 )
    , ( "jmp", -67 )
    , ( "acc", 49 )
    , ( "nop", -78 )
    , ( "nop", -9 )
    , ( "jmp", 107 )
    , ( "acc", -19 )
    , ( "acc", -1 )
    , ( "acc", 0 )
    , ( "acc", -4 )
    , ( "jmp", -189 )
    , ( "acc", 11 )
    , ( "jmp", -106 )
    , ( "jmp", -200 )
    , ( "jmp", 122 )
    , ( "acc", 8 )
    , ( "acc", 48 )
    , ( "acc", 15 )
    , ( "acc", 0 )
    , ( "jmp", -493 )
    , ( "acc", 13 )
    , ( "jmp", -8 )
    , ( "acc", 36 )
    , ( "acc", -10 )
    , ( "jmp", 1 )
    , ( "acc", 9 )
    , ( "jmp", 7 )
    , ( "jmp", 85 )
    , ( "acc", 22 )
    , ( "acc", -8 )
    , ( "nop", -124 )
    , ( "jmp", -517 )
    , ( "jmp", -338 )
    , ( "acc", 39 )
    , ( "nop", -438 )
    , ( "acc", -11 )
    , ( "jmp", 69 )
    , ( "acc", 8 )
    , ( "acc", 34 )
    , ( "acc", 34 )
    , ( "acc", -9 )
    , ( "jmp", -205 )
    , ( "nop", -528 )
    , ( "jmp", -495 )
    , ( "acc", 47 )
    , ( "acc", 40 )
    , ( "acc", 30 )
    , ( "jmp", -328 )
    , ( "acc", -2 )
    , ( "acc", 41 )
    , ( "jmp", -475 )
    , ( "acc", 42 )
    , ( "acc", 48 )
    , ( "acc", 2 )
    , ( "acc", 7 )
    , ( "jmp", -415 )
    , ( "nop", -249 )
    , ( "acc", -3 )
    , ( "jmp", 65 )
    , ( "acc", 23 )
    , ( "nop", -4 )
    , ( "jmp", -254 )
    , ( "acc", -12 )
    , ( "acc", 22 )
    , ( "acc", 27 )
    , ( "jmp", -176 )
    , ( "jmp", -408 )
    , ( "acc", -15 )
    , ( "acc", 14 )
    , ( "acc", 30 )
    , ( "acc", 0 )
    , ( "jmp", -363 )
    , ( "jmp", -426 )
    , ( "acc", 38 )
    , ( "nop", -425 )
    , ( "jmp", -440 )
    , ( "jmp", 1 )
    , ( "acc", 22 )
    , ( "jmp", -63 )
    , ( "jmp", -406 )
    , ( "nop", -445 )
    , ( "acc", -5 )
    , ( "acc", 34 )
    , ( "nop", -425 )
    , ( "jmp", 65 )
    , ( "acc", 33 )
    , ( "jmp", -91 )
    , ( "acc", -12 )
    , ( "jmp", 1 )
    , ( "jmp", -541 )
    , ( "nop", -489 )
    , ( "jmp", -490 )
    , ( "acc", 20 )
    , ( "acc", 20 )
    , ( "acc", 38 )
    , ( "acc", -18 )
    , ( "jmp", -548 )
    , ( "acc", 43 )
    , ( "acc", -7 )
    , ( "jmp", -351 )
    , ( "acc", -9 )
    , ( "acc", 50 )
    , ( "acc", 1 )
    , ( "nop", -587 )
    , ( "jmp", -230 )
    , ( "jmp", 1 )
    , ( "nop", 43 )
    , ( "jmp", -65 )
    , ( "acc", 31 )
    , ( "acc", 5 )
    , ( "acc", 1 )
    , ( "jmp", -105 )
    , ( "nop", -477 )
    , ( "acc", 21 )
    , ( "nop", -92 )
    , ( "jmp", -263 )
    , ( "acc", 28 )
    , ( "jmp", -265 )
    , ( "jmp", -311 )
    , ( "acc", 2 )
    , ( "acc", 23 )
    , ( "acc", 50 )
    , ( "jmp", -4 )
    , ( "acc", 42 )
    , ( "acc", 42 )
    , ( "acc", 31 )
    , ( "jmp", -167 )
    , ( "acc", 49 )
    , ( "acc", 46 )
    , ( "jmp", -73 )
    , ( "nop", -135 )
    , ( "acc", 43 )
    , ( "jmp", -236 )
    , ( "acc", -14 )
    , ( "acc", -3 )
    , ( "jmp", -406 )
    , ( "acc", 2 )
    , ( "acc", -3 )
    , ( "acc", 47 )
    , ( "jmp", -420 )
    , ( "acc", -8 )
    , ( "acc", 18 )
    , ( "jmp", -604 )
    , ( "jmp", -218 )
    , ( "acc", 37 )
    , ( "acc", -16 )
    , ( "nop", -278 )
    , ( "acc", -15 )
    , ( "jmp", -214 )
    , ( "acc", -6 )
    , ( "acc", 18 )
    , ( "acc", 7 )
    , ( "acc", 0 )
    , ( "jmp", -252 )
    , ( "acc", 14 )
    , ( "jmp", -266 )
    , ( "acc", 27 )
    , ( "acc", -16 )
    , ( "nop", -533 )
    , ( "nop", -534 )
    , ( "jmp", 1 )
    ]


bags =
    [ "dim silver bags contain 3 posh fuchsia bags."
    , "wavy olive bags contain 1 striped olive bag, 1 dull cyan bag."
    , "dull coral bags contain 1 dim olive bag, 5 muted violet bags, 2 dark gray bags."
    , "bright olive bags contain 3 light indigo bags, 3 dark coral bags."
    , "clear lavender bags contain 1 dark olive bag."
    , "dim lime bags contain 3 dotted red bags."
    , "drab indigo bags contain 5 striped coral bags, 2 muted bronze bags."
    , "striped orange bags contain 5 wavy fuchsia bags, 5 clear red bags, 3 plaid red bags."
    , "dotted indigo bags contain 2 plaid white bags, 1 wavy gold bag, 1 plaid silver bag."
    , "posh crimson bags contain 3 clear crimson bags, 5 dotted silver bags, 3 dull crimson bags, 5 wavy violet bags."
    , "mirrored tan bags contain 1 plaid white bag, 3 vibrant beige bags, 3 drab silver bags, 1 pale blue bag."
    , "dull turquoise bags contain 5 plaid magenta bags, 3 bright aqua bags, 1 dim purple bag, 1 wavy orange bag."
    , "dark tomato bags contain 1 plaid gray bag."
    , "shiny red bags contain 4 vibrant maroon bags, 5 faded bronze bags."
    , "clear tan bags contain 4 pale lime bags, 4 faded plum bags."
    , "mirrored plum bags contain 1 wavy silver bag, 4 dim purple bags, 3 dim coral bags."
    , "dotted orange bags contain 4 pale aqua bags, 3 dotted aqua bags, 4 clear beige bags."
    , "wavy lime bags contain 5 dim salmon bags, 4 dark violet bags, 4 clear turquoise bags."
    , "faded gray bags contain 2 dotted lime bags, 5 plaid tomato bags."
    , "pale orange bags contain 5 faded maroon bags."
    , "shiny lime bags contain 3 striped olive bags, 5 light fuchsia bags, 1 pale crimson bag, 1 pale salmon bag."
    , "drab red bags contain 5 muted chartreuse bags, 4 clear purple bags, 4 drab silver bags, 3 posh green bags."
    , "plaid plum bags contain 2 dim blue bags, 1 dim coral bag."
    , "clear red bags contain 3 plaid teal bags, 4 vibrant orange bags, 1 pale red bag."
    , "dark yellow bags contain 5 mirrored lavender bags, 5 dull bronze bags, 4 pale salmon bags, 5 wavy crimson bags."
    , "clear violet bags contain 5 clear turquoise bags, 3 clear beige bags, 4 dim plum bags."
    , "plaid cyan bags contain no other bags."
    , "light salmon bags contain 3 dull yellow bags, 2 vibrant violet bags, 2 dark orange bags, 1 light magenta bag."
    , "dim indigo bags contain 2 vibrant orange bags, 3 drab teal bags, 4 plaid indigo bags."
    , "shiny magenta bags contain 1 dark salmon bag, 4 shiny gray bags, 2 mirrored purple bags."
    , "drab coral bags contain 5 pale crimson bags, 1 mirrored aqua bag, 4 light red bags."
    , "muted blue bags contain 1 dark green bag, 5 muted salmon bags, 4 posh beige bags, 4 pale salmon bags."
    , "plaid salmon bags contain 5 striped white bags, 4 posh fuchsia bags, 5 faded turquoise bags."
    , "vibrant bronze bags contain 1 bright orange bag, 2 bright plum bags."
    , "dull salmon bags contain 2 pale crimson bags, 3 dark tan bags, 5 light plum bags."
    , "striped magenta bags contain 4 wavy yellow bags, 3 bright chartreuse bags, 5 plaid cyan bags."
    , "light olive bags contain 5 vibrant beige bags, 3 faded tomato bags, 1 dark indigo bag."
    , "faded turquoise bags contain 2 shiny salmon bags, 3 wavy crimson bags, 5 dim yellow bags, 1 posh salmon bag."
    , "pale fuchsia bags contain 2 posh blue bags, 4 mirrored blue bags, 3 wavy silver bags, 2 wavy crimson bags."
    , "dotted tomato bags contain 2 dotted lime bags, 1 wavy teal bag, 1 mirrored black bag, 3 dull gold bags."
    , "shiny maroon bags contain 5 striped salmon bags."
    , "vibrant gray bags contain 5 clear tan bags, 5 plaid crimson bags, 3 striped cyan bags, 1 dark gold bag."
    , "muted tomato bags contain 1 dull salmon bag."
    , "striped salmon bags contain 4 plaid white bags, 5 dim salmon bags, 4 vibrant lime bags."
    , "light tan bags contain 2 posh lavender bags, 5 shiny aqua bags."
    , "wavy brown bags contain 2 posh lavender bags."
    , "drab beige bags contain 5 plaid coral bags, 3 bright turquoise bags, 5 dark purple bags, 3 mirrored black bags."
    , "bright tomato bags contain 1 bright teal bag, 2 bright tan bags, 2 dotted salmon bags."
    , "dim tan bags contain 2 striped cyan bags, 5 wavy green bags, 3 drab beige bags."
    , "light plum bags contain 4 clear silver bags, 1 vibrant chartreuse bag."
    , "light black bags contain 1 muted tan bag, 2 dim yellow bags."
    , "clear orange bags contain 5 mirrored violet bags, 1 wavy salmon bag, 3 dim plum bags."
    , "bright gray bags contain 5 dim blue bags, 1 dotted red bag, 5 mirrored aqua bags."
    , "striped cyan bags contain 4 striped teal bags, 1 dark tan bag, 1 dim green bag."
    , "shiny olive bags contain 1 dark aqua bag, 2 muted lime bags."
    , "clear brown bags contain 5 dark salmon bags."
    , "dotted tan bags contain 2 plaid brown bags."
    , "light green bags contain 5 plaid silver bags, 5 posh aqua bags, 3 dull green bags, 5 faded red bags."
    , "posh coral bags contain 1 muted teal bag."
    , "drab green bags contain 1 dotted blue bag."
    , "dark fuchsia bags contain 2 wavy tomato bags, 3 faded plum bags."
    , "vibrant purple bags contain 3 posh tomato bags, 4 dim purple bags, 5 plaid brown bags, 4 dotted red bags."
    , "vibrant tomato bags contain 5 wavy orange bags, 1 striped teal bag."
    , "faded coral bags contain 5 dotted maroon bags, 2 light tan bags, 1 plaid black bag, 4 dark indigo bags."
    , "posh gold bags contain 4 mirrored plum bags."
    , "muted beige bags contain 2 pale brown bags, 4 dull black bags, 4 vibrant blue bags."
    , "dull green bags contain 3 drab silver bags, 5 dotted red bags, 3 mirrored violet bags, 3 bright black bags."
    , "dark lime bags contain 5 light chartreuse bags, 3 pale magenta bags, 1 dull indigo bag."
    , "dark orange bags contain 1 dark crimson bag, 2 clear turquoise bags, 2 dotted silver bags."
    , "muted yellow bags contain 2 pale salmon bags, 3 bright plum bags, 3 shiny aqua bags, 5 plaid cyan bags."
    , "vibrant white bags contain 5 dim coral bags, 5 dim bronze bags."
    , "posh white bags contain 2 wavy blue bags, 3 clear chartreuse bags, 1 wavy coral bag, 5 drab turquoise bags."
    , "faded violet bags contain 4 dim bronze bags."
    , "bright yellow bags contain 5 pale violet bags, 2 striped fuchsia bags."
    , "dim blue bags contain 2 posh salmon bags, 4 posh red bags, 5 clear turquoise bags, 4 muted lavender bags."
    , "plaid olive bags contain no other bags."
    , "posh plum bags contain 2 drab turquoise bags, 4 bright fuchsia bags, 4 drab indigo bags."
    , "posh violet bags contain 3 plaid olive bags, 2 posh teal bags, 1 posh purple bag."
    , "pale beige bags contain 4 wavy crimson bags, 5 shiny gold bags."
    , "shiny turquoise bags contain 5 dark gray bags, 4 clear brown bags."
    , "clear bronze bags contain 1 dull coral bag, 1 mirrored cyan bag, 2 dotted orange bags, 1 plaid magenta bag."
    , "dark magenta bags contain 3 vibrant orange bags, 1 dull lime bag, 1 dim plum bag."
    , "light silver bags contain 2 posh coral bags."
    , "drab gold bags contain 5 mirrored gold bags, 1 bright blue bag."
    , "dull fuchsia bags contain 3 pale blue bags."
    , "muted brown bags contain 4 drab fuchsia bags, 4 plaid bronze bags."
    , "bright coral bags contain 2 dull crimson bags."
    , "clear black bags contain 5 striped brown bags."
    , "mirrored coral bags contain 2 striped brown bags, 4 clear coral bags."
    , "dull purple bags contain 1 plaid green bag, 5 shiny gold bags."
    , "drab brown bags contain 4 striped coral bags, 1 muted magenta bag, 4 faded red bags."
    , "faded plum bags contain 5 shiny orange bags."
    , "vibrant violet bags contain 1 drab gold bag, 1 light violet bag."
    , "clear salmon bags contain 5 posh orange bags, 1 wavy fuchsia bag, 5 mirrored yellow bags."
    , "dull yellow bags contain 5 light orange bags, 4 striped purple bags."
    , "striped olive bags contain 1 plaid beige bag, 1 shiny turquoise bag, 2 drab gold bags, 1 pale lime bag."
    , "clear beige bags contain no other bags."
    , "mirrored fuchsia bags contain 1 clear olive bag, 3 pale aqua bags."
    , "posh turquoise bags contain 5 pale crimson bags, 3 dull cyan bags."
    , "dull lime bags contain 3 plaid chartreuse bags."
    , "wavy black bags contain 3 dull salmon bags, 5 plaid teal bags."
    , "dim lavender bags contain 1 dark gray bag, 2 muted indigo bags."
    , "wavy yellow bags contain 2 striped turquoise bags."
    , "striped gray bags contain 3 drab white bags."
    , "dotted magenta bags contain 3 plaid white bags, 4 clear beige bags, 1 faded maroon bag, 3 muted lavender bags."
    , "vibrant coral bags contain 5 shiny olive bags, 2 pale brown bags."
    , "dim aqua bags contain 5 striped crimson bags, 3 bright lavender bags."
    , "pale lavender bags contain 3 vibrant tan bags."
    , "bright fuchsia bags contain 2 dotted fuchsia bags."
    , "dark black bags contain 5 drab purple bags, 3 striped yellow bags, 2 posh tan bags."
    , "dark teal bags contain 3 plaid white bags, 5 bright cyan bags, 1 posh blue bag, 4 mirrored magenta bags."
    , "plaid brown bags contain 3 bright plum bags, 1 muted magenta bag, 4 clear gray bags, 2 clear crimson bags."
    , "mirrored magenta bags contain no other bags."
    , "light brown bags contain 4 wavy red bags, 2 faded white bags."
    , "dotted purple bags contain 2 pale lime bags."
    , "clear teal bags contain 3 plaid red bags, 3 striped coral bags, 4 mirrored black bags, 2 posh red bags."
    , "striped gold bags contain 3 bright plum bags, 2 mirrored gold bags."
    , "dotted black bags contain 2 clear crimson bags, 1 dark violet bag, 2 clear teal bags, 3 mirrored purple bags."
    , "dim gray bags contain 1 dotted salmon bag, 2 dim silver bags, 5 wavy black bags, 2 dotted green bags."
    , "shiny black bags contain 3 plaid bronze bags, 5 dim plum bags, 3 muted teal bags, 5 muted magenta bags."
    , "plaid orange bags contain 5 plaid crimson bags, 4 muted white bags, 4 dark lime bags, 5 plaid cyan bags."
    , "striped fuchsia bags contain 1 dull bronze bag, 1 wavy aqua bag, 1 plaid salmon bag, 2 faded cyan bags."
    , "wavy white bags contain 4 posh beige bags."
    , "dull teal bags contain 1 vibrant blue bag, 1 light red bag, 3 striped brown bags."
    , "vibrant chartreuse bags contain 1 shiny aqua bag, 4 clear crimson bags, 1 faded red bag, 1 dull crimson bag."
    , "wavy cyan bags contain 5 striped red bags, 1 shiny magenta bag."
    , "vibrant olive bags contain 3 light fuchsia bags, 5 pale tan bags, 5 light tomato bags."
    , "dotted fuchsia bags contain 5 clear silver bags, 5 light aqua bags, 5 posh beige bags."
    , "wavy tomato bags contain 2 wavy tan bags, 3 muted lavender bags, 2 pale salmon bags."
    , "posh lime bags contain 4 drab lime bags, 4 dull lavender bags."
    , "shiny white bags contain 1 plaid olive bag, 2 faded white bags, 2 dull salmon bags."
    , "bright plum bags contain 1 dotted salmon bag, 4 plaid red bags, 1 mirrored purple bag, 3 shiny aqua bags."
    , "dotted lavender bags contain 1 light green bag, 3 light magenta bags."
    , "bright gold bags contain 4 dim blue bags, 5 dark salmon bags, 2 posh crimson bags."
    , "striped violet bags contain 4 posh plum bags, 1 drab crimson bag, 2 faded orange bags, 3 dotted green bags."
    , "dull plum bags contain 1 dark maroon bag."
    , "striped tomato bags contain 5 striped maroon bags, 1 plaid turquoise bag."
    , "muted bronze bags contain 1 plaid red bag."
    , "dull lavender bags contain 2 plaid white bags."
    , "dark bronze bags contain 1 clear turquoise bag, 5 dim purple bags, 2 bright turquoise bags, 2 striped coral bags."
    , "muted green bags contain 3 plaid white bags, 5 pale blue bags, 3 plaid tan bags, 2 clear turquoise bags."
    , "mirrored bronze bags contain 2 faded white bags, 3 bright teal bags, 2 clear red bags, 2 clear crimson bags."
    , "clear silver bags contain 5 dim yellow bags, 2 striped brown bags, 1 muted magenta bag."
    , "dark indigo bags contain 3 faded maroon bags, 3 mirrored purple bags."
    , "posh silver bags contain 3 dotted maroon bags, 1 striped indigo bag, 1 faded red bag."
    , "light teal bags contain 1 vibrant beige bag, 1 striped plum bag, 4 dim salmon bags."
    , "dull orange bags contain 2 shiny teal bags, 5 muted teal bags, 1 dark fuchsia bag, 4 bright magenta bags."
    , "muted red bags contain 2 mirrored magenta bags."
    , "dotted gray bags contain 3 dull maroon bags, 4 mirrored blue bags, 3 mirrored red bags."
    , "light lime bags contain 5 plaid fuchsia bags, 4 posh plum bags."
    , "pale coral bags contain 3 shiny gray bags, 2 plaid beige bags."
    , "dim brown bags contain 1 faded gray bag."
    , "drab tan bags contain 5 dotted crimson bags."
    , "clear chartreuse bags contain 4 faded maroon bags, 5 plaid white bags."
    , "posh maroon bags contain 1 clear beige bag, 5 light black bags."
    , "mirrored blue bags contain 4 faded gray bags, 5 mirrored olive bags, 1 pale lime bag."
    , "clear coral bags contain 1 plaid fuchsia bag, 4 drab yellow bags, 4 light bronze bags."
    , "mirrored orange bags contain 4 mirrored lavender bags, 3 faded orange bags, 4 mirrored gold bags, 3 dim silver bags."
    , "pale bronze bags contain 4 plaid orange bags, 3 wavy chartreuse bags, 2 clear red bags."
    , "faded yellow bags contain 2 posh green bags."
    , "light magenta bags contain 3 clear silver bags, 3 pale magenta bags."
    , "clear aqua bags contain 2 dark tan bags."
    , "clear yellow bags contain 5 dim violet bags, 5 drab bronze bags."
    , "plaid yellow bags contain 4 dotted salmon bags."
    , "pale salmon bags contain 2 plaid olive bags, 5 clear beige bags."
    , "bright magenta bags contain 2 shiny maroon bags, 1 bright maroon bag, 5 shiny white bags."
    , "dull brown bags contain 4 posh fuchsia bags, 2 dotted tan bags."
    , "muted magenta bags contain no other bags."
    , "muted lavender bags contain 5 light aqua bags, 1 faded maroon bag, 4 plaid lavender bags."
    , "dotted violet bags contain 2 pale red bags, 3 mirrored magenta bags."
    , "wavy gray bags contain 5 dark indigo bags, 3 dim yellow bags, 3 posh lime bags, 1 wavy yellow bag."
    , "posh beige bags contain 4 mirrored magenta bags, 1 striped brown bag, 1 mirrored aqua bag, 5 dotted silver bags."
    , "drab crimson bags contain 2 faded coral bags, 4 light indigo bags, 4 dark indigo bags."
    , "wavy magenta bags contain 5 clear gold bags, 4 dim purple bags, 3 pale green bags."
    , "dim fuchsia bags contain 2 drab teal bags, 4 plaid brown bags, 5 faded orange bags."
    , "faded indigo bags contain 2 faded orange bags, 4 striped turquoise bags, 4 pale salmon bags, 4 bright cyan bags."
    , "posh yellow bags contain 2 pale gold bags, 3 posh coral bags, 1 dotted tan bag."
    , "muted chartreuse bags contain 5 plaid brown bags, 3 dull green bags."
    , "dotted plum bags contain 4 mirrored purple bags, 1 drab tan bag, 3 striped white bags."
    , "clear plum bags contain 3 posh green bags."
    , "striped red bags contain 1 striped tomato bag, 1 wavy fuchsia bag, 3 clear yellow bags."
    , "striped aqua bags contain 4 posh teal bags, 2 bright beige bags."
    , "dim gold bags contain 5 dull salmon bags, 3 mirrored red bags, 1 mirrored black bag."
    , "mirrored brown bags contain 1 mirrored salmon bag."
    , "wavy plum bags contain 3 shiny yellow bags, 5 light crimson bags, 5 dotted silver bags."
    , "striped coral bags contain no other bags."
    , "dark gray bags contain 4 dotted salmon bags, 2 clear brown bags, 2 posh crimson bags, 5 mirrored plum bags."
    , "posh chartreuse bags contain 2 wavy fuchsia bags, 4 mirrored beige bags."
    , "dotted gold bags contain 1 dark lavender bag, 1 striped black bag."
    , "posh green bags contain 3 dotted salmon bags, 4 pale salmon bags, 3 posh red bags, 4 dim green bags."
    , "plaid blue bags contain 2 posh green bags, 3 dim cyan bags, 5 dull bronze bags."
    , "light lavender bags contain 5 muted green bags, 1 light violet bag, 5 muted plum bags."
    , "pale plum bags contain 5 muted lavender bags, 5 light bronze bags, 4 plaid crimson bags."
    , "mirrored indigo bags contain 4 dark violet bags, 2 wavy purple bags, 5 plaid tan bags."
    , "dim violet bags contain 4 mirrored black bags, 4 dull lime bags, 3 posh crimson bags, 1 pale brown bag."
    , "shiny coral bags contain 1 light aqua bag, 5 plaid olive bags, 4 bright turquoise bags."
    , "dotted cyan bags contain 4 shiny olive bags, 4 light bronze bags, 2 dim plum bags."
    , "mirrored teal bags contain 5 dim violet bags."
    , "shiny purple bags contain 4 dim magenta bags, 2 clear white bags, 3 posh silver bags, 1 shiny turquoise bag."
    , "shiny gray bags contain 5 pale lavender bags, 3 vibrant turquoise bags, 1 faded maroon bag, 1 bright cyan bag."
    , "mirrored chartreuse bags contain 2 clear white bags."
    , "light beige bags contain 5 mirrored turquoise bags, 5 plaid maroon bags, 3 light silver bags."
    , "dull tomato bags contain 1 shiny gold bag, 4 pale blue bags."
    , "plaid teal bags contain 1 dim purple bag, 3 striped turquoise bags, 3 light indigo bags, 2 faded red bags."
    , "vibrant aqua bags contain 3 mirrored turquoise bags, 1 light plum bag, 5 clear teal bags, 1 dull blue bag."
    , "dotted turquoise bags contain 5 bright fuchsia bags, 5 dim blue bags, 3 posh green bags, 3 wavy red bags."
    , "dark lavender bags contain 1 mirrored lime bag, 2 plaid red bags, 2 striped white bags, 1 plaid tomato bag."
    , "plaid tan bags contain 5 plaid white bags."
    , "pale olive bags contain 1 clear salmon bag."
    , "wavy indigo bags contain 1 plaid black bag, 1 wavy teal bag, 3 mirrored salmon bags."
    , "drab chartreuse bags contain 2 light lime bags, 3 drab yellow bags."
    , "drab blue bags contain 3 vibrant brown bags."
    , "muted purple bags contain 2 shiny yellow bags."
    , "muted aqua bags contain 4 striped white bags."
    , "mirrored violet bags contain 3 wavy violet bags, 4 mirrored aqua bags."
    , "bright cyan bags contain 3 wavy fuchsia bags, 2 dark coral bags, 1 shiny orange bag."
    , "posh teal bags contain 5 bright gray bags, 4 faded gray bags, 2 plaid turquoise bags."
    , "muted lime bags contain 2 striped coral bags, 1 dark tan bag, 4 plaid cyan bags."
    , "mirrored crimson bags contain 4 faded violet bags, 1 posh purple bag."
    , "light blue bags contain 2 dotted blue bags, 2 dark gold bags, 5 bright cyan bags, 1 light crimson bag."
    , "dull beige bags contain 2 dark turquoise bags, 5 mirrored violet bags, 1 muted crimson bag."
    , "dark cyan bags contain 5 muted blue bags."
    , "dim turquoise bags contain 3 shiny silver bags, 1 pale yellow bag, 3 plaid chartreuse bags, 1 posh bronze bag."
    , "faded brown bags contain 3 dim silver bags, 2 mirrored bronze bags."
    , "wavy bronze bags contain 3 shiny tomato bags, 3 dim salmon bags."
    , "pale brown bags contain 3 pale tan bags, 2 plaid olive bags, 2 posh lavender bags, 1 shiny aqua bag."
    , "dull white bags contain 1 dull red bag, 5 dark gold bags, 3 striped magenta bags, 2 muted green bags."
    , "plaid crimson bags contain 5 drab bronze bags, 2 pale blue bags."
    , "bright lavender bags contain 1 dark bronze bag."
    , "plaid red bags contain 3 striped turquoise bags, 4 dull crimson bags, 1 striped brown bag, 2 clear crimson bags."
    , "muted gold bags contain 5 dotted black bags, 1 striped salmon bag, 3 drab purple bags, 5 bright red bags."
    , "striped silver bags contain 3 posh black bags."
    , "bright aqua bags contain 4 light orange bags, 3 wavy blue bags, 3 dull lime bags."
    , "plaid fuchsia bags contain 2 shiny orange bags."
    , "bright violet bags contain 1 drab turquoise bag, 1 dim cyan bag, 4 pale blue bags, 3 wavy blue bags."
    , "dim white bags contain 1 plaid black bag, 5 plaid violet bags, 2 light gray bags."
    , "bright tan bags contain 5 bright gold bags, 3 shiny salmon bags, 2 muted magenta bags, 1 dotted black bag."
    , "shiny bronze bags contain 3 light aqua bags, 4 clear crimson bags, 1 light beige bag, 4 clear blue bags."
    , "muted silver bags contain 4 striped lavender bags."
    , "dull red bags contain 1 dim coral bag, 1 faded plum bag, 4 plaid red bags."
    , "wavy aqua bags contain 2 dotted fuchsia bags, 2 mirrored tomato bags."
    , "dark olive bags contain 4 muted yellow bags, 2 shiny gold bags, 2 posh crimson bags."
    , "dark crimson bags contain 3 shiny aqua bags, 1 wavy black bag."
    , "dark brown bags contain 2 drab lavender bags, 5 posh green bags, 4 pale turquoise bags."
    , "pale blue bags contain 2 striped coral bags, 2 shiny gold bags."
    , "vibrant blue bags contain 1 mirrored lavender bag, 4 dark aqua bags, 5 wavy coral bags."
    , "posh cyan bags contain 1 dull lavender bag, 3 striped gray bags, 1 vibrant orange bag."
    , "faded red bags contain 1 posh crimson bag, 1 wavy coral bag, 5 clear beige bags, 3 dotted silver bags."
    , "vibrant gold bags contain 3 drab lavender bags, 5 dim magenta bags, 2 bright tomato bags, 4 light magenta bags."
    , "shiny chartreuse bags contain 5 vibrant turquoise bags."
    , "clear gray bags contain 4 wavy coral bags, 2 dark salmon bags, 3 dark indigo bags."
    , "pale maroon bags contain 4 posh tomato bags, 5 bright tan bags."
    , "light turquoise bags contain 3 drab fuchsia bags, 4 bright silver bags, 5 light green bags."
    , "muted crimson bags contain 1 dim yellow bag, 4 wavy fuchsia bags, 2 mirrored magenta bags, 2 clear beige bags."
    , "dull gray bags contain 2 posh green bags."
    , "light fuchsia bags contain 5 dark gold bags, 3 plaid black bags, 2 bright lavender bags."
    , "striped green bags contain 2 striped fuchsia bags, 5 dull tomato bags, 2 posh crimson bags."
    , "mirrored purple bags contain 2 posh crimson bags, 2 mirrored magenta bags, 3 wavy violet bags, 1 striped coral bag."
    , "vibrant black bags contain 3 clear magenta bags, 4 muted salmon bags, 5 posh blue bags."
    , "plaid beige bags contain 2 dark black bags, 5 plaid yellow bags, 2 bright violet bags."
    , "pale teal bags contain 3 pale crimson bags."
    , "striped turquoise bags contain no other bags."
    , "dim purple bags contain 2 dull crimson bags, 5 bright red bags."
    , "faded cyan bags contain 5 posh aqua bags, 4 dull green bags, 3 dark olive bags."
    , "mirrored cyan bags contain 5 plaid salmon bags, 4 dim salmon bags, 4 posh tomato bags."
    , "striped purple bags contain 2 faded salmon bags, 2 bright tan bags, 4 drab white bags."
    , "bright blue bags contain 3 light purple bags, 1 pale yellow bag."
    , "faded bronze bags contain 1 light indigo bag, 3 plaid green bags, 5 posh orange bags."
    , "striped white bags contain 4 drab indigo bags, 5 wavy tomato bags, 5 dotted fuchsia bags, 2 dim silver bags."
    , "clear lime bags contain 2 dotted magenta bags, 5 striped magenta bags, 3 bright coral bags, 3 mirrored silver bags."
    , "bright white bags contain 3 dim lavender bags."
    , "dim crimson bags contain 1 posh black bag, 1 mirrored silver bag."
    , "clear olive bags contain 4 vibrant purple bags, 3 drab lavender bags, 2 pale violet bags."
    , "light coral bags contain 2 dotted green bags, 2 wavy aqua bags, 4 dark salmon bags, 3 light gold bags."
    , "muted plum bags contain 5 plaid tan bags, 1 mirrored silver bag, 3 vibrant turquoise bags."
    , "dim plum bags contain 4 bright plum bags."
    , "drab bronze bags contain 1 light indigo bag, 3 striped brown bags, 3 clear gold bags, 3 clear gray bags."
    , "plaid maroon bags contain 1 dotted orange bag, 5 light magenta bags, 4 faded salmon bags, 3 pale yellow bags."
    , "wavy violet bags contain 2 dotted silver bags, 3 dull crimson bags, 5 mirrored aqua bags, 4 striped brown bags."
    , "pale crimson bags contain 3 bright chartreuse bags, 4 light turquoise bags, 1 bright gray bag, 1 muted bronze bag."
    , "mirrored aqua bags contain no other bags."
    , "clear crimson bags contain 2 pale salmon bags, 4 mirrored magenta bags, 1 striped coral bag, 5 plaid olive bags."
    , "dark tan bags contain 4 wavy silver bags, 4 dark aqua bags."
    , "wavy maroon bags contain 3 clear gray bags."
    , "light crimson bags contain 3 clear silver bags."
    , "vibrant green bags contain 1 clear magenta bag, 1 dim white bag, 4 plaid black bags."
    , "bright bronze bags contain 2 light brown bags."
    , "light maroon bags contain 5 bright red bags, 2 bright tan bags, 5 dim silver bags, 4 pale salmon bags."
    , "dark coral bags contain 2 light crimson bags."
    , "pale silver bags contain 2 mirrored magenta bags, 3 posh red bags, 1 muted yellow bag, 5 dark salmon bags."
    , "dotted crimson bags contain 4 faded salmon bags, 4 vibrant beige bags, 5 dim beige bags."
    , "dull silver bags contain 1 striped brown bag, 2 shiny magenta bags."
    , "striped beige bags contain 4 clear crimson bags."
    , "faded orange bags contain 2 drab white bags, 3 striped salmon bags, 5 bright chartreuse bags."
    , "drab olive bags contain 4 clear purple bags."
    , "dull maroon bags contain 3 dotted magenta bags."
    , "vibrant lavender bags contain 2 light tomato bags, 1 shiny teal bag."
    , "dotted chartreuse bags contain 4 faded white bags, 2 light brown bags."
    , "drab cyan bags contain 2 pale coral bags, 3 light purple bags, 2 drab bronze bags, 1 dim beige bag."
    , "bright teal bags contain 2 vibrant plum bags, 2 dull tan bags, 1 dim tomato bag, 5 dark violet bags."
    , "wavy fuchsia bags contain 1 dim green bag, 2 wavy violet bags."
    , "drab black bags contain 3 striped tomato bags, 4 light salmon bags, 4 dim yellow bags, 3 shiny black bags."
    , "dark green bags contain 5 dark tan bags."
    , "clear tomato bags contain 4 mirrored gold bags, 4 dark gold bags."
    , "plaid aqua bags contain 5 dotted coral bags, 1 muted white bag."
    , "plaid white bags contain 3 clear crimson bags, 3 wavy gold bags, 3 pale lime bags, 2 striped brown bags."
    , "muted black bags contain 1 wavy tan bag, 4 mirrored turquoise bags."
    , "faded aqua bags contain 5 dull turquoise bags, 1 vibrant tan bag."
    , "vibrant brown bags contain 5 pale silver bags, 3 drab orange bags, 1 clear olive bag."
    , "pale cyan bags contain 2 faded cyan bags, 1 mirrored tan bag, 3 vibrant aqua bags, 3 light gold bags."
    , "shiny salmon bags contain 5 posh red bags, 5 light chartreuse bags, 2 striped brown bags."
    , "plaid lime bags contain 4 dim gold bags, 1 clear magenta bag."
    , "drab tomato bags contain 5 clear orange bags."
    , "faded beige bags contain 3 dark crimson bags, 2 mirrored tan bags."
    , "vibrant crimson bags contain 4 wavy blue bags, 5 clear gray bags."
    , "dotted maroon bags contain 5 dotted red bags, 4 wavy silver bags, 1 drab brown bag, 3 dark black bags."
    , "striped indigo bags contain 3 striped orange bags."
    , "dim orange bags contain 1 wavy lavender bag, 5 drab brown bags, 1 dull salmon bag."
    , "posh olive bags contain 3 faded indigo bags, 1 plaid white bag."
    , "striped lavender bags contain 1 bright red bag."
    , "muted violet bags contain 3 bright tan bags, 5 striped coral bags, 1 drab bronze bag."
    , "wavy tan bags contain 1 striped brown bag, 3 dim salmon bags, 1 posh fuchsia bag, 4 mirrored violet bags."
    , "dull magenta bags contain 1 clear red bag, 4 dull green bags, 2 posh lime bags, 5 mirrored gold bags."
    , "dotted red bags contain 1 mirrored black bag, 3 dull bronze bags, 2 dim salmon bags."
    , "drab turquoise bags contain 5 muted yellow bags, 1 light indigo bag, 5 dotted black bags."
    , "faded purple bags contain 5 dim orange bags, 3 dark red bags."
    , "faded teal bags contain 1 bright fuchsia bag."
    , "plaid gray bags contain 5 pale aqua bags."
    , "bright black bags contain 4 wavy violet bags."
    , "dim green bags contain 3 mirrored aqua bags, 1 light chartreuse bag, 1 light indigo bag."
    , "dark gold bags contain 2 mirrored red bags, 2 bright lavender bags, 3 pale crimson bags."
    , "dark plum bags contain 2 pale salmon bags."
    , "wavy orange bags contain 2 light tan bags, 1 pale yellow bag, 2 shiny aqua bags, 4 vibrant orange bags."
    , "bright chartreuse bags contain 5 dark salmon bags, 1 plaid olive bag."
    , "wavy purple bags contain 4 faded coral bags, 2 vibrant orange bags."
    , "shiny violet bags contain 3 plaid chartreuse bags, 2 plaid brown bags."
    , "posh indigo bags contain 1 posh salmon bag."
    , "clear indigo bags contain 3 light violet bags."
    , "plaid purple bags contain 1 clear blue bag, 2 muted gold bags, 1 dull brown bag."
    , "posh lavender bags contain 1 plaid black bag, 3 shiny orange bags, 3 posh red bags, 4 plaid cyan bags."
    , "wavy silver bags contain 3 plaid cyan bags, 1 plaid olive bag."
    , "posh salmon bags contain 3 clear gray bags, 5 dotted silver bags, 4 shiny aqua bags."
    , "faded lavender bags contain 4 drab chartreuse bags, 4 plaid magenta bags, 1 vibrant tomato bag."
    , "pale red bags contain 4 bright red bags, 4 pale lime bags, 3 striped turquoise bags."
    , "bright purple bags contain 3 muted lavender bags."
    , "dim magenta bags contain 1 plaid teal bag, 3 posh lavender bags."
    , "posh magenta bags contain 3 pale teal bags, 5 mirrored tomato bags, 2 striped gold bags, 2 bright tomato bags."
    , "bright brown bags contain 1 dark fuchsia bag, 4 pale yellow bags, 5 shiny crimson bags."
    , "light red bags contain 1 wavy teal bag."
    , "pale turquoise bags contain 3 mirrored yellow bags."
    , "vibrant magenta bags contain 4 dark gold bags."
    , "dotted salmon bags contain 3 wavy violet bags, 4 shiny aqua bags, 4 dull bronze bags."
    , "mirrored gray bags contain 3 dark plum bags, 3 striped gray bags, 4 plaid violet bags."
    , "dim yellow bags contain 3 striped turquoise bags, 2 pale salmon bags, 4 mirrored magenta bags, 5 striped brown bags."
    , "drab lavender bags contain 2 faded maroon bags, 2 shiny orange bags."
    , "muted maroon bags contain 1 wavy tomato bag, 2 drab red bags."
    , "clear gold bags contain 3 mirrored olive bags, 3 striped turquoise bags."
    , "light bronze bags contain 1 muted lavender bag."
    , "dotted bronze bags contain 2 dotted turquoise bags."
    , "pale tomato bags contain 3 shiny beige bags, 1 mirrored tomato bag, 2 dotted maroon bags, 2 wavy teal bags."
    , "pale chartreuse bags contain 5 plaid silver bags."
    , "drab magenta bags contain 5 wavy tomato bags, 1 drab brown bag, 2 posh maroon bags, 5 mirrored teal bags."
    , "posh blue bags contain 3 muted lime bags, 1 mirrored tomato bag, 5 shiny aqua bags."
    , "posh purple bags contain 5 dull maroon bags."
    , "posh bronze bags contain 2 mirrored orange bags, 2 pale violet bags, 2 plaid gray bags."
    , "pale gold bags contain 4 striped brown bags, 2 muted green bags."
    , "faded crimson bags contain 5 drab salmon bags, 2 posh crimson bags, 3 light purple bags, 5 clear red bags."
    , "vibrant fuchsia bags contain 2 posh beige bags, 4 dotted indigo bags, 5 pale silver bags, 4 clear black bags."
    , "faded lime bags contain 3 posh plum bags, 3 shiny aqua bags, 4 dull chartreuse bags."
    , "shiny fuchsia bags contain 4 shiny salmon bags, 3 pale chartreuse bags."
    , "wavy lavender bags contain 2 dark blue bags, 5 muted salmon bags."
    , "pale indigo bags contain 1 wavy gold bag, 1 clear silver bag, 3 dim blue bags."
    , "drab violet bags contain 4 muted yellow bags."
    , "shiny plum bags contain 3 bright black bags, 5 pale teal bags, 5 light red bags, 2 plaid magenta bags."
    , "shiny gold bags contain 1 vibrant chartreuse bag."
    , "wavy gold bags contain 5 posh beige bags, 1 mirrored aqua bag."
    , "dark salmon bags contain 3 light aqua bags, 3 posh red bags, 2 mirrored black bags, 1 posh crimson bag."
    , "pale tan bags contain 4 wavy coral bags."
    , "dull tan bags contain 4 bright cyan bags."
    , "clear maroon bags contain 4 dim magenta bags, 2 shiny lavender bags."
    , "light white bags contain 3 dark brown bags, 4 bright fuchsia bags."
    , "wavy red bags contain 4 dim red bags."
    , "dotted aqua bags contain 4 striped teal bags."
    , "bright beige bags contain 5 shiny tomato bags."
    , "plaid indigo bags contain 1 muted bronze bag."
    , "light yellow bags contain 2 striped black bags, 2 muted gold bags, 3 dotted tan bags, 5 dark coral bags."
    , "vibrant silver bags contain 2 dim blue bags."
    , "posh tomato bags contain 5 bright red bags, 3 posh red bags, 3 plaid olive bags, 4 clear crimson bags."
    , "pale magenta bags contain 3 mirrored blue bags, 5 dull maroon bags, 5 dark violet bags."
    , "light indigo bags contain 2 plaid olive bags, 1 plaid black bag, 3 dark indigo bags."
    , "shiny green bags contain 1 vibrant chartreuse bag, 4 bright lavender bags, 3 wavy crimson bags, 4 dull red bags."
    , "striped maroon bags contain 2 posh coral bags, 2 striped gray bags, 3 clear plum bags."
    , "posh fuchsia bags contain 2 wavy gold bags, 2 posh beige bags."
    , "dim coral bags contain 4 wavy gold bags, 4 muted lavender bags."
    , "faded maroon bags contain 5 dim purple bags, 4 bright red bags, 5 wavy violet bags, 1 mirrored aqua bag."
    , "striped black bags contain 4 plaid fuchsia bags, 5 bright lavender bags, 4 dull black bags."
    , "mirrored gold bags contain 3 dotted silver bags."
    , "light tomato bags contain 5 pale brown bags, 3 wavy coral bags."
    , "dark white bags contain 2 mirrored tomato bags, 1 striped orange bag, 1 dim olive bag, 2 dotted blue bags."
    , "dotted green bags contain 3 clear plum bags."
    , "dotted brown bags contain 1 clear magenta bag."
    , "muted orange bags contain 3 muted olive bags, 2 faded yellow bags, 2 faded turquoise bags, 3 muted violet bags."
    , "dull olive bags contain 2 dotted teal bags."
    , "mirrored lime bags contain 4 dark violet bags, 4 muted yellow bags."
    , "wavy green bags contain 5 bright lime bags."
    , "drab purple bags contain 2 striped turquoise bags, 4 clear silver bags, 1 muted lime bag."
    , "clear cyan bags contain 5 light lavender bags."
    , "dim black bags contain 3 dull black bags."
    , "posh gray bags contain 4 mirrored magenta bags."
    , "dotted yellow bags contain 4 light maroon bags, 1 clear blue bag, 5 dark maroon bags."
    , "mirrored olive bags contain 2 dark violet bags, 2 dull crimson bags, 5 dim salmon bags, 5 bright tan bags."
    , "dark blue bags contain 3 dull aqua bags, 1 dim teal bag."
    , "dull bronze bags contain 4 striped coral bags."
    , "drab maroon bags contain 2 dark bronze bags, 1 wavy blue bag."
    , "mirrored lavender bags contain 4 clear black bags."
    , "dim beige bags contain 3 shiny silver bags, 2 dark purple bags, 3 dull green bags."
    , "light violet bags contain 1 muted gray bag, 5 wavy tomato bags."
    , "striped chartreuse bags contain 3 dull tan bags, 1 dim salmon bag."
    , "posh red bags contain 2 clear crimson bags, 2 striped coral bags, 2 bright red bags."
    , "wavy beige bags contain 5 muted silver bags, 5 pale teal bags."
    , "light gray bags contain 5 drab indigo bags, 3 posh crimson bags, 1 dark tan bag, 2 pale red bags."
    , "muted white bags contain 3 wavy fuchsia bags."
    , "pale violet bags contain 4 wavy tan bags, 2 plaid yellow bags."
    , "drab fuchsia bags contain 1 plaid lavender bag, 2 pale lime bags."
    , "clear green bags contain 4 light indigo bags."
    , "vibrant turquoise bags contain 2 vibrant tan bags, 3 clear silver bags."
    , "faded green bags contain 5 striped orange bags, 4 bright fuchsia bags."
    , "striped tan bags contain 4 wavy silver bags."
    , "clear white bags contain 3 vibrant fuchsia bags, 2 pale silver bags, 1 vibrant indigo bag, 3 shiny silver bags."
    , "dim cyan bags contain 2 mirrored black bags, 2 plaid chartreuse bags, 4 bright gold bags."
    , "muted gray bags contain 3 mirrored violet bags, 4 dim yellow bags."
    , "mirrored maroon bags contain 5 clear crimson bags, 2 clear gray bags, 1 dotted salmon bag."
    , "dim bronze bags contain 2 striped plum bags, 2 bright orange bags."
    , "shiny tomato bags contain 4 dim yellow bags, 2 faded bronze bags, 1 drab maroon bag, 3 dim gold bags."
    , "muted olive bags contain 2 mirrored yellow bags, 4 bright olive bags."
    , "shiny brown bags contain 3 bright coral bags."
    , "clear blue bags contain 2 pale green bags, 2 light violet bags, 4 plaid crimson bags."
    , "faded tan bags contain 4 dim crimson bags, 3 mirrored turquoise bags, 3 drab gold bags."
    , "muted cyan bags contain 2 drab silver bags."
    , "mirrored red bags contain 1 bright gold bag."
    , "faded salmon bags contain 5 posh red bags, 4 dull crimson bags, 3 dotted salmon bags, 5 shiny olive bags."
    , "dark purple bags contain 5 dim magenta bags."
    , "dotted lime bags contain 4 posh fuchsia bags, 3 wavy tan bags, 2 mirrored aqua bags, 1 shiny aqua bag."
    , "posh tan bags contain 3 plaid tan bags, 2 drab fuchsia bags."
    , "dotted teal bags contain 4 dull crimson bags, 2 bright lavender bags, 2 wavy tan bags, 4 muted crimson bags."
    , "clear purple bags contain 4 shiny aqua bags, 1 dim cyan bag, 3 dotted black bags, 4 dull gray bags."
    , "light gold bags contain 2 dotted magenta bags, 5 dark olive bags, 3 dim cyan bags, 2 dark indigo bags."
    , "mirrored silver bags contain 2 plaid black bags, 3 vibrant beige bags, 3 mirrored purple bags, 3 dotted lime bags."
    , "posh black bags contain 4 wavy violet bags, 3 plaid teal bags."
    , "faded silver bags contain 2 vibrant purple bags, 5 shiny olive bags."
    , "drab teal bags contain 2 dotted salmon bags, 4 posh beige bags, 4 mirrored tan bags, 1 muted green bag."
    , "dark maroon bags contain 2 dark tan bags, 5 mirrored gold bags, 2 dim plum bags."
    , "striped plum bags contain 3 striped coral bags, 5 clear brown bags, 1 striped brown bag."
    , "striped bronze bags contain 4 drab yellow bags, 4 striped chartreuse bags, 5 posh plum bags, 3 clear blue bags."
    , "drab plum bags contain 1 shiny gold bag, 5 vibrant tan bags, 3 light gold bags."
    , "clear fuchsia bags contain 1 vibrant red bag."
    , "dark silver bags contain 5 clear salmon bags, 1 faded yellow bag, 1 shiny lavender bag, 3 wavy fuchsia bags."
    , "striped lime bags contain 2 dim tomato bags, 3 light fuchsia bags, 1 light lime bag."
    , "wavy salmon bags contain 1 shiny tomato bag, 1 light tomato bag."
    , "dim maroon bags contain 4 faded beige bags, 2 bright turquoise bags, 4 dull purple bags, 4 vibrant olive bags."
    , "faded chartreuse bags contain 4 mirrored blue bags, 5 posh white bags, 2 wavy magenta bags."
    , "clear magenta bags contain 2 muted bronze bags, 5 dim yellow bags, 2 dotted lime bags."
    , "bright silver bags contain 2 bright gold bags, 4 wavy yellow bags."
    , "dull violet bags contain 3 faded beige bags, 1 mirrored orange bag, 1 mirrored aqua bag."
    , "vibrant cyan bags contain 2 clear aqua bags, 2 dark maroon bags, 5 pale tan bags."
    , "light chartreuse bags contain 1 wavy gold bag, 2 posh tomato bags, 2 clear silver bags."
    , "dotted olive bags contain 5 wavy crimson bags, 1 drab tomato bag."
    , "posh aqua bags contain 3 striped brown bags."
    , "posh orange bags contain 2 wavy coral bags."
    , "dull cyan bags contain 1 dark tan bag, 5 dull gray bags, 3 drab turquoise bags, 4 shiny aqua bags."
    , "muted teal bags contain 4 dull blue bags."
    , "bright turquoise bags contain 5 dull bronze bags, 1 plaid lavender bag."
    , "plaid tomato bags contain 2 muted lime bags, 1 light indigo bag, 5 posh tomato bags."
    , "dim salmon bags contain 1 dark indigo bag, 5 plaid brown bags, 3 clear crimson bags, 4 clear silver bags."
    , "posh brown bags contain 3 clear silver bags, 5 faded cyan bags, 4 posh crimson bags."
    , "dark turquoise bags contain 1 drab crimson bag, 5 striped coral bags."
    , "dull crimson bags contain no other bags."
    , "striped teal bags contain 5 plaid lavender bags, 4 faded red bags."
    , "dotted blue bags contain 5 muted beige bags."
    , "vibrant plum bags contain 1 pale lime bag, 1 posh red bag, 1 dull bronze bag, 3 drab silver bags."
    , "wavy coral bags contain 4 mirrored magenta bags, 5 dim yellow bags, 4 bright red bags, 2 posh crimson bags."
    , "dark chartreuse bags contain 5 dotted fuchsia bags, 3 mirrored silver bags, 5 mirrored aqua bags, 4 dim cyan bags."
    , "vibrant teal bags contain 3 vibrant silver bags."
    , "shiny beige bags contain 5 posh teal bags."
    , "dim olive bags contain 3 clear gray bags, 4 wavy gold bags."
    , "drab yellow bags contain 4 light chartreuse bags, 3 striped crimson bags, 2 faded gray bags."
    , "dull chartreuse bags contain 1 light lavender bag."
    , "dotted silver bags contain no other bags."
    , "shiny blue bags contain 5 dull brown bags, 2 dark coral bags, 4 shiny crimson bags."
    , "mirrored black bags contain 5 mirrored magenta bags, 1 striped turquoise bag, 2 plaid cyan bags."
    , "dull black bags contain 4 dim purple bags, 4 dark salmon bags, 2 mirrored gold bags."
    , "mirrored beige bags contain 4 striped fuchsia bags, 4 plaid black bags, 5 dim red bags, 5 light green bags."
    , "dim chartreuse bags contain 4 shiny yellow bags."
    , "shiny teal bags contain 1 vibrant maroon bag."
    , "dim tomato bags contain 5 plaid tomato bags, 5 mirrored violet bags, 2 mirrored orange bags."
    , "vibrant beige bags contain 1 plaid black bag, 3 dotted salmon bags, 2 posh fuchsia bags."
    , "dull aqua bags contain 5 wavy tan bags, 3 bright olive bags."
    , "pale lime bags contain 5 bright turquoise bags, 5 dim yellow bags, 3 shiny orange bags."
    , "bright orange bags contain 4 muted gold bags, 1 clear white bag."
    , "drab salmon bags contain 2 dark fuchsia bags, 2 dull gray bags."
    , "mirrored salmon bags contain 3 posh plum bags, 1 dotted silver bag, 1 clear plum bag, 5 dull black bags."
    , "shiny silver bags contain 4 drab lavender bags, 2 dim violet bags, 5 dark aqua bags, 2 vibrant chartreuse bags."
    , "plaid coral bags contain 4 dim blue bags, 1 vibrant lime bag."
    , "mirrored white bags contain 2 pale gold bags, 3 shiny green bags, 5 striped white bags."
    , "pale gray bags contain 5 mirrored gold bags, 1 wavy silver bag, 5 posh green bags, 1 mirrored red bag."
    , "pale white bags contain 4 shiny turquoise bags, 4 bright plum bags, 5 dotted bronze bags."
    , "muted fuchsia bags contain 5 plaid turquoise bags, 2 dark aqua bags, 4 pale brown bags, 4 striped plum bags."
    , "striped yellow bags contain 5 posh red bags, 1 plaid black bag."
    , "plaid silver bags contain 2 dark indigo bags, 3 clear teal bags, 3 dotted black bags."
    , "plaid black bags contain 3 dull crimson bags."
    , "vibrant lime bags contain 1 dotted fuchsia bag, 4 dull bronze bags, 4 dark aqua bags, 1 dark salmon bag."
    , "dotted white bags contain 5 dim red bags."
    , "light aqua bags contain 5 mirrored aqua bags, 2 striped brown bags, 4 posh crimson bags."
    , "striped brown bags contain 1 dotted silver bag, 5 clear beige bags."
    , "vibrant red bags contain 3 bright olive bags, 3 plaid chartreuse bags, 3 light olive bags, 4 dim violet bags."
    , "dim teal bags contain 3 clear violet bags."
    , "bright lime bags contain 2 dull lavender bags, 4 pale turquoise bags."
    , "striped crimson bags contain 5 bright gray bags, 4 dark green bags, 4 posh plum bags, 5 shiny coral bags."
    , "mirrored tomato bags contain 1 wavy tan bag."
    , "dull blue bags contain 5 bright turquoise bags, 2 striped brown bags."
    , "mirrored yellow bags contain 4 vibrant purple bags, 4 faded bronze bags, 2 dull lavender bags, 3 light plum bags."
    , "plaid gold bags contain 5 striped olive bags, 5 dotted chartreuse bags."
    , "dotted coral bags contain 2 bright teal bags."
    , "wavy crimson bags contain 5 dotted salmon bags, 1 dull crimson bag."
    , "dark aqua bags contain 3 dull crimson bags, 5 light aqua bags, 3 mirrored purple bags, 1 striped brown bag."
    , "vibrant yellow bags contain 1 faded beige bag, 3 dark brown bags, 1 wavy bronze bag."
    , "wavy teal bags contain 5 dotted magenta bags."
    , "drab white bags contain 3 pale blue bags."
    , "muted salmon bags contain 4 posh salmon bags, 1 bright chartreuse bag."
    , "light purple bags contain 5 dark maroon bags."
    , "faded black bags contain 4 dull gold bags."
    , "muted turquoise bags contain 1 wavy silver bag, 4 clear purple bags."
    , "plaid chartreuse bags contain 1 posh crimson bag, 5 striped brown bags."
    , "vibrant tan bags contain 2 dull blue bags, 1 posh black bag, 1 faded red bag, 5 plaid magenta bags."
    , "shiny orange bags contain 5 vibrant chartreuse bags, 3 shiny gold bags."
    , "shiny lavender bags contain 2 posh teal bags."
    , "pale black bags contain 5 dark brown bags."
    , "shiny cyan bags contain 5 wavy tomato bags, 3 bright bronze bags, 3 faded crimson bags."
    , "faded olive bags contain 3 clear aqua bags."
    , "dark violet bags contain 4 faded red bags."
    , "light orange bags contain 1 posh aqua bag, 2 light crimson bags, 2 dark maroon bags."
    , "drab silver bags contain 1 pale blue bag."
    , "plaid bronze bags contain 5 mirrored orange bags, 4 plaid cyan bags, 1 dotted black bag."
    , "plaid violet bags contain 1 plaid fuchsia bag, 5 clear teal bags."
    , "clear turquoise bags contain 4 dim yellow bags, 5 plaid teal bags, 3 plaid red bags, 1 dotted salmon bag."
    , "plaid lavender bags contain 3 clear silver bags, 4 dull bronze bags."
    , "mirrored green bags contain 3 striped lavender bags."
    , "faded white bags contain 2 light chartreuse bags."
    , "bright crimson bags contain 2 mirrored purple bags."
    , "dotted beige bags contain 1 pale salmon bag, 5 dotted teal bags, 5 light lavender bags, 3 wavy violet bags."
    , "pale green bags contain 2 dark gold bags, 4 clear gray bags."
    , "dull indigo bags contain 2 striped brown bags, 3 plaid plum bags."
    , "shiny yellow bags contain 3 striped silver bags, 2 mirrored plum bags, 1 muted red bag, 5 clear gold bags."
    , "bright maroon bags contain 2 muted crimson bags, 2 plaid chartreuse bags, 1 dim violet bag, 1 plaid blue bag."
    , "vibrant orange bags contain 5 posh plum bags, 4 shiny gold bags."
    , "faded fuchsia bags contain 2 dotted aqua bags."
    , "bright indigo bags contain 3 shiny coral bags, 1 muted salmon bag, 2 clear white bags, 1 vibrant maroon bag."
    , "shiny indigo bags contain 4 dark red bags, 2 pale lime bags."
    , "light cyan bags contain 2 clear black bags, 2 mirrored aqua bags, 1 faded beige bag, 2 faded salmon bags."
    , "faded gold bags contain 5 muted lime bags, 3 plaid fuchsia bags."
    , "muted coral bags contain 2 faded indigo bags, 1 dim beige bag, 5 dotted orange bags, 4 posh black bags."
    , "drab gray bags contain 5 clear magenta bags, 5 bright tomato bags, 1 dull gold bag."
    , "vibrant salmon bags contain 4 bright gold bags."
    , "dark red bags contain 5 posh black bags, 4 faded teal bags."
    , "wavy blue bags contain 3 dim green bags, 4 dull green bags, 2 posh aqua bags."
    , "mirrored turquoise bags contain 5 dull lime bags, 4 dark gray bags, 1 striped cyan bag, 4 muted gold bags."
    , "wavy chartreuse bags contain 1 pale brown bag, 4 shiny chartreuse bags, 4 wavy fuchsia bags."
    , "dim red bags contain 1 bright blue bag, 3 clear purple bags, 2 wavy crimson bags, 5 shiny black bags."
    , "dull gold bags contain 4 wavy blue bags."
    , "faded blue bags contain 1 plaid turquoise bag, 2 vibrant indigo bags."
    , "shiny aqua bags contain 4 plaid cyan bags, 4 posh crimson bags."
    , "bright salmon bags contain 1 posh red bag, 1 shiny orange bag, 1 vibrant crimson bag."
    , "pale yellow bags contain 4 plaid cyan bags."
    , "plaid magenta bags contain 3 plaid brown bags, 5 pale yellow bags, 5 drab fuchsia bags, 1 clear black bag."
    , "vibrant maroon bags contain 4 dull tomato bags, 1 dotted indigo bag, 2 plaid teal bags, 2 shiny gold bags."
    , "drab orange bags contain 3 wavy coral bags."
    , "pale aqua bags contain 5 wavy lime bags, 5 drab turquoise bags."
    , "shiny crimson bags contain 3 posh black bags, 5 drab fuchsia bags, 1 plaid fuchsia bag, 4 posh plum bags."
    , "pale purple bags contain 2 clear green bags, 2 striped crimson bags, 4 drab indigo bags."
    , "faded magenta bags contain 5 light red bags."
    , "shiny tan bags contain 5 plaid silver bags, 3 light lavender bags, 4 wavy purple bags."
    , "vibrant indigo bags contain 5 plaid beige bags."
    , "wavy turquoise bags contain 4 dark teal bags, 2 dark cyan bags, 4 mirrored olive bags, 5 bright red bags."
    , "striped blue bags contain 1 vibrant lime bag, 3 vibrant indigo bags, 1 pale maroon bag, 2 dark white bags."
    , "faded tomato bags contain 3 plaid tan bags, 4 pale tan bags, 5 wavy violet bags, 3 pale lime bags."
    , "bright green bags contain 1 bright purple bag, 5 posh magenta bags."
    , "dark beige bags contain 4 light green bags, 4 light magenta bags, 5 dotted lime bags, 4 plaid salmon bags."
    , "plaid green bags contain 2 pale salmon bags."
    , "bright red bags contain 2 dotted silver bags."
    , "drab lime bags contain 3 dotted bronze bags."
    , "muted indigo bags contain 4 posh gray bags, 2 dark lavender bags, 2 plaid chartreuse bags, 2 pale red bags."
    , "muted tan bags contain 2 muted brown bags, 3 dull maroon bags."
    , "plaid turquoise bags contain 3 clear teal bags, 2 dull tomato bags, 5 dotted purple bags, 1 posh salmon bag."
    , "drab aqua bags contain 3 bright lime bags, 5 posh red bags."
    ]


customs =
    """psyjxulrdtfe
             jeusdrlxyftp
             ufdpjsxrlztye
             yeorabxsdnhftujlp
             pedfxtsryujl
             
             tauc
             bauptcr
             uact
             cuat
             tacu
             
             xyadvrniqso
             mquglwtczhvpnb
             bmfnuqkvz
             
             fzynq
             yqznf
             qfynz
             zfnqy
             
             kisfzpdjecowv
             rkivjpqwomzsced
             
             prjbzgwkhoqcyxvnd
             vfsietlaqmu
             
             jucif
             cukfsji
             jicduf
             ficuhj
             cfjiu
             
             netxwkjlgmv
             nxjkgdvle
             nxhbylvqjek
             
             ejpfqsc
             rvewqcpsjmond
             ejspcq
             qsecjp
             
             i
             mc
             s
             s
             
             kbem
             eqh
             ep
             ehfp
             
             fgjmp
             jgoac
             
             hrulfeqm
             rlmfeqc
             lerfmjbq
             lebmqsrf
             zxflemqdirkya
             
             zlhc
             lhv
             lcvgh
             hlrq
             
             xziquhkfsrylncvmtpwgj
             gpukziqsymrflvnxcjwh
             zmdbpgwernuckvshfjylxiq
             
             qlmcfudnpbiyswjxg
             xbigfmnojlqwudysvc
             
             ypiduglmtwfcesabvx
             vpyutxdblmcgseiw
             deuwlbptyomgvcis
             dpcbvglstiewymu
             csuekibypvwtmzhdlg
             
             wxvjktdrapozsmiuhnl
             hejtosyximkwvdlnpaurz
             rszxhjldoutmvankpqiw
             jzvuhistngdoxalrpwkmf
             
             ekpxlh
             lpx
             plkx
             mpl
             
             ohgs
             hsgo
             
             tsu
             tbx
             swltp
             
             dzapkcqlmbsrivuxhg
             bazpqwldgvmxkuchsr
             qgxzlhkpmbvrcdasu
             lghvqradxukpsbcmz
             
             mybfl
             mbylf
             ysufblr
             
             vys
             te
             
             cvxtqoduaehfwmk
             cudafwkqvehmt
             thecvmzuadygqkiw
             qucobmdwavekhrt
             ehxtqcwdmrakvu
             
             txsjiaz
             atxszji
             asijtxz
             itaxjsz
             
             qeyduhc
             jwypnasxd
             
             vcuwmrbqlfjnopsdai
             inbshapqowdmclvfjrk
             ijqvndbwcftsmlaopr
             
             bhwejdzlkxv
             wvhbnkjlxdze
             jlwxbhvkezd
             vzhelwijbkxd
             
             qzi
             kq
             
             lxn
             rkq
             dcb
             a
             
             zwkgexbplschumdfyj
             tgdqbkmujien
             
             xmweu
             exuzowpmdr
             xqjuwisvecm
             weuxmf
             xmwuep
             
             zaomvcbwjlf
             bovzfwlmcaj
             mwbcoljzavf
             
             c
             c
             i
             
             zcrwoth
             zcowhtr
             zhcnoxtrwm
             
             yxznr
             tly
             gyfu
             
             gathskpquvxlbdfzwymrcn
             cshxqkvmglupzbyantfdwr
             bmncqhpwkurxvzalgfdyst
             waqthsuymlxcrpgkbdvznf
             
             i
             k
             g
             c
             
             vwflxaboznkurhmteiqgyjsd
             dhkwlymqtuserjfviagoxbzn
             dgtwbjeivsxuraonkhfmzqly
             jkfaimruevlqwhzdoxgnbsyt
             ralekoxdqyusbnmziwvghftj
             
             nftacgp
             tgnpacf
             ftgpnca
             
             asfhqbkpegmtzy
             szybtehgqmfrau
             
             nbjoa
             aboydn
             dnok
             onj
             cxvhponeiuzq
             
             imqja
             qia
             aiq
             
             ugrpmslbyjnkaxewozhivq
             kchewafgoxpurzljvq
             
             b
             b
             b
             b
             bhq
             
             yadlonb
             usogla
             qjaephztclorvfk
             
             ojk
             jko
             kovj
             jko
             
             y
             y
             y
             y
             
             bxiqpkcthlargdzevfoyjms
             krzosbvldyhapfqxjgwtme
             ezybmpxvalqsgtjrofkhd
             vjygdkqsptfbhzlmexoar
             vqafhgpzmrtkdyjesolxb
             
             wfysdai
             fasyid
             fsyida
             dsafyi
             gsqdnytapif
             
             rhiblyqavfck
             ukmrhibavgyocpq
             tiakcsvdblqyrh
             
             xqmysnfjd
             msudyfqnx
             
             whbnqotf
             nbcqgfhouzt
             
             ltfhwgvr
             etwlhrgnsiyvmc
             rgtwvlh
             
             z
             z
             z
             z
             z
             
             uma
             emaz
             
             nwzmqseauhcgryvpdl
             kxouljhagsnizptbme
             
             gnyv
             fbaryql
             koyg
             
             lmdhgykqxctasziwofjr
             wmackqyodhszftirljgx
             udtmcroqiahkzlfxsgwjy
             oidthqzkwmfgasylcxjr
             
             ujrfbtywhdqxl
             rejqtudocw
             tnqjideumarw
             kqdtsurwja
             
             aerykhpxivfbnw
             bavyrunpkwxfihe
             kxnlrpemhwicfyasbj
             
             xvnwdzmbsuiqok
             pxmbkvouqwszie
             ukwimebxqozvs
             zbqymikxowvsu
             qmuvozsiwbxk
             
             rfmcnesybio
             crneimqbpuo
             mcdhbroineu
             
             xctagpmdyfnojvqebwrzk
             iufvoepqmhaxnbwjgd
             dbjmxlgfeawqsupovn
             
             edvljhxzntq
             qtzxvjnhedl
             vzexlqthjnd
             lvtexjhdznq
             
             hiucfmdg
             hksfm
             pmxfbhq
             
             ufjzdcxewvgohk
             dzjwcxouvkhegf
             jgvuchfdzoskexwb
             
             ipwomhynajekrvscx
             aycrdsuwftzl
             
             eurpabstvqyc
             lajpuvkfxsgwcqremt
             cqopetuavsr
             crepuqasitv
             vsyqeartpuc
             
             au
             jux
             
             ikq
             kqi
             qik
             ikq
             kiq
             
             yaunzghct
             ynkaszgucvdxtwlh
             
             pfmzvyxijn
             jmyixvfnpwz
             
             lptjedq
             edtjqpl
             ldejpqt
             dpljeqt
             
             omgvpsezljfhubtq
             htqeobmjusvwfldgz
             uhlbemqyvjgftzso
             
             phxinzkyefg
             iyefhzngpkx
             yfgkxpeiznh
             fxnhepiyzgk
             kfighxypzen
             
             qlwrtnk
             rn
             lnt
             zfynjcas
             lndg
             
             tb
             bhtv
             tyb
             
             fleoqjmhr
             soimqleh
             
             zuxcqljmesota
             jmtqexlso
             xqetljosm
             
             zj
             nzprayjw
             jzib
             zj
             zj
             
             ypt
             pl
             
             rogyzi
             ivlgry
             yotgriz
             zgiyr
             
             nehkpwdczqyos
             dqtmepyhow
             qhydwope
             eydhowqp
             ehdqpyow
             
             ylfkrg
             uforztyvqgik
             
             u
             u
             wup
             u
             
             bxv
             xv
             vx
             
             cpjumevoiwftxybgrhsq
             jipcqtsvmuygbfnrhxeow
             wibaegtruphzxsyfljqmcvo
             ubtrxfywgdpmichojqvse
             cmhrikfvpxjgyuoqnbswet
             
             rximbyhodvesjaglf
             rfhglesmbxdyvaoi
             ragexmboivhfdyls
             yiofrgxmvhalbsde
             
             mxcrsutkbpn
             priozstxcgekwdmq
             sckbtpxmrh
             
             ewtshjfmkcgrzdpuqai
             wsuknzpgmvhqyctrfadeji
             emusqdbtzpgoijaxrwkfcl
             qpsakdrijemwcgzfut
             
             b
             aeb
             b
             
             qmhink
             hliknpum
             
             yonuifpczr
             mwlbsdyhzn
             
             qbenu
             bnwue
             uebqn
             neub
             nebuz
             
             cjbw
             lcb
             wbci
             vbhcf
             
             xazglivb
             agbzlv
             balvgz
             
             ckto
             to
             
             nrmt
             snorm
             nhmur
             tonmr
             
             dqlmczefiv
             ifqmvldzce
             
             thdorm
             hgmto
             ahiytklqbsvcmn
             rhmt
             mpht
             
             wdeprhgimuxk
             idvhprxjgmkewu
             
             yqcozgdajfib
             uqgxafojiys
             ykjaqnfogrpi
             eiqwzfoaygj
             
             qxerb
             efsqz
             wynkpehjlct
             rxoe
             ue
             
             sowgyevzruikhnpadtl
             ylpinthwdouagresvzk
             srlwuaoidhtevgpnkyz
             kgowaehyztdpuvnslri
             nhafovisuyzdrtgpkewl
             
             d
             d
             d
             d
             
             mtqk
             tqfkrm
             fqkmt
             qknmt
             mktqco
             
             fz
             f
             f
             f
             f
             
             syebiqrg
             rism
             ikats
             musi
             
             nhavkyfexz
             zahynkfxve
             nyeafqzkhxv
             
             qtojrevdcakbm
             okcabmerdjt
             yjaurokmndfecbt
             braoedjmwzcklt
             
             mtrlehyj
             rjlhymetg
             ylmhjfet
             lmehytpj
             
             yvhdpojulfkenqwbrs
             zbpasjfwdnxroqvlgckhu
             dpsvbnkfrlqwoyhuj
             wtvjnulkdoqrpbhfs
             
             vxkumcely
             xlnfymecv
             
             rb
             g
             zr
             b
             
             fowha
             fawoh
             awohf
             wofha
             ohafw
             
             vcwfuq
             qvcufw
             wfqvsuc
             ucfwvqh
             
             vw
             renkxpcob
             iuwmz
             h
             
             jyqmoxfuw
             wmujf
             zpmish
             
             whcjsfniotabrlx
             aomjwtcrhfxnbeslv
             ortnjacxeblfwhzs
             qyagxnchbwjoustlprf
             kahtzfxwjorcbnsl
             
             vxjmbw
             gomxsiduv
             zcxfbvm
             
             agqivyh
             yqghviu
             
             b
             vrxznhel
             bgap
             itsp
             
             xqlfvnpyswztbekjaod
             jdtazvoswknelpiyxqb
             spyqvjeuznwlbcadtkxo
             
             anso
             dxywl
             
             abwgum
             amws
             avwjxym
             wam
             amw
             
             rqljdeuygocatmsxbkwfpvzi
             dzcvktpjlhaiyfbmowxuqgse
             qwligstokuezbcpyfjxavmd
             wujleyktvrsazodgqxbpfimc
             
             qdxcnywbr
             xznrtwvydcm
             cnydwrx
             
             yprzo
             bproyz
             sgzyorpx
             oyzqpr
             
             lirstyawhjgfvqnupe
             avfqphwejisygrunlt
             
             ndsirvcqkebtuofa
             cnraebdvfqpsikuot
             kivdusqtobarnfce
             rtanfusicoedbvkq
             
             mvexgca
             xgemoacv
             ygclvamex
             mvexgca
             
             pomdz
             exwczso
             
             edahvyqfitjrwgncsz
             knbeijqghsvcat
             scqphvejigtan
             qgjvxibnmthseuca
             
             jlirtpfkmosvbzcy
             mpthzsrkfgecilojabdy
             tnmsplqkfcyzbiroj
             mifnbykjrpclosxztq
             
             vdyfjmh
             zaclvhxfygj
             jmhvdfy
             fjhykv
             
             r
             q
             q
             q
             q
             
             mrtzwkpdhi
             bvqgfalrwoxsyi
             
             vuw
             bnhu
             otus
             mplu
             
             tjmg
             motyxj
             jgtm
             gmtj
             
             rujkcoblgzpdayntsmv
             okruvntghfpyajbcwlzsd
             dantscjogeurvbilkzyp
             xzojgystabcrdnvlpuk
             
             xohyfb
             pihs
             zutwh
             gakmdjnlv
             yrc
             
             xmbehuakcqvjrpzgfidsyl
             jpycigslahwxdemknofbuv
             
             hrxkzpm
             khxp
             hkxp
             hxkp
             
             x
             x
             x
             r
             x
             
             qrnatwkbsjy
             iatkwrysnq
             wncsqtuaryk
             
             uxtrvkzywdjnfsmhbogcpa
             nbuzrkagtwosvdfcyhmxpj
             mrokvgfhuwsjactdynpzxb
             ormjpzshwfcgdbkvxtunya
             tsjapmhwzkxyfrnduocvgb
             
             cwjibpntreofusqgadvhxzy
             tbpknsfvcrquegxoidahyzwj
             dfupeotczqwjahvxryngsib
             fmjrnipaqesxyvdcgwohutzb
             bipzvcqouynrhtwaxegdfsj
             
             efiuhbdrwpzltnkac
             mwditrhnebcukpzfl
             kricneuaftbwpgldhz
             tcilfzrunhwdepkb
             urkzhncdptbfleiw
             
             mcjpg
             rmijgtc
             
             bcpxuyqnemsgaihovwtl
             paylndcgohiqbewumvt
             
             jhviwnexrzftgy
             tfeudvzrnxgy
             pxstnzrgvefy
             
             majeinxgl
             lxajignem
             lnjgamveisx
             
             gmhvjqedu
             hqengldm
             ghuvqmed
             dewfhagrxqzm
             mdqhge
             
             vrlyo
             ywo
             woy
             woy
             
             rwzq
             ursqncgw
             wzqr
             wqr
             
             olci
             lc
             
             p
             p
             op
             p
             zp
             
             kpq
             skcu
             
             qxhjwce
             chjqewx
             wtjkchxeyq
             chwqexj
             hwxejqci
             
             anrbwkmdoylzpxg
             cqylitwdvmzej
             nhdsrwufxmyzl
             
             mhjkzey
             smrnqaljvp
             
             s
             sim
             sk
             sky
             bs
             
             q
             qd
             q
             q
             
             kbjqrfcsvledptazyhugoi
             wjsdvrqeailkftzuhbo
             
             ytxjunebqsg
             qyuazrtgejnbx
             xjunbtqkey
             xegubjtnyq
             yxbqrnjute
             
             msvygnzd
             lbnjotikdgz
             pfzgrhqnd
             xednagzv
             fwgdnrz
             
             xmnvd
             dmyqvnx
             
             abhdgjrcskfelp
             befplkcrhdsgja
             hjbcagsrdpklfe
             
             pkrtlvmzgxeoabwy
             olzregptyabxkmw
             
             kgmypdsiev
             yrgkvcme
             wrvhemakyg
             
             hapfkirztjdqslumxbnowecgvy
             minyfurqzahvkjplosecxwtg
             
             n
             uw
             n
             h
             
             gxfcnkbsqrehumoltjwdvyzia
             irwgvtzhkjomblyaxqedfucsn
             euztvnfrgxkalbwcidymhjosq
             bluaioskrzdyjwvxqhctnfgem
             ixuqesyavghrbfmokwndczjlt
             
             isyjneg
             zawfy
             psxchy
             iotbvqmly
             
             fatwxv
             xawftv
             vawxtlf
             aetfzvxw
             vtafwx
             
             oeunt
             tuone
             touen
             uetno
             otuenp
             
             nxfkocywbvez
             bkvecyonxzwf
             kyerboxqfcvzwn
             zovwkexycfbns
             cyfkonebwvxz
             
             iynqfrlcuxmkazwe
             nklazemyfuxwqir
             yiudaqzkeflwmrnx
             
             zuxleb
             euxowpyzl
             
             y
             y
             yj
             
             imn
             mni
             nim
             nmi
             imn
             
             zpdvmaonwslqf
             eiwlyrdnovzm
             dwomtlnv
             opvmdlbnw
             
             bymtkosevw
             jmbl
             lbm
             bm
             
             eziagcuksbvopnhlt
             hpknvzgetscalboui
             ozcsbehgkitlapuvn
             lzskitunbghveacop
             
             wcstlfkbdehizg
             bwfodtczgmesrkhalin
             iewgsdyfhzkbtcl
             fqztcgkhibelwsd
             
             uoajlenpdmgzwyxk
             nyguwlokxmdjazvfep
             yagkxwnezpdmlhouj
             aegxmwkslnpzoydju
             
             isewdj
             swedi
             dwsei
             
             muexcjgzwo
             ywmzonecgjxuq
             zgxjmwecou
             gwcxujezmo
             xowguimjezc
             
             nmkuglojyqt
             lb
             lv
             
             vnghbclojyatpe
             bkpaeucohvgfyw
             
             npi
             hyb
             t
             d
             
             jfwl
             lrwof
             
             aklzvcubyigjenfpordqtxswhm
             bzngdfkpshulwxqrvoytmiaejc
             
             ail
             gali
             
             hybtnavm
             mvbtn
             ktvnwmq
             anvtm
             
             ipzls
             spliz
             lspzi
             slpiz
             szilp
             
             u
             hv
             f
             f
             
             mbpdcfykahrwutezxsi
             wtzumakvibxyfpserhd
             
             m
             m
             m
             m
             m
             
             ahz
             ha
             ah
             
             b
             b
             b
             n
             b
             
             qfae
             efq
             eufq
             mqfe
             
             thkbevrxw
             bkwmlateh
             wkeqtbmuh
             wubktfejh
             tbghyemkw
             
             yphtjurbxwvfslk
             gozcmqakdnbeix
             
             smyokqtxgrzhu
             dsiugwamcrzfoqpt
             qosugtwzrjmv
             
             gyfhpxo
             bhpygx
             cpsxjhg
             xilgphw
             
             rt
             rt
             lrt
             rt
             rt
             
             pfiwlonuysmajxktqgrhv
             afwvuyrztinokxsdcqlhm
             lnqxtmrfvosayiwuhk
             
             enwyubthrivocskdaxp
             jhuelpncsmdtxovbik
             
             xfzlchwodr
             zwhcordxlf
             
             bqrad
             bafrd
             
             uvncdmyslxb
             scvmnuxldyb
             ynbmsuxlcvd
             cbmnsyluvdx
             lvscduxnmby
             
             miyruh
             uhzy
             yjvuh
             cuhy
             hnylugjpt
             
             xjncqoi
             cnojqitl
             
             qpvhxoyunblgfsikwdmtcaez
             ztgciowvrlshbqnfdeyukmxa
             vcuewhfomqnykbxajsdliztg
             
             wnrkvj
             wnjkr
             
             zbtaqcugymsiwdl
             ibwguqsytdmlczo
             txgceqirdmysbzuwl
             zlmxgqyswbtiucd
             zynlcqgtbdmhiwus
             
             jzedbcmwxfgpq
             kwmbfgjrqzxpod
             drxwjqbgtmpzfs
             
             vurqga
             vgquz
             qugv
             vqug
             vqugz
             
             nixusrfwado
             epiyljwrzxauqdonsf
             nashfixuwrod
             fawnusdxroi
             wduianrofsx
             
             ugqpkfsrnyj
             wnesyrlgiujzt
             
             x
             eu
             u
             
             zbetljwkx
             k
             fkvry
             hkurfo
             
             knfthjivoy
             ojyiknhtv
             vtyokinhj
             vhytkinoj
             ynhikptjvol
             
             csxfmtnoaqpyeidz
             xmpinfcdlgsyqve
             fiqupdebsynmxc
             faswcpiqdxetmyn
             
             svkjpxtfdqyhiolambzwn
             fkmzblstpaoxyjvdhqniw
             qfplwodkznmihjsxtvbay
             abowfdjshxikyzlmptqnv
             hfspbqyaxlznikotvdmwj
             
             rctfbgzp
             gbpftzrc
             fctzrgpb
             
             lejtpynh
             
             gf
             clfg
             gf
             fgk
             
             sodiucqmlafg
             unfhqboscpijgxmk
             
             ihevxjqsmlbpt
             mxlzbqhavjipyet
             jpihtrbevqgmu
             
             btlidxoenkagfjpw
             oeginalxpdjywfkbt
             wolapixjvuedbfktn
             
             vdabnqmywx
             mvsycjnxpwqb
             ixymnqvbw
             mxbknvywrq
             wymbnvgiqx
             
             yxjbdqsmuhwcgzpaknv
             jgazxpuymqbsdhkw
             
             sgnzovqr
             znrgq
             zbqdnga
             
             dgebpu
             pdgbeu
             
             lpxsdmwiv
             lgxociyzutpq
             ylcjiptx
             
             mevcwpxfakhiusdltb
             hvmguqyjzikbfropx
             
             bohqjkcugsyxzpa
             qkpsbxajoygcz
             qbgajkyxfzcpso
             kozhspajqxcybg
             
             ibzerqhvujslnocgpkfyd
             gfcqkhslpzemwtuvjdiryn
             kucpnszaivdfqlexrjghy
             
             ofjdnik
             fpgkiwj
             caemszlx
             rbvyti
             
             gt
             g
             
             u
             uwgvce
             u
             
             lewibuhsaxknqr
             ewjogalxqucnzbi
             
             psxczted
             pzetsf
             
             tidjmqweyhoglfxnsz
             sfeotrqlidhynw
             ldtiysqfwehuonr
             leqnvsdyofthuwi
             
             ipqkfou
             qgkioxpfu
             ipuoqkf
             ifoupkq
             kqfopui
             
             f
             u
             f
             f
             f
             
             xsipeov
             znhgawtb
             uk
             khlty
             
             cbtuslj
             tybslucjq
             sjcbdult
             
             ukqat
             qantk
             qkat
             ktaq
             
             zhbdtnvfqoyis
             guzixoynpqhmakec
             
             pjeiudch
             dcswpiohj
             vychkdjipbq
             
             mrah
             chmea
             mhar
             amh
             athmb
             
             icbodum
             mnuv
             ouim
             mhjaptgxwr
             
             tzrlebo
             zborelpt
             voektbzlr
             
             l
             l
             l
             l
             t
             
             mto
             whto
             
             hpeslaqyg
             zpiaqceyolhs
             ehaqlysp
             lshyegpaq
             elfyqpsha
             
             romucgitvqayb
             bhuvtqyciaogrdm
             
             xptnylg
             ylxngt
             aixymvtnlwgz
             xnytlg
             yxltjng
             
             eoarkfglncpbs
             rtpuasdcoxeifnm
             wseorahpfnc
             oqaekfsnrypcb
             
             xeuhcqm
             qewumgd
             
             jkadlsqztn
             tsqakjznl
             zjkqsantl
             ltakqjsnz
             
             xfgk
             dxg
             
             suothae
             osuahet
             aoethus
             
             vqetwh
             eqvhwld
             wxdnqhv
             ufvisjwpqahc
             hqnzvkmyw
             
             xgybrmwl
             myxibrwg
             
             umvjxpz
             xupvmjz
             svxbzpmju
             
             mefoyntbczkxvhusraqjl
             ehmtyaquvlskoxzbfncij
             jlxtpyqowbhecgzufmdnska
             
             nomjqcaegz
             agcnqomj
             goqjcman
             ngqcojma
             
             ylpachozbjsnwt
             ybtwjozpacnlhs
             lsnbacjohtwpy
             pbaoynhlscwtj
             nhjkwtlbcopasy
             
             wazkf
             zafkw
             kzfaw
             wfaskz
             zkwaf
             
             jdylcghes
             bvfuokra
             
             yhlrqgmtcuxpzk
             mhqoitkdcxgsfanzpyurjl
             uygpzqhrkcxlmt
             kgmcbhlzxyutrpq
             kqxuyrgczpmtlh
             
             vwp
             cwe
             
             cgvspqxmtbwyhiluafkrn
             vmrtwyzjqncgblpasfiohxd
             
             mdueyvnlqapjcfohr
             symlcwdurgvzehnfoikaqt
             
             tgroefs
             qwbak
             j
             ym
             
             yvse
             yecv
             
             ieacpfgu
             xsnkrhd
             
             vynuphbmfjdsqwgxe
             kozalcuqit
             
             hanez
             azpn
             nayzb
             nza
             
             dabv
             bga
             ba
             amckjbe
             
             epkdibuvzqaycjrmn
             zrcaevkujinpmd
             vukdparzimlfjcne
             
             ajxnmvql
             vlpeb
             elpvd
             krlspv
             
             nsqk
             kiq
             ikq
             
             vmqltdrubk
             nzrogdbqmu
             
             sraulgkqtjnib
             zvmahfecdypxjbrow
             
             tmdjh
             htmu
             htm
             
             qmzkaewsdyjvobrplxniuh
             hjecdsnkivbplaqurozyxm
             lbdsoyzhvxaipkmjcenruq
             uvdlshyrxeokqabipjznm
             
             mnwzxtdeh
             nphdzwe
             ehyxndwz
             dxnwhez
             dnwbhvez
             
             fizvsuln
             ifsnvzlu
             nlsuzfiv
             nsuivflz
             usfvnzil
             
             ouwnajlxteydmhcgqzk
             xqrhnkeywuclzgsatomvj
             wdfegyljbtzokaqnmxuhc
             uygnajlwfkotchdzqexm
             
             unrofzdxtmv
             klhzptxub
             tguxzb
             
             zijdyhupnbvmatxwk
             tnzhajkbxmuvpyiwd
             ynkjivupwhbtzmax
             pbwnfizkyhavtmujx
             nhjxyauvkimwpzbt
             
             kfsgo
             fgkos
             
             dyepsohmrqivg
             ohipsdrmevgq
             vhgodspmirke
             
             zpnfrtskxlemhji
             kxnlemufwyqcrpzhst
             
             nsvhxzcwb
             rbavizyc
             bknzmcxwvo
             zbvhc
             
             mejhsdcy
             bvaqg
             
             mrpzqycif
             iochazwfbp
             zipoecfb
             fiuzpcxsdj
             ficzptk
             
             jzkdfrleqiv
             qlrkmfdnyevc
             qsnvguxkfrdle
             fvdqgrelk
             wbeprdlqvohfkat
             
             nbuhmr
             xwgr
             
             sza
             hrzajd
             alzs
             xiaznbe
             wzah
             
             wcmshqoi
             qcds
             qflacs
             
             qkw
             wjqk
             qwk
             
             qgri
             qirg
             riqgw
             rqgi
             
             denb
             gen
             ne
             en
             wenh
             
             lzounafyd
             wbomsfldq
             vkoptil
             aroqwl
             
             jgd
             w
             
             xgzqwsdoeirvthlcmubyk
             rfemgxkvsnoydqzuwblcih
             cqwloikevzsxrudhgmby
             mlxtsvqwidzocgbeuykrh
             
             j
             h
             t
             j
             j
             
             li
             li
             il
             li
             
             olcqbjrgumixeyh
             bkluzohywiqgedtcr
             qheyrbiuolvgc
             urqcgeihobyl
             
             rdcluvht
             ofbymqpe
             qizjgxwasnk
             
             ucypvrob
             ocuvbpyr
             cryhuobqevp
             
             xdfazujoec
             efuocjd
             lcumyfjqwseokdv
             euofcjdh
             drecojuf
             
             tvxlf
             ftlxv
             lvxft
             cvxflt
             
             nuvxtjmdgzpwb
             xdbowmnpluzgt
             tpujdbnzxwgm
             dpryqkwbzahiugmfetxn
             wjgzbnudcplmxst
             
             vcehnodya
             voyaedhnc
             vncayeopdqh
             
             gouqjpnsdfxa
             xnafpjscqodu
             fsaxoqjdnpku
             updjqfxsnao
             ukxqpasfdoncj
             
             wmphdfsrqyoinzv
             ynaezscqgipwxkjbfol
             
             vpzah
             phzva
             zpavh
             zvaph
             
             rwnocdibptleasjq
             qrlbnhjpoxdaeic
             nijfklgduczorbyaqpe
             
             ihjbvfzxcdlsqrtymuga
             umyfgsijtrhvdbqlcaz
             rhjqmbgivsuaztlcfyd
             bujhfrdzavltgqicmys
             
             edgm
             ybfad
             d
             kd
             
             pzbqrskv
             zvpqb
             zapqvb
             pvzqwtb
             
             ngzjoelwdctkmxvuh
             svntuohjcxgezmlkwd
             zdvetunxmlgohwjck
             uhsxmgvdwktczejnol
             jcgevxomutwkzhydnl
             
             usoedqakicjflztnyrhx
             tfbnuxsajrhdecykzlo
             ozcvythnxefkarpsdmgwluj
             
             jlipyevhat
             idsojl
             
             xmity
             gytlmqw
             
             vjgrtichqsxl
             fkvlxhjqd
             qhbvjxyl
             
             iwzem
             ziw
             iwz
             zwi
             ziw
             
             dbtymjcu
             ymcbuh
             mreuycb
             copybum
             mcubyv
             
             fegictzvlnxdha
             tachdpvizolk
             lictdvazh
             aodhclztvi
             
             jcpnadfhwgeovbszky
             vpzosfkygcqndhjebwa
             vwkjsnfcbgdphzyeoa
             edpfvgbwczkohjsayn
             fdwaghepjbcksoynzv
             
             zlxqgoiumrakcjyst
             krigqszocyumlatjx
             qakilzgmtoyxjcsrbu
             
             zrviblt
             ltzbvi
             bizvlt
             bvlzuftsi
             vztrilba
             
             lud
             lue
             ul
             
             h
             h
             uh
             h
             
             uv
             q
             
             x
             glbh
             
             kvoencugyfl
             yofgcuvken
             
             txjinyudaqhr
             ienxjuythdqra
             tdiyhxnqjrua
             
             zatkjruqmnxevopigfdlwc
             gfwvqscpjxyzuatekodblnm
             exwvdgybocjaftulqkpmszn
             wscxtofveuzpjdlamgknqb
             
             vof
             fioncw
             uysxefgjlomr
             ofivabc
             nvafoik
             
             loydakqtwgchjm
             yguwltdkmoh
             
             apfvnouydmitbzh
             cztoiunfhdpab
             mdhniogptwufa
             uharxdnoitpfqj
             uydantfhgiop
             
             tforemnhabswydvlqpjcx
             znmxhvfesgorcdwil
             
             bauqdkxjhrmvnszlcwiy
             sywdqnlikmcvbuzjrha
             nlmdsvrijwzahycbquk
             mjswqhcbvyzliukndra
             
             axpmwjsdcub
             ljcfsarmw
             cawmjs
             xjwmcsab
             
             ohavrpzj
             jzampeor
             ejproza
             nkpjorza
             
             jhgdaqpbneoil
             ionpwbahjge
             jneozufshpbgrv
             hnoxgpebj
             hnoptygmbjek
             
             sgpmhdfckaoj
             gmdkhcjpouwa
             crhtpjzbkoadmg
             pmcaghdknoj
             dxgoawcmkhpj
             
             jakoipgcuf
             qpltxbn
             ypq
             mpyzdvr
             
             jmihyklq
             hlzjmkqyi
             qimhlkyj
             wjfdqlkihnymoa
             
             olydjnawrmbufk
             ozuydljmwrnfkb
             djyaokwbfmlnur
             oekynqmwcbsrdfuglj
             kunbyrwodfaljm
             
             ljdgkvry
             xyjrdgplk
             ibjlegkdsn
             
             hzydsqnfj
             qvsdtjflnhyz
             zdnyjsfqh
             dfqznhjsy
             
             oanzwhly
             zoyhna
             nhgzqkwyoa
             cuonyizvbhaepmr
             hzonaslyw
             
             rgcehqlozdsabvp
             hcarqvbo
             hrtcawbvioq
             
             eyqnwcxjla
             nqeljcwykt
             xcqlyejnw
             sqonewdcuijglyz
             wljcnqeyk
             
             gpx
             xp
             xp
             xp
             
             swxyijbnavmglekhuc
             jgbudhtzawekopqlnvmrs
             
             neim
             neim
             nmiec
             eixnm
             enhbmi
             
             kmbepxt
             runcgywfaqzlsvi
             
             zveliykpqndarsuftjbo
             xqihgkmcfopwylavb
             
             ghxcsv
             xshvgc
             gvscxh
             ghvxsc
             
             drlyqcunxwzgoms
             emfabsxcygwdikpnqujo
             uysdxnomwcqg
             
             zmvrealnydqkifu
             rknfzcuvapbxheyqsmg
             
             ompbxenhgvcs
             rwfjiylnkzpeuq
             
             groezxqwidf
             qbzltifrhywvnjs
             
             fsjagxk
             karfs
             silfakwyt
             sakfg
             kmafs
             
             e
             aez
             pae
             eykuv
             
             luhcwj
             iq
             iza
             
             nftsiawryqhecjkgzuxl
             rqtsygnzdufbjiwvhlocaxe
             phsrufmceijyqwtazgnlx
             tygruqxlchjwfseainz
             wxsncygeqihrzfjtlau
             
             bneaimfhlcygdxvkst
             fbvchledknxmgayits
             cnmbfxyhsvtegaikdl
             tilmfbnhvyedakxgjucs
             
             mqcp
             fmgtovedwzq
             qpam
             qnmaxl
             mq
             
             hmzpxtucfoysliqj
             huikytjzlmqcxfps
             zueifxqmjsylhpc
             
             zgduvyrija
             rakgzmjuyxv
             rzvgjuiyad
             
             xzvsbejcya
             xaslcze
             osumxhgrea
             qylasex
             
             rjyxncefiovtmqwhpugz
             ytqbcjzeoifhlkwmru
             sojeityfchaqmurz
             
             milysouzpfjc
             vadgrfkxunbm
             
             qfolardivwmhespxtzjgby
             dfpzlnrskmoebxgqjha
             
             aqpfzbmody
             mwzdqyboapf
             tafoqdmbzyp
             
             mcksuqprlojgynzhfdvwe
             qsmpukofcwxjhzgvlndery
             vkpmnzyqewhurtsgjfcldo
             prfjyelktwnhovucqgmzsd
             vcsmdjzkqgbyonleuhpfwr
             
             k
             kr
             k
             
             cbzktdsxpwlaue
             iycwaklqez
             
             skz
             ksyz
             izsk
             
             h
             h
             h
             h
             
             de
             de
             ed
             de
             de
             
             bwadco
             awtbo
             bwioap
             qbznswyoa
             
             eskapvxrho
             xbahknsvyl
             svhoxka
             ksaphtvex
             
             btyzvfnciklwus
             vimkgfjzbtysncw
             kbxfvtpsczwniy
             fziwkctnhsbyv
             nscftgkbzdwivy
             
             dayrklsxctwheum
             ztoliaksbgdw
             
             fbyp
             pby
             ybp
             
             gpoziqfbaduexlsyhtmnkjwv
             bnhxzldmpateywikosjru
             yndphlzjucowiatekxmbs
             esphdyumjiklwnxzoatb
             smohkpbnlaiewxdujzty
             
             hxv
             vxhr
             xhy
             iuhoeaxl
             dhxj
             
             gyedwfvmlahiqs
             dqwfgmvyiahsel
             awgmevsdlfhyqi
             clwkvdsazuhgyfqixme
             
             vozrdgsb
             bvxdr
             
             crvtd
             rvd
             vrd
             dvr
             
             o
             o
             yrod
             o
             co
             
             geis
             eligs
             segi
             
             ctfdiqwolp
             rqfdliwpc
             lxwdqafcpi
             fwcdriqlp
             
             dzrpwvt
             zvtd
             dztv
             vdfzt
             
             vpmrfhkcsgo
             vomscfpalhkg
             hcfdosgkempv
             
             ykdoewlf
             fdewloyuga
             wyeflovudi
             
             gjbrvulsdxtnz
             whmupycejovifkrdb
             
             f
             f
             jf
             fw
             
             fgaleupzcnkjovwqsx
             lguskvxoejfnwc
             
             py
             pe
             eap
             pe
             wp
             
             yomngtrvlacskfe
             nteloyckfgvsm
             elfgmtvsyconk
             zjcgteumkiflxoyhvndsqp
             
             caqimjtvgdkouplre
             vrdocqjilmpuktgae
             gcaulrmeipkqvdjto
             
             wpjfoqamdkgcveruzlsyhnbt
             vgpfqlrudkhbcjszmeonatwy
             
             no
             n
             icn
             icn
             iny
             
             wf
             fw
             
             nxubqrfzkywg
             spwarfxqv
             mwxrfq
             qewfrtsxv
             rfvxijtwhdcqo
             
             ocptwdlkmurya
             yuzkofdibmtar
             tmkvdoxnyuarq
             
             kavlyos
             oyskvfla
             jskivploaym
             olvyask
             
             fycgdv
             vgidfy
             dvgtzyf
             
             gnplci
             zsxvwjfqbd
             
             nfwzcm
             iwcfnmz
             mnzfjcdw
             wcminfz
             
             ikmlrbopfdtw
             nuqeghadpylzjs
             
             njlbv
             tbuljn
             
             fpnvdorgqzxsjbi
             wryihdaogqkfbjv
             ljfdqcexivrogb
             
             ngzrich
             ihzpklcu
             frxpczhl
             dozwymcevqbsht
             
             afljkmqeci
             yaflxehomcjkzi
             cftkeamilj
             nvijakmclef
             efjcklnmia
             
             felrqahy
             fyelaqhr
             arzhylqef
             afdyhtlqre
             
             kjrpum
             kujmpr
             mkjrup
             umakjrp
             jkpunrm
             
             gthfr
             gtfhr
             frthgv
             tgfhr
             hgftr
             
             p
             tmup
             p
             tp
             zfkip
             
             saqnxpjfuomebhkzdrtc
             uwhesdjtxkzcafpqn
             tdjvafusgheckzxnqp
             sngzjcedxpfhtakuqi
             xnpfhaduzscjetqky
             
             uyba
             ud
             ksu
             
             xclr
             xlcr
             rxcelu
             
             matkfjl
             jftlcke
             tkljef
             
             j
             sb
             p
             
             bozex
             qeonv
             agksmtwcihjfy
             
             pt
             pt
             ztusdnpi
             
             zoixnmev
             giqpnzumxodywveh
             ltivmaocexzn
             mozvkniex
             
             juzlnpekqvogxfism
             ejvcmtr
             vymhjaced
             
             wcruqjlgz
             wzqrjulcg
             zqujgrlwc
             jqgzucrlw
             rjqlwgucz
             
             bz
             z
             z
             z
             
             gdsv
             dfsvg
             ghvd
             vwjgtdc
             
             zbimajtohqr
             rmijqzohabt
             mrztioabqhgj
             
             mdclzgonjvhtrqp
             gvpdmnzlo
             onzgelmpvid
             vunzldgopmf
             
             rwjmlzcbnpyofhusqd
             erzoqkcfmsbhjnwpydul
             mbqwapzhsjluydvfrnco
             lozrnjwbhyqsmcpfdui
             
             aqdyf
             lzcg
             
             v
             vt
             v
             mebcrnx
             
             yvtdplhcbfkjasqguw
             hcbkdpyqfavuslwjtg
             suylhtkpbaqwcjgdfv
             qwvpzkstgjbnchlaudfy
             
             rjxqa
             dxps
             
             ca
             amu
             a
             ca
             
             givk
             uo
             wej
             ou
             
             ke
             e
             eu
             
             wtpikf
             ytifp
             pjedfin
             
             zscflyduhignp
             yres
             xybse
             ysw
             yswv
             
             cpqzwb
             ltzwgbj
             boinwz
             bwoz
             
             u
             u
             
             ozlven
             vezl
             
             jiyksqw
             eonjglysc
             
             ycperjbkoqvswlh
             xlzorbgcjwnesqahki
             
             zcwqxv
             cwvxl
             vwxcks
             lxvcgw
             znxlvgcw
             
             kyqum
             kyqu
             kuqy
             ykuq
             
             floctumsgrpbxkwzin
             uwklcbfmnorsji
             
             jlrhzxdne
             nhexdr
             
             jeyhcdlwikmsgorfazt
             jskralwmtozfchydgei
             lwefmrhagtckjyisoz
             mtlwfechgaojkzysir
             pqlfvwscekioxhmzjtgrnya
             
             obmkdeqsncriuxlwtvaphfzy
             luivhzwqpxodnkytfcmasreb
             efhnutspvqridkxlombyczgawj
             
             qnxafwkejo
             wmebyasu
             laweh
             eiwgbar
             
             bvuzjq
             qjvzbu
             juzqb
             tequjmbzk
             zbquj
             
             iv
             b
             w
             
             kfdtwyhglqasvpj
             qftakvgljspdhmy
             jkfqsphvdlgtya
             
             dotum
             dwmohcu
             tjauoedmx
             
             uofxvehmzc
             mzsufnhodjye
             ftqwpaibrhumlkg
             
             tusahzgfcm
             mtghslwynoacvzu
             uacmgzths
             
             wayjenb
             wneajby
             
             gcdowyeur
             agswcm
             fvgoacyrd
             bnzxcligh
             
             p
             hm
             ba
             a
             
             rspcoxftwlqgjahkunz
             aqcniervgdjpwzfxuoym
             
             edqsljvipbfycraw
             ceiqdwpajvslfr
             itlfxgmhdsajupcwvqr
             pwqblisvfcdarj
             
             colbzjkaqhu
             cfoqwhauskb
             aolpqkchubn
             rioydtgavxcuehbqk
             
             ez
             z
             maz
             a
             slfxnio"""


boardingPasses : List String
boardingPasses =
    [ "BBFFFFBRLL"
    , "BFBBBBFLLL"
    , "FBBBFBFLLR"
    , "BFBBBFBLRR"
    , "FBBFFBFLRR"
    , "FFBFFBFRRR"
    , "FBFBBBBLLL"
    , "BFFBFFFRLR"
    , "BFFBFFFRLL"
    , "BFBBFBFRRL"
    , "FBFFFFBLRR"
    , "BBFFBFBLLR"
    , "BBFBFFBRLR"
    , "BFBFBFFRLR"
    , "FBFFBFBRRL"
    , "BFFFFBFRLR"
    , "FFBBBBBRLR"
    , "BFFFBFBLLR"
    , "FBBBBBBRLL"
    , "FBBFBFBRRL"
    , "FBFBFBFLRL"
    , "FFBFBBFRLL"
    , "BFBFFBFRRL"
    , "FBBBBFBLLR"
    , "FFBBFBFLRR"
    , "BFBFBBFRRL"
    , "FBFFFBBLLR"
    , "FBBFFBFRRR"
    , "FFFBFBBLRL"
    , "FBBBBFBRRL"
    , "BFBFBBFLRL"
    , "BBFFBFBLRL"
    , "BBFFFFFLRL"
    , "BBFBBFFRLR"
    , "FFBFBBBRRL"
    , "FBFFFFFRLR"
    , "FFFBBFFLRR"
    , "BFFFBFFLRL"
    , "BFBFFFBRLR"
    , "BBFBFBFLRR"
    , "FBBBBFFRRR"
    , "FBFFFBFRLL"
    , "FBFFFFFLRL"
    , "BFFFFFBLRR"
    , "FFFBBBFLRL"
    , "FBFBBBFRLL"
    , "FFBFBBBLRR"
    , "FBFFFFFRLL"
    , "FFBFFFFLRR"
    , "BBFBFBBRRL"
    , "FFFBFBBLRR"
    , "BFFBFBBRRR"
    , "FFBBFFBLRL"
    , "BFBBBFFRRL"
    , "FFBBFFFRLL"
    , "FBFFBFBLRR"
    , "FBBFBBBRLL"
    , "FBBFFFBRLR"
    , "FBFFBFFLRL"
    , "FFFBFBBRRR"
    , "BBFFFBBRLL"
    , "BFBFBBBRRR"
    , "BBFFBFFLRR"
    , "FFBFFBBLLL"
    , "FFFBBBFLLL"
    , "FBBFBBBRRL"
    , "BBFBFBFLLR"
    , "BFBFFFFRLL"
    , "BFFBBFFRLR"
    , "BFBBFFFRLR"
    , "BBFFFBBRRL"
    , "BFBFFBFLRR"
    , "FBBFFFBRRR"
    , "FFBFFFBLLR"
    , "BFFFFBBRLR"
    , "BBFFBBFRRR"
    , "BFBBBFBLLL"
    , "FFBBBFBLRR"
    , "FFBFFBFLRL"
    , "FFFBBBBRLR"
    , "BFBFFFBRRR"
    , "BBFFBFFRRL"
    , "BFFBBFFLRR"
    , "FFFBFBBLLL"
    , "FBBBBBFLLL"
    , "BFBFFBFLLR"
    , "BBFBFBBRRR"
    , "FBFBBFBRLR"
    , "FBBFFBFRLL"
    , "BFBBFFBLRL"
    , "BFBBFFFRRL"
    , "FBFFBBFRLR"
    , "FBBFBBBLRL"
    , "FBFFBFFLLR"
    , "FFFBBFBRLR"
    , "FBBFFBBLLR"
    , "FFFBBBFRRL"
    , "BBFBBFFRRL"
    , "FFBBBFFRLR"
    , "BFFFFBBRRR"
    , "FBBBBBFRLR"
    , "BBFBFFBRRR"
    , "BFFBFBFRLL"
    , "BFBFFFFLRL"
    , "FBBBFFBRRR"
    , "FBBFBBFLLL"
    , "BFFFFBFLLR"
    , "BBFFFFBLLR"
    , "FFBFBFFLRR"
    , "FBBBFBBRRL"
    , "BFFFBBFLRL"
    , "FBFFFBFLLL"
    , "BBFFFFFRLR"
    , "FFFBBBFRLL"
    , "FFBBBFBRLL"
    , "BFFBFFBRLR"
    , "BBFFBBFLRR"
    , "FBBBBFBLRR"
    , "BFFBFFBLRL"
    , "FFBFFFFRLR"
    , "FBBBBBBRRL"
    , "FBBFFFBLLR"
    , "FBFFFFFLLR"
    , "FBBFBBFRLL"
    , "BFFBFFFRRL"
    , "FBBFFBFLLR"
    , "FFBBFFBLLR"
    , "FBBBFBBRLR"
    , "BFFBBBFLLR"
    , "FFBBFBFRRR"
    , "FFFBFBBRLL"
    , "FBFFFBBRRL"
    , "BFFFBBBLRL"
    , "BBFFBBBLLL"
    , "FBFBBFBLRL"
    , "BBFFFBBLRL"
    , "FBBBBFBLRL"
    , "BBFFBBFLLL"
    , "FBFBBFFRRR"
    , "BFBBFBFLRL"
    , "FBFFBBFLRL"
    , "BFBFBFBLRL"
    , "BFBBFBBLRL"
    , "FFFBBFBLLR"
    , "FFFBFBFRRL"
    , "FBBBFBFRRR"
    , "FBBBFFBLLR"
    , "BFFFBBFLRR"
    , "BFFFBFFLRR"
    , "BBFFFBFRRR"
    , "FFFBBFBLRR"
    , "BFFFFFFRRL"
    , "FBBFFFFLLR"
    , "BBFBFFFRRR"
    , "FBBBFFFRRR"
    , "BFBFFFFRLR"
    , "BFBBFFFRLL"
    , "FFBBBFBLLR"
    , "BFFBBBFLLL"
    , "FBFFFBFRRL"
    , "FFBFFFFRRR"
    , "FFBBBBFRRL"
    , "FFBFFFBLRR"
    , "FBBBBFBRRR"
    , "BBFFBFFLLL"
    , "FBBBBFFLLR"
    , "FBFFBBFLLL"
    , "BFBBBFBRLL"
    , "FBBFFFFRLL"
    , "FBBFBFBRLR"
    , "BFFBBFBLRR"
    , "FFBFBFBRLL"
    , "BBFFBBFRLL"
    , "FFBFBBFLLL"
    , "BFFBBFBLLL"
    , "FBFFFFFRRL"
    , "FBFFBFBLRL"
    , "FFBFFBFRLL"
    , "BFBBBBBRRR"
    , "FBFFBFBLLR"
    , "FFBFFFBLRL"
    , "FFBFFBBLRR"
    , "BFBFFBBRRL"
    , "FFBFBFBRLR"
    , "FFBFBFFLRL"
    , "BBFBBFFLRL"
    , "FFBFFBFLLR"
    , "FFFBBBBLRR"
    , "BFFBFBBRRL"
    , "FFBBFBBRLR"
    , "BFFBFBFLLR"
    , "FFBBFBBRRR"
    , "BBFFBBBRRR"
    , "BFFFBFFLLR"
    , "BFBBBFFRRR"
    , "BFBBFBBLLL"
    , "FFBBFBBLLL"
    , "FBFBFBBLLR"
    , "FFBBBFFLRR"
    , "FFBFFBFLLL"
    , "BFFBFFBLLL"
    , "FBFBBBFLLL"
    , "BBFBFBBRLL"
    , "FBFFBFBRRR"
    , "BBFBFFFRLL"
    , "BBFBFFFRRL"
    , "BFFFFBBLRL"
    , "BFBFFFFRRL"
    , "FFBFFBFRRL"
    , "FBBFBBFLRR"
    , "BFFFBBBRRL"
    , "FFBFFFBLLL"
    , "FFBBBBBLLR"
    , "BFBFBFBLRR"
    , "FFBBFFFLRL"
    , "FBBBBBBRRR"
    , "FBFBFFBLLL"
    , "FBFFBBBRRL"
    , "BFFBFFFRRR"
    , "BFBBFFBRRR"
    , "BBFBBFFLRR"
    , "BBFBFFBRRL"
    , "BBFFBBBLLR"
    , "FBFFFFBRLR"
    , "BBFFFFFRRR"
    , "BFBFFBFRLL"
    , "FBBBFBBRLL"
    , "FFBBFBFRLR"
    , "BFBFBFBRLR"
    , "FFBBBFFLLR"
    , "FBFFFFFLRR"
    , "FBFFBFFRLR"
    , "BFBBBBFRLR"
    , "FBFBBFBLRR"
    , "FBBBBFBRLR"
    , "BFBFFBBRLL"
    , "FFBBFBFLLL"
    , "FFBFBFBLLL"
    , "FFBFBFBRRR"
    , "BFBFBFBLLR"
    , "BFBBBBBRRL"
    , "FBBBBBFRRR"
    , "BBFBFFBLRL"
    , "FBBBBFFRLR"
    , "BBFFFFFLLR"
    , "FBBFFBBLRR"
    , "FBFFFFBRRR"
    , "BFFFBBFRLL"
    , "FBFBFFBLRR"
    , "BFBBFBBRRL"
    , "BFFFFBFRRL"
    , "FFBFFFBRRR"
    , "FFBFBBBRLL"
    , "BBFFFFFRRL"
    , "BFBBFBBLRR"
    , "FBBFBFFRRR"
    , "BFFBFFBLRR"
    , "BFFFBBFLLL"
    , "BFBFFFBRLL"
    , "BBFBBFBLLL"
    , "BFBFBFFRLL"
    , "FFFBBBFLLR"
    , "FBBBFFFRLL"
    , "BFBFFBFRRR"
    , "FFBBFFFRRR"
    , "BBFFFBBRRR"
    , "BFFFFBFLRR"
    , "BFFFFFFRRR"
    , "BBFFBFBLRR"
    , "FBBBBBBRLR"
    , "BBFFBFFLLR"
    , "BFFBBBBLLR"
    , "FBBBBFFLRR"
    , "FFBBBFFRRL"
    , "FBFBBFFLLL"
    , "BBFFBBBRLL"
    , "FBFFBFBLLL"
    , "BFFBFBBRLR"
    , "FBBFFFBLRL"
    , "FFBFBFFLLL"
    , "FBBBFBFLRL"
    , "FFFBBFFLRL"
    , "FBBBBFFRRL"
    , "BFBFBBBRRL"
    , "BFFFBBBLLR"
    , "FBFBFBBLRL"
    , "BFBBFFBLRR"
    , "BBFBFFFLRR"
    , "FBFFBBBLRR"
    , "FFBFFBBRLL"
    , "BFBFFFFLRR"
    , "BBFBFFBRLL"
    , "FBBBFBFRLL"
    , "BFBBBFFLRL"
    , "BFFBBBBRRL"
    , "BFFBBBBLRR"
    , "FFBBFBFRLL"
    , "FBFBFFFLLL"
    , "BFFFFFFLRL"
    , "BFBBBFBRRL"
    , "FFFBBBBRRL"
    , "FBFFFFBLRL"
    , "FBBBBBFRLL"
    , "FFBBFFFLRR"
    , "FBBFBBFLLR"
    , "BFBFBBFRLL"
    , "BFBFFFBLLR"
    , "BFBFBBBLRL"
    , "FFBFFFBRLR"
    , "BFFBBBFRRL"
    , "BFBBBBBLRR"
    , "FBFFFBBRLL"
    , "FBFBFBBRRR"
    , "FFFBFBBRLR"
    , "BFBFBBFLRR"
    , "FBFBFBBLLL"
    , "FFBBFFBRLL"
    , "FBBFBFBRRR"
    , "BFFFFFBRRL"
    , "FBBBFBBLLL"
    , "BBFBFFBLLL"
    , "FFBFBFBLLR"
    , "FFBBBFBRRL"
    , "FBFBFBFLLL"
    , "BFBFBBFRLR"
    , "FBBFBFFRLR"
    , "FFBFFBBRRR"
    , "BFFBFFBLLR"
    , "FBFFFBFLRL"
    , "FBFFFFFRRR"
    , "FFBBFBBRLL"
    , "FBFFBFFRLL"
    , "BBFFFBFLRR"
    , "BFBBBFFRLL"
    , "FBFBBBBLRL"
    , "FFFBBBBLLL"
    , "BBFFFFBRRR"
    , "FBBBBBBLLL"
    , "FFBFBFBLRL"
    , "BFFBFFBRRL"
    , "FFBBFBBLRR"
    , "BFBFFBFLLL"
    , "FBBBBFFRLL"
    , "FFFBBFBRLL"
    , "BFFFBFBLLL"
    , "BBFBBFBRLL"
    , "FFBFFBBLLR"
    , "BBFFFFBLRL"
    , "BBFBBBFLLR"
    , "BFBBFFBRLR"
    , "BFFFFBFLLL"
    , "BBFFBBFLLR"
    , "BBFBFFFLLL"
    , "FBBBFFFLLL"
    , "BFBBFBBRRR"
    , "FFBBBBFRRR"
    , "BBFBBFBRLR"
    , "BFBBFFFLLL"
    , "FFBFFFFLLR"
    , "FBFBFFBLLR"
    , "FBBBFFFLLR"
    , "BFBBBBFLRR"
    , "FBBFBFFLRR"
    , "FBFBBFBRRL"
    , "BFFBFFFLLL"
    , "FBBFBBFRRR"
    , "FBFFBBBRLL"
    , "FBFBBBBRRL"
    , "FFFBBBFRRR"
    , "FBFBFFBRRL"
    , "FFBBFBFLLR"
    , "BFBFBBBLLL"
    , "FFBFFBFLRR"
    , "BFBFBBFRRR"
    , "FBBBBBBLLR"
    , "BFFBFBFRRR"
    , "FBFFFBFRRR"
    , "BBFFFBFLLL"
    , "FBBFFBBRRR"
    , "BFBFBFBLLL"
    , "BBFFBBBLRR"
    , "FFBFFFFRRL"
    , "FFBFBBFLLR"
    , "FFFBBBFRLR"
    , "FFFBBFBLLL"
    , "FBFBBFFLLR"
    , "FBFBFBFRRR"
    , "BFBBFFFRRR"
    , "BFBFFBBRRR"
    , "FBFBBFFRLR"
    , "FFBFBBFRLR"
    , "BFFBBFFRRR"
    , "BFBFBBFLLL"
    , "FFFBBFBRRR"
    , "BFFBBFFRLL"
    , "FFBFFFFLLL"
    , "FFBBBFFRLL"
    , "BBFBBFBRRL"
    , "BBFBFFBLRR"
    , "FFBFFBBRRL"
    , "FBBFBBFRRL"
    , "BBFFFFBLLL"
    , "BFBBFFBRLL"
    , "FFBFBFFRLL"
    , "BFBBFFFLLR"
    , "FBBFFBBRLR"
    , "BFBFFBFLRL"
    , "BFBBFBBRLL"
    , "FFBBBFFRRR"
    , "FBFBBFFLRL"
    , "BFBBFBFRLR"
    , "FFBBFFBRRL"
    , "FBFFBBFLLR"
    , "FBFBBBFLLR"
    , "BFFFBBFRRL"
    , "FFFBBBBRRR"
    , "BFFFBBBRRR"
    , "FBBFBFFRRL"
    , "BBFFFFBRRL"
    , "BBFFFBBLLR"
    , "BFBBFBFRRR"
    , "BFFFFBBRRL"
    , "FBBFBBFLRL"
    , "FBBFBBBRLR"
    , "FBFBFFFLRL"
    , "BFFBFBFRRL"
    , "FBFBBBFLRL"
    , "BFBBBBBLRL"
    , "FFBFFFBRLL"
    , "BFFBBFBLRL"
    , "FBFBFBFRLR"
    , "BFFBBFFLLL"
    , "BFBBBBBLLL"
    , "FFBFBBFLRR"
    , "BBFBFBFRRR"
    , "FFFBBFFRRR"
    , "BFFFBFFRRL"
    , "BBFBFFFRLR"
    , "BBFBFFFLLR"
    , "BFFFFFFLRR"
    , "FBBFBBFRLR"
    , "FFBBBFFLRL"
    , "FBFBFFFRLR"
    , "FFBFBFFLLR"
    , "BFBFFBBLRR"
    , "BFFBBBFRLL"
    , "FBBFFBBLRL"
    , "BFBBFFBLLR"
    , "FBFFBFFRRR"
    , "BFFBBBFRLR"
    , "BFBFBBBLLR"
    , "BFFFFBBLLR"
    , "BFFBFBFLLL"
    , "BFBBFFFLRR"
    , "BFFFFFFRLR"
    , "BBFFBFFLRL"
    , "BFBFBFFLLR"
    , "BBFFFFFLRR"
    , "FFBFBBFLRL"
    , "FBFBFFBRRR"
    , "FFBBBBFRLR"
    , "BBFBBBFLLL"
    , "BFFFFBBRLL"
    , "FBFBBBFRRR"
    , "BFFBFBFRLR"
    , "FFFBBFFLLR"
    , "FBBFBFFLLL"
    , "FFFBFBBRRL"
    , "BFBBBBFLRL"
    , "FFBFFBFRLR"
    , "FBFFBFBRLL"
    , "FBBBFBFLRR"
    , "BBFFBBFRLR"
    , "FBBBBBFLRR"
    , "FBFFFFBRLL"
    , "BFFBFFFLRL"
    , "BFBFFFFLLL"
    , "BBFFBFBRLR"
    , "BFBBBFBLLR"
    , "FBBFFBBRLL"
    , "FBFBFBFRLL"
    , "BBFBFBBLRL"
    , "BFFBFBBLRL"
    , "FFBBBFBLRL"
    , "FFBBFBBLLR"
    , "BFFBFBFLRR"
    , "FBBBFBFRRL"
    , "BFFBBBFLRL"
    , "BFBBFBBLLR"
    , "BFBFFFBLRR"
    , "FBFFBBBLRL"
    , "FBFFBFFLLL"
    , "BBFFBFFRRR"
    , "BFFBFBBRLL"
    , "BFFFBFFRRR"
    , "BFFBBBBLRL"
    , "FBBFFBFRLR"
    , "FBFFBFFRRL"
    , "FBFFFBBRRR"
    , "BBFFFFBLRR"
    , "FBBBFFFLRL"
    , "FFBBBBFLRL"
    , "BFFFBFFLLL"
    , "BFBBBFFRLR"
    , "FFBFBBFRRL"
    , "FBFBBBFLRR"
    , "FFFBBBFLRR"
    , "BFFFBFBRLR"
    , "FBBBFBBLRR"
    , "FFBBBFFLLL"
    , "FFFBFBFRLR"
    , "FBBFFFBRLL"
    , "FBBFBBBRRR"
    , "BFBFFFFRRR"
    , "BFBBBFBLRL"
    , "BBFFFBBLRR"
    , "BFBFFBBLLR"
    , "BFBBFBFLLR"
    , "BBFFBBBRRL"
    , "FBBFFFFLLL"
    , "BBFBFFBLLR"
    , "BFBBBBBLLR"
    , "FFBFFBBRLR"
    , "FFBBBFBRLR"
    , "FBFBBBBLRR"
    , "FBBFBFBLRR"
    , "BBFFBBFRRL"
    , "BBFFBFFRLL"
    , "FBBBFFBLRR"
    , "BFFFBFBRRR"
    , "BFFBFFFLRR"
    , "FFBBFBBRRL"
    , "FBFBBBBRRR"
    , "BBFBBFFLLL"
    , "FBFFBBBLLL"
    , "FBBFFFBLRR"
    , "BFBBFFBLLL"
    , "FBFFFFBLLL"
    , "BFBFBBBLRR"
    , "BFFFFFBLLR"
    , "BFFBBFBLLR"
    , "FBFFBFFLRR"
    , "FBBFBBBLLR"
    , "FFBBBBBRLL"
    , "BFFFBBFLLR"
    , "FFBFBBBLRL"
    , "FBFBBBFRRL"
    , "BFFFFBFLRL"
    , "FBBFFBFRRL"
    , "FFFBBFBRRL"
    , "FFBBBBBRRL"
    , "BBFFFBFLRL"
    , "FBBFFFFLRR"
    , "BFBBBBFRLL"
    , "BFFBFFBRRR"
    , "FFBBFFFLLL"
    , "BFFBBBBRLR"
    , "BFBBFFFLRL"
    , "BFBFFBBLRL"
    , "BBFFFBFRLR"
    , "FBFBFBFLLR"
    , "BBFFFBBRLR"
    , "FBBBFFBLLL"
    , "FBBBFFFRRL"
    , "BFFFFFFRLL"
    , "FFBFBFFRRR"
    , "BFFFBFBRLL"
    , "FBBBFFFRLR"
    , "BFBBBFFLLL"
    , "FBBFBFBLLL"
    , "FFBBFFFLLR"
    , "BFFFBBFRLR"
    , "BBFFFBFRLL"
    , "FBBBBBBLRL"
    , "BFBFBFBRLL"
    , "FBBBBBFRRL"
    , "BBFBFFFLRL"
    , "BFBBBBFRRR"
    , "BFBFFFBLRL"
    , "FFBFBFBRRL"
    , "BFBFBFBRRR"
    , "FFBFFFFRLL"
    , "BBFBBFFLLR"
    , "FFBFBBBLLR"
    , "BBFBBBFLRL"
    , "FBFBBBBRLL"
    , "FFBBBBFLRR"
    , "FFBFFBBLRL"
    , "BBFFBBBRLR"
    , "BFBBFBFLLL"
    , "FBFBFFBLRL"
    , "BFFFFFBLLL"
    , "FBFFBFBRLR"
    , "FBBBBFBLLL"
    , "FBBFFBFLRL"
    , "BFFFBBBLLL"
    , "FBBFBFFLRL"
    , "FFFBBFFLLL"
    , "BFBFBFFRRL"
    , "BFFFFFBRLL"
    , "BFFBFBFLRL"
    , "BFFBBFBRRL"
    , "BFBBFFBRRL"
    , "FFFBBBBLRL"
    , "FFBFBBBRRR"
    , "FBFBBFBRRR"
    , "FFBBBBFLLL"
    , "BBFFBFBRLL"
    , "FBFFBBFRLL"
    , "FBFBFFFLLR"
    , "BFFFFBFRRR"
    , "FFBBBFBLLL"
    , "FBBBFFBLRL"
    , "BFFFBBBLRR"
    , "FFFBFBFRRR"
    , "FBFFFBBRLR"
    , "FBFBFFFLRR"
    , "FBBBFBBLRL"
    , "FBBBFBBRRR"
    , "BBFBFBBLRR"
    , "BFFBBBFLRR"
    , "BFFFFFFLLR"
    , "BBFBFBFRLL"
    , "BFFBFBBLLL"
    , "FFBBBBFLLR"
    , "BFFFFBBLRR"
    , "FBFBFFFRLL"
    , "BFBFFFBRRL"
    , "BBFBFBBLLR"
    , "FFFBFBBLLR"
    , "FBFFBBBRRR"
    , "FBBFBFFLLR"
    , "FBFBFBBRLL"
    , "BFFBBBBRRR"
    , "BFFBFFFLLR"
    , "BFBFBFBRRL"
    , "BFBBBBFLLR"
    , "FBBFBFBLLR"
    , "BFFFFFBRLR"
    , "FBFFFBBLLL"
    , "BBFFFFFLLL"
    , "FFBBBBBLRR"
    , "FFBBFBBLRL"
    , "BBFFFFFRLL"
    , "FBFBBFFRRL"
    , "FFBFBBBLLL"
    , "BFFFBBBRLR"
    , "FBBBFBFRLR"
    , "FBBFFFFLRL"
    , "FFBBFFBRRR"
    , "FBFBFBFLRR"
    , "BFBFBBBRLL"
    , "BFBFBFFLLL"
    , "FBFFBBBLLR"
    , "BFFFBFBLRL"
    , "FBBFFFFRRR"
    , "FBBBBBFLLR"
    , "BFFFFBBLLL"
    , "FBBFBFBLRL"
    , "BFFFBBFRRR"
    , "BBFFBFBRRR"
    , "BBFFBFBRRL"
    , "FFFBBBBRLL"
    , "BBFFBBBLRL"
    , "BFBBFBBRLR"
    , "BBFBBFBLLR"
    , "BFBBFBFLRR"
    , "FBFFFFBRRL"
    , "BFFBFBBLRR"
    , "BBFFBFBLLL"
    , "FBBBFBBLLR"
    , "FBFBBFBLLL"
    , "BBFBFBFRLR"
    , "BFFBBBBLLL"
    , "BFFBFFBRLL"
    , "BBFBBFBLRR"
    , "FBFFBBFLRR"
    , "BBFFBFFRLR"
    , "BFFFBFFRLR"
    , "FBFBBFFRLL"
    , "BFFBBBFRRR"
    , "FBBBFBFLLL"
    , "BBFBBBFLRR"
    , "FBBFFBFLLL"
    , "BBFBBFBLRL"
    , "FBFFFBBLRL"
    , "FBFBBFBRLL"
    , "BFBBBBFRRL"
    , "BFFFBFFRLL"
    , "BFBFBBBRLR"
    , "FFBFFFFLRL"
    , "FFBFFFBRRL"
    , "FBFFBBFRRR"
    , "BBFFFFBRLR"
    , "BFFFBFBLRR"
    , "BBFFBBFLRL"
    , "FFBBFFFRRL"
    , "FBFBFBBRLR"
    , "FBBFBFFRLL"
    , "FBBBFFBRLL"
    , "FBBFBBBLLL"
    , "FBBFFBBRRL"
    , "BFBFBBFLLR"
    , "FFBBFFBLRR"
    , "FFBBBBBLLL"
    , "BBFFFBFLLR"
    , "FBFBBBBRLR"
    , "BFBFBFFLRL"
    , "FFBBBBBRRR"
    , "BFBFFBFRLR"
    , "FBBBBFBRLL"
    , "BFBBBBBRLL"
    , "BFBBBBBRLR"
    , "FBBBBFFLLL"
    , "FBBFFFBLLL"
    , "BBFBFBFLLL"
    , "BFFFFFBLRL"
    , "FBBFBFBRLL"
    , "BBFBFBBRLR"
    , "BFFBFBBLLR"
    , "FFBBFBFLRL"
    , "FBFBBBFRLR"
    , "FBBBFFBRLR"
    , "FBFFFBFLRR"
    , "BFBFBFFLRR"
    , "BFFFFFBRRR"
    , "BFFBBFBRLL"
    , "FBFBFBFRRL"
    , "BBFBBFFRRR"
    , "FBBFBBBLRR"
    , "FBFFBBBRLR"
    , "BBFBFBBLLL"
    , "FFBFBBFRRR"
    , "FBFBBFBLLR"
    , "BFBFBFFRRR"
    , "BBFBBFBRRR"
    , "FFBFBBBRLR"
    , "FBFBFBBRRL"
    , "BFBFFFBLLL"
    , "FBFBFFBRLL"
    , "FBFFFBFRLR"
    , "FBFFFBBLRR"
    , "FBBFFFFRLR"
    , "BFBBFBFRLL"
    , "FBFBFBBLRR"
    , "FFBBBFBRRR"
    , "FBBFFFFRRL"
    , "FBFBBFFLRR"
    , "FBBBFFBRRL"
    , "FBFFFBFLLR"
    , "FFBFBFFRLR"
    , "FBBFFBBLLL"
    , "FFFBBFFRLR"
    , "BFFFFFFLLL"
    , "FFFBBBBLLR"
    , "FFBFBFFRRL"
    , "BBFBBFFRLL"
    , "FFFBBFFRLL"
    , "BBFFFBFRRL"
    , "FFBBFFBLLL"
    , "FBFFBBFRRL"
    , "BFBBBFBRLR"
    , "BFBFFBBRLR"
    , "FBFBFFFRRR"
    , "BFBBBFFLLR"
    , "FBFBFFFRRL"
    , "BFFBBFFLLR"
    , "FBFBBBBLLR"
    , "FFBBFFBRLR"
    , "FBFFFFFLLL"
    , "BBFBFBFRRL"
    , "FBBBBFFLRL"
    , "BFBBBFBRRR"
    , "BFFBBFFLRL"
    , "BFFBBFFRRL"
    , "BBFBFBFLRL"
    , "FBBFFFBRRL"
    , "BFFFBFBRRL"
    , "FBFFFFBLLR"
    , "FFBBFBFRRL"
    , "BFFBBBBRLL"
    , "BFBFFFFLLR"
    , "FFBBFFFRLR"
    , "BFBFFBBLLL"
    , "BFFBBFBRRR"
    , "BFFFBBBRLL"
    , "FFFBBFBLRL"
    , "FFBFBFBLRR"
    , "FFFBBFFRRL"
    , "FFBBBBBLRL"
    , "BFBBBFFLRR"
    , "FBBBBBFLRL"
    , "FBBBFFFLRR"
    , "BFFBBFBRLR"
    , "BBFFFBBLLL"
    , "FBBBBBBLRR"
    , "FBFBFFBRLR"
    , "FFBBBBFRLL"
    ]


passports =
    """hgt:176cm
               iyr:2013
               hcl:#fffffd ecl:amb
               byr:2000
               eyr:2034
               cid:89 pid:934693255
               
               hcl:#b5c3db ecl:grn hgt:155cm pid:#baec97 iyr:2017
               byr:1939
               eyr:2020
               
               pid:526669252 eyr:1972
               hgt:152cm ecl:dne byr:1960 hcl:z iyr:2023
               
               eyr:2028 hcl:#c0946f hgt:73in byr:1926 ecl:#473aaf iyr:2016 pid:565318180
               
               pid:472686027 ecl:oth iyr:2019
               cid:277 byr:1940
               eyr:2030 hgt:170cm
               hcl:#62e117
               
               ecl:oth
               iyr:2017
               pid:938461813 hcl:#733820 byr:1959 hgt:159cm eyr:2022
               
               iyr:2011 eyr:2021 hcl:z
               ecl:hzl byr:2002 pid:17324328 cid:140
               hgt:186cm
               
               byr:2022 pid:3164234967 iyr:1984
               hgt:76cm hcl:6b3837
               ecl:#fa362b
               eyr:2037
               
               hcl:z eyr:1945
               pid:9247286687 hgt:75cm
               iyr:1934 cid:326 ecl:zzz
               byr:2005
               
               byr:2005
               ecl:lzr
               eyr:2021 pid:152cm
               cid:254 iyr:2020 hcl:z hgt:157cm
               
               iyr:2020 eyr:2020 hcl:#18171d ecl:gry pid:914128753 hgt:168cm
               byr:2002
               
               hcl:#7d3b0c hgt:160cm eyr:2020 iyr:2015
               pid:054067854 ecl:brn byr:2023
               
               hcl:#cfa07d hgt:157cm
               byr:1994 eyr:2027 pid:344443856
               iyr:2016
               
               pid:762423097
               iyr:2014 hcl:#a97842 ecl:brn hgt:180cm byr:1927 eyr:2021
               
               pid:6645616064 hcl:#ceb3a1 byr:2030
               eyr:2032 hgt:158cm iyr:2012
               ecl:#e9619e
               
               eyr:2022
               ecl:brn
               byr:1986
               hgt:161cm cid:99 pid:288726584 hcl:#6b5442 iyr:2019
               
               cid:75
               pid:117771843
               hgt:184cm byr:1937 ecl:brn
               hcl:#d88fd9
               iyr:2015 eyr:2027
               
               iyr:2016 hcl:#fffffd hgt:170cm eyr:2022 ecl:oth pid:629454113
               byr:1952
               
               hcl:#c0946f iyr:2018 hgt:189cm
               byr:1971 ecl:oth eyr:2029
               pid:800207810
               
               eyr:2022 hcl:#7d3b0c pid:969986413
               byr:1978 iyr:2020 hgt:186cm
               ecl:gry
               
               hgt:171cm byr:1949 hcl:#341e13
               ecl:amb eyr:2030 pid:359107274 iyr:2013
               
               pid:839751525 eyr:2024 byr:1921
               iyr:2012 ecl:amb hcl:#b0ed6f hgt:154cm
               
               pid:32592758
               byr:2009
               hgt:107 iyr:2019 hcl:#866857
               eyr:2036 ecl:amb
               
               eyr:2040 hcl:#733820 cid:199
               byr:2027
               pid:7791792988 ecl:blu iyr:2026
               hgt:63cm
               
               iyr:2011 cid:119 pid:344693475
               ecl:grn hgt:160cm eyr:2029 hcl:#346973 byr:1996
               
               hgt:161in byr:2025 cid:167 iyr:2024 eyr:2040 pid:034804648
               hcl:#efcc98 ecl:oth
               
               ecl:#ba14f0 iyr:1935
               hgt:60cm
               byr:2003 eyr:1987
               hcl:8e509b pid:161cm
               
               iyr:2018 pid:620508652 ecl:amb eyr:2023 hgt:183cm hcl:#a97842
               byr:1967 cid:117
               
               eyr:2022 ecl:amb
               pid:476049089 iyr:2012
               hgt:165cm
               byr:1955 hcl:#602927
               
               byr:2014 hcl:z iyr:2029 cid:279 pid:28914607 hgt:75cm ecl:xry
               
               hgt:156cm eyr:2023 iyr:2011 ecl:oth hcl:#7d3b0c pid:561313217 byr:1952
               
               iyr:2011 byr:1935
               hcl:#cfa07d ecl:oth pid:830614209
               eyr:2028 hgt:173cm
               
               iyr:2012 cid:210 eyr:2022
               pid:652810130 hcl:#18171d ecl:grn byr:1960 hgt:152cm
               
               eyr:2026 pid:815848563 hgt:75in iyr:2019 ecl:gry byr:1947
               hcl:#cfa07d
               
               cid:181 iyr:2012
               eyr:2024 byr:1934 hcl:#c0946f
               hgt:165cm ecl:oth pid:232944581
               
               cid:135 iyr:2020
               byr:1971 hcl:#733820 pid:531877857 hgt:179cm eyr:2027 ecl:amb
               
               byr:1987 hcl:936807 eyr:2032 ecl:#4bec4a pid:605628619 cid:180 hgt:150in
               iyr:2015
               
               hcl:b62ef0 ecl:#092141
               pid:876635399 byr:1944 hgt:158cm iyr:2017 eyr:1924
               
               iyr:2016 pid:7039815301 byr:2014 hgt:150 eyr:2032 ecl:blu hcl:z
               
               byr:1979 eyr:2030 iyr:1978 hgt:63 pid:1554613758 hcl:z ecl:amb
               
               hgt:70cm hcl:e45897 iyr:2020 eyr:1977 ecl:dne pid:2878189427 byr:1973
               
               iyr:2003
               hcl:#cfa07d
               pid:260517078
               byr:2030 hgt:175cm eyr:2020
               ecl:brn
               
               pid:460604681 eyr:2022
               cid:138 iyr:2016 hgt:163cm
               byr:1922
               hcl:#ceb3a1 ecl:oth
               
               hgt:167cm byr:2009 eyr:1975 cid:295 pid:174cm iyr:2029
               hcl:z
               
               hgt:67in ecl:grn
               eyr:2023
               cid:122 pid:281246917 byr:1990 iyr:2011 hcl:#866857
               
               ecl:#ed7ddc byr:1922 cid:234 hcl:e61b1e iyr:1932 eyr:1996 pid:31344005 hgt:62cm
               
               byr:1949
               cid:275 iyr:2017 ecl:grn
               hgt:164cm eyr:2027 hcl:#18171d
               pid:751342937
               
               ecl:blu hgt:162cm
               pid:432600613 byr:1923 eyr:2029 iyr:2011 hcl:#623a2f cid:315
               
               iyr:2020
               hcl:#b2bb11 pid:055891584 ecl:grn
               hgt:67in
               eyr:2029 byr:1937
               
               iyr:2012
               hcl:#a97842 pid:325640714 ecl:blu hgt:185cm eyr:2024 byr:1971
               
               hcl:#b6652a pid:485327267
               ecl:brn hgt:155cm eyr:2028
               iyr:2019
               
               pid:902164867 hgt:77 cid:283 eyr:2027
               iyr:2020 ecl:hzl byr:1935 hcl:#efcc98
               
               ecl:grn
               hcl:#ceb3a1 byr:1977 hgt:165cm
               pid:850700221 eyr:2030
               iyr:2012
               
               byr:1989 ecl:brn eyr:2026 pid:919138357 iyr:2016
               hcl:#623a2f cid:319 hgt:161cm
               
               iyr:2017
               byr:1973 pid:293382118 hcl:#341e13 cid:143 ecl:hzl
               hgt:166cm eyr:2022
               
               pid:517102798
               hcl:f9d9dd
               eyr:1933 iyr:2019 hgt:164cm
               byr:2017 ecl:utc
               
               eyr:2023 pid:757868802 hcl:#18171d cid:244
               hgt:156cm
               ecl:blu iyr:2015 byr:1926
               
               eyr:2022
               iyr:2020
               hgt:158cm ecl:grn
               byr:1988
               pid:979194751 hcl:#888785
               
               eyr:2039
               pid:3867868142 byr:1936 ecl:dne iyr:2022 hcl:4b43b8
               hgt:115 cid:241
               
               iyr:2015 eyr:2026
               hcl:#ceb3a1 pid:539099924
               cid:234
               ecl:brn
               byr:1920 hgt:163cm
               
               cid:259 iyr:2020
               pid:949453818 eyr:2022 hgt:181cm
               byr:1997 ecl:blu hcl:#18171d
               
               byr:2016
               iyr:2012
               ecl:utc
               hgt:68in eyr:1993
               pid:1542134802 hcl:486699
               cid:239
               
               iyr:2018
               hgt:154cm ecl:brn byr:1970
               eyr:2021 pid:581775861 hcl:#888785
               
               iyr:2012
               eyr:2027 hgt:67cm hcl:#efcc98 ecl:zzz pid:312104916 byr:2020
               
               hcl:#b6652a ecl:hzl eyr:2023 iyr:2012 pid:513268492
               hgt:159cm
               
               hgt:162in hcl:z
               byr:2029
               eyr:2023 ecl:#e2e7ab iyr:2016 pid:65979982
               
               cid:84 hgt:71in ecl:blu pid:982719716
               eyr:2020 iyr:2014
               
               eyr:2028 hgt:181cm
               ecl:hzl pid:255796693 hcl:#341e13 byr:1994 iyr:2011 cid:218
               
               ecl:blu
               byr:2029 iyr:2017 pid:468504566 eyr:2020 hcl:z hgt:163cm
               
               hgt:158cm
               eyr:2025 ecl:hzl cid:295 pid:601339484
               hcl:#7d3b0c byr:1991 iyr:2013
               
               eyr:2028
               iyr:2018 pid:2236240873
               hgt:172cm
               ecl:#0e337e hcl:#b6652a cid:108 byr:1930
               
               ecl:gry hcl:#888785
               eyr:2020 pid:442479017 iyr:2016
               
               iyr:2014 ecl:grn
               cid:313 eyr:2023
               hgt:183cm
               byr:1976
               pid:499580308 hcl:#53efe6
               
               eyr:2034
               cid:235 hcl:8f3cf5
               byr:2027
               hgt:161in pid:3259965094 ecl:xry iyr:2026
               
               eyr:1978 byr:1925 iyr:2018 hgt:170cm ecl:#0c94e8
               pid:562699017 hcl:#816949
               
               eyr:2023 hcl:#866857 hgt:179cm
               pid:785862442 iyr:2014 cid:165 ecl:amb byr:1939
               
               hgt:187cm
               pid:64469711 ecl:gry eyr:2023 cid:225 hcl:#341e13 iyr:2011 byr:1958
               
               hgt:162cm byr:2028 ecl:#37e345
               eyr:2037 hcl:19fb3d
               iyr:2021
               pid:#87921a
               
               eyr:2027 hcl:#18171d
               byr:2002 ecl:gry iyr:2014
               pid:561506850 hgt:177cm
               
               hgt:64cm pid:#a92686
               eyr:2029 cid:122
               byr:2026
               iyr:2017 hcl:z ecl:grn
               
               eyr:2028 byr:2007 hgt:155cm ecl:#86fa1b hcl:#733820 pid:562889497
               iyr:2019
               
               pid:880698787
               byr:1992
               hcl:#7d3b0c hgt:163cm ecl:hzl
               iyr:2011 eyr:2021
               
               eyr:2020 byr:1994 iyr:2011 hgt:186cm pid:841855425 hcl:#cfa07d ecl:gry
               
               byr:1923 iyr:2015 ecl:amb pid:414655744
               hcl:#b6652a
               hgt:159cm
               eyr:2026
               
               hgt:171cm ecl:amb pid:363065723 iyr:2020
               cid:66 hcl:#b6652a eyr:2021
               byr:1960
               
               eyr:2002
               hcl:2627b2 ecl:#1bf21d pid:168cm byr:2024 iyr:2020
               hgt:186in
               
               iyr:2011 byr:1924 eyr:2024
               hcl:#b6652a ecl:brn
               pid:794477411 hgt:162in
               
               hcl:z hgt:67cm
               byr:2025
               pid:582569979
               iyr:2013
               ecl:oth eyr:2025
               
               cid:50 hcl:931e2c
               hgt:172in eyr:1994 iyr:2023
               ecl:#cd2204
               byr:2015
               pid:157cm
               
               hgt:173cm eyr:2028
               ecl:amb pid:569607283
               byr:1942
               iyr:2019
               cid:228
               hcl:#866857
               
               cid:109
               ecl:oth eyr:1933 byr:1982 pid:173cm hcl:#b6652a hgt:174cm
               iyr:2023
               
               cid:69 hcl:#9ad05b pid:341135641
               byr:1968 ecl:brn
               iyr:2012 hgt:156cm
               eyr:2020
               
               hgt:176cm
               byr:1954 ecl:blu
               eyr:2020
               pid:478462637 iyr:2019
               hcl:#888785
               
               iyr:2026 hgt:193in
               byr:2018 pid:162cm hcl:605e7f eyr:1948 ecl:utc
               
               byr:1962
               eyr:2022 pid:445346117 iyr:2019 hgt:158cm hcl:#623a2f ecl:hzl
               
               cid:278 hgt:187cm eyr:2024 iyr:2016 byr:1964
               ecl:grn pid:450739552 hcl:#733820
               
               ecl:grn byr:2000 eyr:2023
               pid:344489911 hcl:#7d3b0c iyr:2011 hgt:177cm
               
               iyr:2015 hgt:180cm cid:190 hcl:#a97842 pid:359774842 eyr:2029 byr:2002 ecl:amb
               
               eyr:2027 iyr:2015 ecl:hzl
               pid:082733109
               byr:1975 hgt:191cm cid:251 hcl:#888785
               
               hcl:#c0946f iyr:2015
               hgt:167cm byr:1990 ecl:amb pid:168cm eyr:2023
               
               ecl:gry eyr:2028
               byr:1934 iyr:2013 hcl:#6b5442
               pid:424412120 hgt:173cm
               
               pid:273352568
               eyr:2024
               iyr:2013 byr:1926 hcl:#602927
               ecl:brn hgt:180cm
               
               hcl:#7d3b0c hgt:70in ecl:amb iyr:2019
               byr:1937
               eyr:2030 pid:309011548
               
               ecl:grn
               hgt:64in pid:796889811 hcl:#18171d
               byr:1929 eyr:2027
               
               ecl:amb hcl:#888785
               pid:412449028 cid:316 byr:1982
               iyr:2019 eyr:2030 hgt:193cm
               
               eyr:1927
               hcl:z hgt:158cm byr:1930
               ecl:lzr iyr:2018
               cid:197
               pid:0906120002
               
               ecl:grn byr:1970 hgt:181cm
               pid:376212702 eyr:2030 iyr:2017 cid:266 hcl:#f8b0f5
               
               iyr:2018 hgt:73in pid:652356158 hcl:#c0946f
               ecl:grn byr:1973
               
               cid:170 hcl:#b6652a byr:2011
               ecl:gry iyr:2025 pid:#b6e567 hgt:67cm eyr:2016
               
               hgt:192cm ecl:amb eyr:2026 pid:201824712 hcl:#888785 byr:1966 iyr:2019
               
               iyr:2013 byr:1995 eyr:2028 hcl:#b6652a ecl:brn cid:53 pid:705606447 hgt:176cm
               
               hcl:#341e13 byr:1951
               hgt:161cm pid:231973770 iyr:2015 ecl:hzl
               eyr:2030
               
               cid:210 ecl:brn iyr:2017 eyr:2030
               hgt:176cm hcl:#efcc98
               byr:1965
               
               eyr:2020 hcl:#7d3b0c
               pid:872088079 ecl:oth iyr:2017 byr:1920
               hgt:180cm
               
               hcl:#0b540c iyr:2019
               byr:1938
               hgt:153cm ecl:gry pid:236785988
               eyr:2020
               
               eyr:2020 hgt:184cm iyr:2019
               pid:673186642 ecl:oth byr:1977 hcl:#866857
               
               eyr:2025
               ecl:gry hcl:#341e13 byr:1970 iyr:2010 pid:972122542 hgt:184cm
               
               ecl:grn byr:1992 hgt:71in
               iyr:2014 cid:254 hcl:#fffffd pid:749733013
               eyr:2026
               
               cid:98 ecl:amb eyr:2022
               hgt:169cm pid:022677680
               byr:1937 iyr:2014 hcl:#e62c71
               
               hgt:192cm
               iyr:2015
               eyr:2028 ecl:oth pid:6000619833 hcl:#c0946f
               byr:1930
               
               byr:1938 hcl:#efcc98 hgt:178cm iyr:1953 eyr:2038
               ecl:brn pid:#cdc55a
               
               hgt:66in byr:1951 iyr:2016 hcl:#18171d
               eyr:2027
               ecl:lzr pid:834188980
               
               iyr:2012 eyr:2025
               hcl:#7d3b0c pid:330325803 cid:166 hgt:186cm byr:1938
               ecl:amb
               
               iyr:2015 hcl:#602927 cid:268 eyr:2021
               ecl:amb hgt:186cm pid:318676962
               
               hcl:#3d6f3c iyr:2014 pid:665730784 cid:191 hgt:150cm byr:1981 ecl:oth eyr:2024
               
               ecl:grn hcl:#733820
               eyr:2028 iyr:2010
               hgt:162cm byr:1944 pid:872962499
               
               eyr:2028 byr:1974
               ecl:brn
               iyr:2010 hcl:#18171d hgt:160cm
               
               hcl:#602927
               byr:1959 eyr:2027 iyr:2016 ecl:brn hgt:169cm pid:078503025
               
               hcl:#623a2f pid:326300051 hgt:153cm
               byr:1973 iyr:2012
               ecl:gry eyr:2026
               
               hgt:151cm
               byr:1966 eyr:2029 pid:026952622 hcl:#18171d ecl:gry iyr:2010
               
               hcl:#7d3b0c byr:1974 pid:444713591 iyr:2017 eyr:2030
               hgt:165cm ecl:oth
               
               iyr:2026 pid:184cm
               ecl:gmt hcl:z hgt:71cm
               eyr:2029
               
               cid:310 hcl:#fffffd byr:1998
               pid:450705840 iyr:2015
               ecl:grn eyr:2021 hgt:165cm
               
               byr:1939 hcl:#623a2f ecl:gry hgt:69in pid:539812641 eyr:2027 iyr:2013
               
               pid:207645014
               iyr:2015
               cid:314 ecl:oth
               byr:1942
               eyr:2027 hgt:186cm hcl:#fffffd
               
               ecl:#fb7e3d eyr:2031 iyr:1956
               hgt:188 pid:160cm hcl:z byr:2027
               
               byr:1972 iyr:2020 eyr:2026 hcl:#b6652a pid:289088329 hgt:65in ecl:gry
               
               eyr:2027
               hgt:59cm
               byr:2022
               pid:938063769 ecl:zzz iyr:2028 hcl:23c762
               
               byr:2004 hgt:74 iyr:2017
               eyr:2040 ecl:blu pid:4611117799 cid:73 hcl:z
               
               ecl:brn byr:1962 cid:321
               iyr:2019 eyr:2026
               hgt:159cm
               hcl:#667310 pid:439864945
               
               iyr:2026 eyr:2039 pid:633263851 cid:321 ecl:lzr hgt:166cm
               byr:2023 hcl:fc3c63
               
               byr:1961 iyr:2010 ecl:blu
               eyr:2023 pid:245858010
               
               hgt:193cm pid:821303249 eyr:2020 hcl:#6b5442 cid:130 byr:1946
               
               eyr:2026 ecl:brn
               hcl:#733820 byr:1983 hgt:182cm pid:727380954 cid:188 iyr:2015
               
               hgt:152cm cid:206 iyr:2012 byr:1947 hcl:#888785 ecl:gry
               pid:720312394 eyr:2023
               
               hgt:150cm ecl:gry pid:863712648
               iyr:2019 cid:349 byr:1976 hcl:#602927 eyr:2022
               
               hgt:164in pid:953500867
               eyr:2021
               iyr:2014
               hcl:z cid:343 ecl:amb
               
               byr:1981 pid:529710230 iyr:2013 eyr:2023
               hcl:#c0946f ecl:amb
               hgt:151cm
               
               pid:706204190 hgt:154cm cid:317
               hcl:#602927 byr:1949 ecl:blu iyr:2010 eyr:2028
               
               iyr:2019 hcl:#0219e6
               pid:850093151 ecl:gry
               eyr:2030
               byr:1938 hgt:177cm
               
               ecl:brn hcl:#efcc98 eyr:2029 byr:1963
               hgt:185cm pid:611279647 iyr:2011
               
               ecl:blu eyr:2022 byr:1941 hgt:167cm
               iyr:2012 hcl:#7d3b0c pid:415739564
               cid:193
               
               eyr:2027 ecl:blu byr:1968 pid:479994566
               hcl:#733820 hgt:151cm
               iyr:2011
               
               pid:263729839 hgt:189cm eyr:2030 ecl:gry byr:2001 hcl:#602927
               
               byr:1985
               ecl:amb pid:672663977 cid:139
               hgt:159cm hcl:#733820 iyr:2018 eyr:2020
               
               byr:1998
               hcl:#cfa07d eyr:2023 pid:255046063 iyr:2011 ecl:blu hgt:177cm
               
               ecl:oth
               byr:1980 pid:253747166 eyr:2029
               hcl:#6b5442 hgt:186cm
               
               eyr:2030 hcl:#866857
               hgt:165cm
               ecl:amb
               iyr:2017 pid:241240220 cid:164 byr:2001
               
               byr:1994 hcl:#b6652a iyr:2015
               pid:753831241
               hgt:175cm
               eyr:2027 ecl:blu
               
               hcl:#b6652a pid:471594512
               byr:1961 ecl:hzl hgt:175cm
               iyr:2020 eyr:2025
               
               byr:1987 pid:112366159
               eyr:2028 hcl:22b2d7
               hgt:64in cid:222
               ecl:#b40dca iyr:2019
               
               iyr:2015 hcl:e1ed55 hgt:160in ecl:utc byr:2015 eyr:2036
               
               byr:1935
               hcl:#7d3b0c hgt:152cm ecl:gry
               pid:160090332 iyr:2020 eyr:2020
               
               pid:552779024 byr:1998 hgt:185cm ecl:gry eyr:2026 iyr:2013 hcl:#d46cd6
               
               ecl:oth pid:311860969
               cid:57
               hgt:60in
               eyr:2026
               hcl:#ceb3a1
               byr:1961 iyr:2011
               
               eyr:2021 hgt:162cm cid:240
               pid:259997995
               hcl:#efcc98
               ecl:gry byr:1962 iyr:2017
               
               hcl:#866857
               iyr:2016
               eyr:2029
               ecl:blu byr:1927 cid:249 pid:665324615 hgt:65in
               
               byr:1931
               cid:331
               hgt:66in
               ecl:grn iyr:2020 hcl:#efcc98 eyr:2025 pid:175780921
               
               hgt:98
               eyr:2040 ecl:blu byr:2029
               iyr:1967 hcl:0d76e9
               pid:#c9053a cid:296
               
               pid:370918950
               hcl:#602927
               byr:1938
               hgt:178cm iyr:2018 eyr:2030
               ecl:oth
               
               hgt:185cm
               eyr:1984 ecl:oth pid:851080398
               hcl:z byr:2027 iyr:2017
               
               pid:095078224 byr:1957 hcl:#45bcf4 ecl:#f643f9 hgt:63cm eyr:2036 iyr:1978
               
               hcl:z
               eyr:2023 ecl:oth hgt:162cm
               iyr:2016 byr:1938 pid:#fdcddf
               
               hcl:#341e13 iyr:2013 hgt:189cm
               pid:982271041 ecl:brn
               byr:1930 eyr:2030
               
               eyr:2026
               iyr:2012 hcl:#cfa07d cid:59 pid:105862717 ecl:blu
               hgt:159cm byr:1943
               
               ecl:hzl
               pid:604172804 iyr:2016 hgt:174cm cid:79 eyr:2025
               hcl:#733820 byr:1994
               
               iyr:2011 pid:452628771 ecl:gry hgt:182cm hcl:#623a2f
               eyr:2023
               byr:1986
               
               hcl:#341e13 iyr:2010 byr:1946 eyr:2021
               cid:350 pid:049684494 hgt:180cm
               ecl:grn
               
               iyr:2020
               hgt:173cm pid:384503937
               byr:1986
               hcl:#341e13
               cid:113
               eyr:2025 ecl:amb
               
               hgt:180cm byr:1949
               hcl:#733820 iyr:2010 eyr:2030
               cid:123 pid:065609606 ecl:oth
               
               iyr:2010 eyr:2028
               pid:231750173
               hgt:63in ecl:brn
               byr:1948 hcl:#18171d
               
               iyr:2020 hcl:#623a2f
               ecl:gry
               byr:1922 pid:961213634 eyr:2022 hgt:177cm
               
               hcl:#18171d eyr:2020 iyr:2014 byr:1983
               pid:183568344 hgt:72in
               ecl:gry
               
               eyr:2023 pid:102781246 ecl:brn
               hcl:#888785 byr:1929 hgt:167cm iyr:2010
               
               pid:362873066 byr:1994 hcl:#de545f iyr:2018 hgt:177cm ecl:blu cid:86
               eyr:2024
               
               hcl:842f2d iyr:1983
               byr:1954 eyr:2037
               ecl:lzr pid:3915492573 hgt:166cm
               
               ecl:grn
               hcl:#fffffd iyr:2014
               hgt:173cm
               byr:1939
               pid:930650489
               eyr:2025
               
               eyr:2028 ecl:brn hcl:#7d3b0c hgt:166cm byr:1938 pid:992958531 iyr:2011
               
               pid:101149939 eyr:2024 iyr:2018 hgt:165cm
               ecl:hzl
               hcl:#ceb3a1 cid:176
               
               cid:62
               pid:651390352 hcl:#efcc98
               iyr:2018
               eyr:2027
               ecl:brn
               hgt:66in byr:1953
               
               hcl:#623a2f byr:1978
               iyr:2013
               hgt:180cm eyr:2027 ecl:amb pid:836425641
               
               pid:557464096 hgt:155cm ecl:blu cid:142 byr:1936 iyr:2010
               hcl:#cfa07d eyr:2027
               
               ecl:gry iyr:2024 hcl:#341e13 pid:442593279 cid:314 hgt:186cm byr:1960
               eyr:2022
               
               cid:123 iyr:2014
               byr:2000
               pid:878733390 eyr:2021 ecl:hzl hgt:162cm
               
               byr:1959 cid:259
               pid:722895016
               ecl:brn iyr:2018 eyr:2027 hgt:185cm
               
               pid:163697814 ecl:hzl
               iyr:2013 byr:1932
               hgt:68in cid:286 eyr:2025 hcl:#efcc98
               
               byr:1927
               hgt:72cm ecl:oth
               eyr:2021 hcl:#99e959
               pid:669724466 iyr:2010
               
               byr:1943 iyr:2011 eyr:2024 pid:384419879 ecl:hzl hcl:#7d3b0c hgt:170cm
               
               pid:137944386 ecl:gry
               byr:1953 hcl:#733820 iyr:2013 eyr:2025 hgt:184cm
               
               iyr:2017 eyr:2023 pid:288078785
               hgt:179cm
               byr:1993 hcl:#602927 ecl:hzl
               
               ecl:brn
               hgt:187cm eyr:2024 byr:1971 iyr:2020 hcl:#b6652a pid:622975646
               cid:290
               
               pid:371817422 ecl:blu byr:1964
               iyr:2018
               eyr:2021 cid:176
               hgt:153cm hcl:#888785
               
               byr:2002
               cid:256 iyr:2014 eyr:2024 ecl:blu hcl:#18171d hgt:187cm
               pid:050022911
               
               hgt:178cm pid:211144001 eyr:2027 iyr:2013
               byr:1947
               hcl:#7d3b0c ecl:grn
               
               eyr:2025 ecl:blu pid:046417901 byr:1950
               iyr:2015 hgt:165cm
               hcl:#7d3b0c cid:128
               
               ecl:hzl eyr:2029
               iyr:2015
               hgt:171cm hcl:#341e13
               pid:561680375 byr:1997
               
               byr:1948 iyr:2023 pid:17288381 hcl:6a34a3 ecl:#671ece eyr:2001
               cid:152
               
               eyr:2036 hgt:141 iyr:1957 byr:1987 hcl:z
               pid:86986187 ecl:utc
               
               eyr:2024 hcl:#b6652a iyr:2017 ecl:blu byr:1988 cid:348 hgt:152cm pid:068684272
               
               iyr:2011 pid:989825275
               cid:78 hcl:#341e13 byr:1983 ecl:blu hgt:158cm eyr:2020
               
               ecl:grn hgt:187cm eyr:2027 iyr:2015
               hcl:#866857 pid:240650427
               byr:1940
               cid:91
               
               hcl:#888785 cid:185 byr:1925
               hgt:155cm iyr:2015 ecl:blu eyr:2027 pid:851697441
               
               iyr:2016 ecl:oth pid:056439470 byr:1985 eyr:2026
               hgt:154cm hcl:#282539
               
               ecl:hzl hcl:#a97842
               iyr:1944
               pid:118846711 eyr:2026 byr:1922 hgt:185cm
               
               iyr:2020 hcl:#733820
               pid:854531642 hgt:165cm
               ecl:hzl eyr:2022
               
               iyr:2014
               byr:1957 hcl:#7fa674 hgt:189cm
               eyr:2023 pid:740871941 ecl:brn
               
               ecl:amb cid:349 hgt:170cm
               byr:1952 hcl:#ceb3a1 iyr:2020
               eyr:2026
               pid:730499325
               
               eyr:2027 ecl:amb
               byr:1975 pid:985687961
               hcl:z hgt:157cm
               iyr:2013
               cid:133
               
               ecl:blu
               hgt:193cm iyr:2015 hcl:#10f2ba byr:1989 pid:939704495 eyr:2021
               
               ecl:oth eyr:2025 hgt:69in iyr:2014 cid:258 pid:477970733 byr:1984 hcl:#b6652a
               
               hcl:z byr:2013
               ecl:zzz
               pid:1904741884 hgt:180 cid:138 eyr:1985 iyr:1935
               
               eyr:2025
               iyr:2026 hgt:190in pid:#43ca33
               ecl:#3e1ef1 hcl:#7d3b0c byr:2030
               
               eyr:2029 hgt:191cm
               byr:1986 hcl:#ceb3a1 cid:327 pid:795060714 iyr:2012 ecl:hzl
               
               eyr:2025 iyr:2017 ecl:grn
               hcl:z
               pid:8886398 hgt:174cm byr:2016
               
               hcl:#a97842
               eyr:2021 ecl:grn iyr:2013 pid:565234133 byr:1998
               hgt:161cm
               
               eyr:2029 hgt:163cm byr:1933 cid:86 iyr:2011
               ecl:grn
               hcl:#fffffd
               pid:818769307
               
               hgt:190cm eyr:2030 hcl:#af5b5d iyr:2011 ecl:brn pid:359524299 byr:1969
               
               ecl:amb iyr:2011 eyr:2022
               cid:141
               byr:1978 hgt:69in hcl:#fffffd pid:013006109
               
               ecl:blu hgt:164cm iyr:2019 eyr:2027 pid:899103430 hcl:#cfa07d
               byr:1976
               
               eyr:1938
               ecl:#a03c41 pid:708735698
               iyr:2030
               hgt:184cm hcl:#b6652a byr:2013
               
               ecl:hzl byr:1997 hcl:#a97842 cid:60 pid:172cm
               eyr:2023 hgt:161in iyr:1936
               
               ecl:hzl
               byr:1938 pid:094889181
               hgt:162cm iyr:2020
               eyr:2028
               hcl:#623a2f
               
               hgt:162cm cid:86
               hcl:#623a2f pid:738174580 ecl:brn byr:1980 eyr:2028 iyr:2014
               
               byr:2007 hgt:150in hcl:z
               eyr:2032
               ecl:#114f3b
               iyr:2030 pid:5129772
               
               ecl:hzl iyr:2017
               hcl:#18171d
               pid:696283412 byr:1976 hgt:168cm
               eyr:2028
               
               eyr:1922 ecl:#84b0d4 byr:2013 hcl:#ceb3a1 pid:150cm iyr:2030
               hgt:71cm
               
               hgt:164cm byr:1949 ecl:gry eyr:2026
               hcl:#623a2f
               
               ecl:oth
               iyr:2013 hgt:166cm hcl:#50e385
               pid:478852286
               eyr:2030 byr:1930
               
               cid:129
               iyr:2020 byr:1978 pid:907580992 eyr:1955
               hcl:#602927
               ecl:grn hgt:165cm
               
               ecl:blu iyr:2018 byr:1953
               hgt:177cm pid:126681706 eyr:2025 hcl:#c0946f
               
               byr:1984 pid:275799917
               ecl:oth hcl:#623a2f cid:348 iyr:2020
               hgt:189cm eyr:2024
               
               iyr:2016
               ecl:hzl byr:1954
               hcl:#623a2f pid:810508839 eyr:2026
               hgt:185cm
               
               byr:1967
               eyr:2021 hcl:#ceb3a1
               pid:406634908 hgt:158cm iyr:2018 ecl:hzl
               
               iyr:2019 eyr:2030 pid:995681076 hcl:#341e13
               cid:101 hgt:162cm ecl:blu byr:1925
               
               eyr:2026 pid:272513479 hcl:#b6652a byr:1973 iyr:2016 ecl:amb hgt:182cm
               
               pid:298704871 eyr:2024 hcl:#efcc98 byr:1959
               iyr:2014 hgt:191cm ecl:grn
               
               hgt:193cm pid:750729809 ecl:oth
               cid:324
               iyr:2011 hcl:#efcc98 byr:1954 eyr:2020
               
               byr:1966 iyr:2019 eyr:2025 ecl:#2df4b6
               hgt:184cm pid:#fc17f4 cid:161 hcl:#602927
               
               byr:1955 hcl:299464 ecl:amb
               hgt:157cm iyr:2017 eyr:2021
               pid:239450987
               
               hgt:172cm
               ecl:hzl
               pid:839804598
               hcl:#341e13 eyr:2030 byr:1964 iyr:2013
               
               iyr:2018 hgt:152cm byr:1948 hcl:#623a2f pid:400121515
               ecl:blu
               eyr:2020
               
               cid:296
               ecl:grn
               byr:1960 iyr:2028 pid:#1f4b95 eyr:2033 hcl:#602927
               hgt:66cm
               
               iyr:1933 ecl:#232e20 pid:#d03ca7
               eyr:2030 hcl:598ed6 hgt:154in byr:2011
               
               cid:247 ecl:grn iyr:2014
               hgt:178cm
               byr:1992 hcl:#602927 eyr:2021
               pid:678964478
               
               iyr:2010 pid:623705680
               ecl:hzl hgt:181cm byr:1980 hcl:#341e13 eyr:2028"""


topology : List (Array.Array String)
topology =
    List.map (String.split "" >> Array.fromList)
        [ "....#............#.###...#.#.#."
        , ".#.#....##.........#.....##.#.."
        , ".#..#.#...####.##..#......#..##"
        , "......#...#...#.......#........"
        , "........#...###..#.#....#....#."
        , "..##.....#.....#.#.........#.#."
        , ".##.......#.#.#...#..#...##...#"
        , "...##.....#....##....#...###.#."
        , "..#...#......##.#.##.....#.#..#"
        , ".#....#.###.........#.........."
        , ".#.#..##.....###.....###....#.#"
        , "....###....#......#...#......##"
        , "......##...#.##.........#.#..#."
        , "##.#....##...#..##....#.#..#.##"
        , ".#...#..#.....#.#.......#...#.."
        , "..........#..###.###......##..#"
        , "..#.##.#..#......#.......###.#."
        , "...#...#.#.#..#...#.#.........."
        , "#........#..#..#.#....#.##..###"
        , "#...#.....#..####.........####."
        , ".....###..........#.#...##...#."
        , ".....#...#..#.......#....##.#.."
        , "...........#..##.....#...#..#.."
        , "......##..#........#..........."
        , "#.#..#.#.#..#.....#....#.....#."
        , "..#....##....##...#.....#......"
        , ".#.#....#..#.#......#..###...#."
        , ".......#...#.#....##..#..#..#.."
        , ".#.#.#.......#....#.#.#.......#"
        , ".#..........#.##.#...#..#.#.##."
        , "..#.#..........#.#....##.#.##.."
        , "###..#..#.#...##.#.#..#........"
        , "##....#...#....#....#...#.#...."
        , "#...#.#....#.##..##...#.#......"
        , "......#...#.###......##....#..."
        , ".................#.###......#.."
        , "##..#....#....##...###.#.#..###"
        , "..#..........#..####..##..#...#"
        , ".#......#..#.#...........##.#.."
        , ".#..#......#...#.#.#..#.#.#.#.#"
        , ".#......###.....#.#.#......##.."
        , "#..........#.##...#...........#"
        , "..#....#.##....#.........#....."
        , ".#..##....#...##.........#..#.."
        , "....##..#.###..#.#...#..###..#."
        , "..#......#........#...#.#......"
        , "........#..#..#..#...#.##......"
        , ".##.#.#......#...#.........#..."
        , "#..###.#...#....###.##..###...."
        , "........##.............#....#.."
        , "...#...............#....#.#...."
        , "#..........#..#..#.#.....#...#."
        , ".#.............#...#.......#..#"
        , ".#..#..#...#........##........."
        , ".....#.#..#.#..#..##.........#."
        , "..#..##...#....#.#...#.###..#.."
        , "#...........##.....#...#.##...."
        , "#.#.#.#........##......#...#.#."
        , "......#..#.###.#...#.##.##....#"
        , ".#....#...#....#........#....#."
        , "..#.#..........#..##.......#..#"
        , ".....#...##..#................#"
        , ".#...............##...#.##...##"
        , "#.####....##.....#.......#.##.."
        , "......#.##.#...##..###..#.#...."
        , ".#.##.#...##..#.......#.#..#..."
        , "#...#.##..........##..........#"
        , "#.###...#...#..#.....#.#.##..##"
        , ".##.....#....#...##.....##....."
        , "...#........#..###.###...#....."
        , "##..#....#.....#...#.#....#.#.."
        , "#....#....#.#..........#...#..#"
        , "...##..#......#..#..#..#..#...."
        , ".....##...#..####..##.........#"
        , ".....#..#.#...#..#....##..##..."
        , "..#.......##.#..#.##...#.#....#"
        , ".#..#.#...##..##....#..#......#"
        , "..##.##..##...###..#....#...#.."
        , "........##.......##...##.....##"
        , ".#....###...#..#..#..#.......#."
        , "#.###............#....##.....#."
        , "..........#...#...##..#...#...."
        , "..#......#.##.......#....##..##"
        , "..#..###.....#...#.......#....."
        , "#.#...##.....#...#....#.......#"
        , "....##.##.#....#.....#.#....#.."
        , "...#....#.###............#..###"
        , "#..##..#.........##.....#.#...#"
        , "....#.......##......#....#...#."
        , "....#..##.#..........#........."
        , "....#...#.###.......#...#.#...."
        , "#..#..#...#.......##...#..#.##."
        , "#.......#...##.##......#......."
        , "##..##...##...#......#...#...##"
        , "..#...#.#.####.#...##.....##..."
        , "#...#..#..#...##......#.#..#..#"
        , "..##..##.#.#..#...####.....###."
        , ".#........#..##.###...#.##.#..."
        , "........#..#...##......#.#....#"
        , "..#...###.......##..##..#....#."
        , ".##...#.#..#.##.......##.###..."
        , "#....#.#.#........#....#..#.##."
        , "....#.##.#.##..#.#####.....###."
        , "#.#..#..#...#.#..#.......#.#..."
        , "....#...#....###..............."
        , ".###.#.....#.#.......###......#"
        , "##...#.#.###....##..#...##....."
        , "...#.#..#.###.#.......#...#.#.."
        , ".#...#....#...#..####....###..."
        , "..#....##.....##.#.#.##....#..."
        , "#....#..##.......#...##.##....#"
        , ".##..#.......#..#....###......."
        , "#.##.....##.#.........#......##"
        , ".####.#...#.....#..#...#.##..#."
        , "....#...........#.....#........"
        , ".#............##...#.......#.#."
        , "#....#.##........#....#.#..#..#"
        , "#....#.##....#...##...#..#..#.."
        , "...#..#.####.#....#............"
        , "....#......#.........#........."
        , "#....##....###.....#......#.#.."
        , "...#..#....#........###..#...#."
        , "..#.#........#.#.#.###..#.#.#.."
        , ".....###.....##.#....###.#....."
        , "##.#....#....##...##.###.#.##.."
        , ".###.#..#.......##...#...##...."
        , ".#...###........#.......##.##.."
        , "#......####...#...##.#.######.."
        , "....##.............#..##.##...#"
        , "...........#..##.#...#.#.#...#."
        , "###.......#.##..#....#...#....#"
        , ".........#.....#.#.#..##.#....."
        , "#...##..#....#..#.............#"
        , "...#.......#.##.............#.#"
        , ".....#..#...##......####..#...."
        , ".#.#.#.....#...####..#...##...#"
        , "#...#.#..#..#.#..#.##.........."
        , ".....#.##..#.#.##..#.#.#....#.#"
        , "...##..#...#...#..#....#......."
        , "........#.#..#...#...#.#...#..."
        , "##..#........#..#.....#......##"
        , ".........#..#...#......#......#"
        , "..#.#.#........##...#.##.....##"
        , ".###....##....#...#....#..#...."
        , ".#.............###...#..##..###"
        , ".##.##.##.......###.........#.#"
        , "..#..###...#...#....#..#.#..#.#"
        , "......#..#.#..#.....#.#........"
        , "......#...####...#.#.....#....."
        , ".#...##.......#..#......#...#.."
        , "#..#...#.......###..#..#.#.#.#."
        , ".....#.....###.##....#.#.##.#.#"
        , "#........#....##...#..#.##..#.."
        , "...#.#........##....#.#..###.#."
        , "#...#...##.........#........###"
        , "##...#.##..##...#.....#.###.#.."
        , "#.###.#.#..#...........##..#..."
        , "........#.......#..#..#.###...."
        , "#........#....#......###......."
        , "..#.###.######...#.###..#......"
        , "...#...######..#.....#....#.#.."
        , "..#.......#..#..#.........#...#"
        , ".#...#..##.##.........##......."
        , ".........#.#.##.#..#....#.#...#"
        , "#.......#....#......#.....###.#"
        , "##..............#.###........#."
        , "..#.##..#.##.....#...#.#.#..###"
        , "..#.#......#..#..##.#........#."
        , "..#.....#...#.#...#...###..#.#."
        , ".......#...........#..#..#.#.##"
        , ".......#...##..#.###..........."
        , ".#........#.###.#..#..#..#..#.."
        , "##.#.##....#..###..#.##.##...#."
        , ".....#....##.#........#.#.#...."
        , "....##....#..#..#....##....#.#."
        , "#.....##....#.....#.###.#....#."
        , ".#.##.##..#..#...#...........##"
        , "...#..###..#.....##....#......."
        , "...#..##..###.#..#..#.#........"
        , "......##..#.......#..##.....###"
        , ".#...##.#.#.#......#...#.#.#.##"
        , "....#.#....#...#........#...#.."
        , "....#.#......#.#.###.#.#.##.#.."
        , "#..#........###..#..#..#.....#."
        , "...#....#...##...#........##.##"
        , ".....#..#..#.....#....#.#...#.."
        , "..#.###....#.#..##......#.##.#."
        , "..####......#..#.#.#..#.#####.."
        , ".......##..#..###.#............"
        , "..###.#........#..........##.##"
        , "#.#.........#.##.#......#..#..."
        , "...#.....#.....##..#..##.##..#."
        , "#.#.##....#.......###....##...."
        , "...##.#..#...##.#..#......#..#."
        , "..##.........#.##.#####...#.#.."
        , ".#....#...#....#.#.....##...###"
        , "##.....#..####............###.#"
        , "......#...........#....#......."
        , ".#......#.....##...........###."
        , "#......##.......#.#.#..##.....#"
        , "...###.#.....##.#...#.#....#.#."
        , "...###.......#...#............."
        , "..#..#.#....#.#.###.#.#.##..##."
        , "..##...#..#.#..##.#.##....##..."
        , "..#...........#..#....#....#..."
        , "#.##...........#..#.#..##.#.#.."
        , "...##...##................#..#."
        , ".#...#.##......#.#......#.####."
        , "#.##....#....#.........#....###"
        , ".....###........#.#.#.##...#.##"
        , ".....#....#.#....#.........#..#"
        , "..#...#.#.#.#...#...#...##.#..#"
        , "###.......#.....#.............#"
        , "#.####.#.......#.#.#.#..#.#...."
        , "#..#..#####......#....#..##...."
        , "...............#.....#.#....###"
        , ".###.....#...#.##..#.#..#.#####"
        , "#.##.....#......##.......##...."
        , "..........###.......#...#.#...."
        , "..#.#..#...##.....#........#.#."
        , "........##.##....#####.#.#..##."
        , "..##.#.#...#####..........#.#.#"
        , "#.........#......##...#.....#.."
        , ".##.#........#...#..##...#...#."
        , ".......##..#...#.....#.##......"
        , "....#.#...##..##..#....##......"
        , "#........#..........##..####.#."
        , "...###...#.#.###.#...#....#.#.#"
        , ".....##.#.....#........#.#....#"
        , "#.......#....#...##..#......#.."
        , "...#..........#.#.#...#.#.###.#"
        , "....##.....#.##..#.#.#........."
        , "#.##..##..#....#.........#...#."
        , ".###..........#...##.#..#......"
        , ".....####.............##...###."
        , ".#..#....#..#...#..#..........."
        , "#..#..##..#...#.##..#.###.#...#"
        , "......#.#..###...#..#.....#..#."
        , "##.##......#...#.#...#........."
        , "....##.#.......#.#..##....#.#.#"
        , "#..##..#...###.#....##........."
        , ".............#.#....#...##..#.."
        , "..#....#...#.....#.##.#..##..##"
        , "##.#..##.#..##.#.#.##.#...#.#.."
        , ".##.#..#.#........##.#...##...."
        , "#.........##....##..#......#..."
        , ".#.#.......##...#..#......###.#"
        , "........#.#.#.#......#....#..#."
        , "...##..#...#...#.##..#....#.#.."
        , "...#.#.#.#.......#.......###..#"
        , "...#..##..#####.#.....##.#..#.."
        , ".......#.#.....#.....#...#...##"
        , "#...#...#......##.#....##......"
        , "#.....#.#.#.....#....#......#.."
        , "..#..#.##.#......##..#.#..#..##"
        , "####...#.....#....#.#.........."
        , "....#.....###...#...##......#.."
        , ".....#....#...#............#..."
        , "...#...#..##.........#...#...##"
        , "#.#..#.#...##.#.......#..#.#..."
        , ".#.....#...##.............#...#"
        , ".....#..##..#....#......#.##..#"
        , "....#...###.................#.."
        , "...###...#....#...#...#........"
        , "....#.##.#.......#..#.........."
        , "...#..#......#.#...###...#.#..."
        , "..#.#..#...#.......#.......#.#."
        , ".#.#...#.#.##........#........."
        , "...#..#...#....#.#.#.#.#..###.."
        , ".#..##......#.#.##..#.##....#.."
        , "#....#.......##.....#.#........"
        , "..###..#.#.#.......##....#....."
        , "........#.#.#....##...##..#...."
        , "#....##.#....#...##..##...#...."
        , "...#..##.#.....#...#.....##...."
        , ".#.#..#..#...#....#..##.#....#."
        , "##.#.##....#.....#....#....#.#."
        , ".##......#............##...#..."
        , "#..##.#.####.#.#....#..#..#.#.#"
        , "#...##...#......##....###.....#"
        , "..#.##.....#....#....#......#.."
        , ".##.#...#.....#.#.#.#........##"
        , ".#..#....#.#...........#...#..."
        , "#.....#..#.....#.#.##.#.....#.."
        , "....#.....#..#.#....###........"
        , ".....###...........#.#..##.#.#."
        , "....###....#.......###..#...#.#"
        , ".###.....#...##.#...##........#"
        , "..#..#.#..#...#.#...#.#..#...#."
        , "#.####.......#....##.#..#.#..#."
        , "....#.#.##.#..###.........##.#."
        , "..#..#.#....#....#.##.........."
        , "..##.###..#.#..#.#......#....#."
        , ".#..#.....##...#.#......##.#..#"
        , "#.#....#..#.#.#........#.###..."
        , "...#....##....##..###.###.#.#.."
        , "..#....#.....#....##.#........."
        , "#.......#....#.........##..#..."
        , ".#..#...#.#..#.#....#.#........"
        , "...#..###...#.....#......##...."
        , "..#...........#.....#.........."
        , "....###.#...#......#...#..#...."
        , ".....#.##..#..#....#.......#..#"
        , "....##..#.#.#..............#.#."
        , ".#.#..#..#.#......#...#.#......"
        , "....#.......#.##....##.#.#.#..#"
        , "............#.#.#.....##......."
        , "........#...##.#..#......#...##"
        , ".........#...#...#....#...#.##."
        , "..#.....#......#......#.....#.."
        , "#....#...##..#.#....#.#...#.###"
        , ".......#..#..#..#.#...#.....#.#"
        , "...#.#...#......##.....#..#...."
        , "...#.#.####..##.#..#..........."
        , "..##..##....#.....####...#....#"
        , "###.......#...##.#...#...#...#."
        , ".##..#.....#..####......#....#."
        , "#.....#..#..##..##...#..#..#..."
        , ".#....#.....#...####..####....."
        , "..#....#...#......#........#.#."
        , "##.#.......#..#.....#..##..##.."
        , ".#..#..#.#.#...#....##...#.##.#"
        , "##...#..#....#.........##......"
        ]


passwords =
    [ ( ( 1, 2 ), "x", "xpxc" )
    , ( ( 1, 5 ), "b", "bwlbbbbcq" )
    , ( ( 3, 5 ), "v", "qvjjdhvl" )
    , ( ( 9, 12 ), "t", "ttfjvvtgxtctrntnhtt" )
    , ( ( 3, 4 ), "r", "rqjw" )
    , ( ( 3, 7 ), "p", "ppfpppppp" )
    , ( ( 5, 6 ), "q", "qqqqgq" )
    , ( ( 7, 10 ), "v", "gpvgmqkvxgbvs" )
    , ( ( 4, 12 ), "b", "kkdnrhwzbbbb" )
    , ( ( 3, 7 ), "r", "rrkwrshls" )
    , ( ( 3, 4 ), "l", "ldltwzclnrllhkb" )
    , ( ( 4, 6 ), "m", "mfcmmdvmmmm" )
    , ( ( 6, 16 ), "c", "ccccczcccccccccgcc" )
    , ( ( 5, 7 ), "k", "kkppkrr" )
    , ( ( 2, 5 ), "p", "bpppmpcjrgwp" )
    , ( ( 8, 14 ), "c", "dcwklzcckccwdw" )
    , ( ( 4, 7 ), "j", "qhjjjhsj" )
    , ( ( 2, 5 ), "c", "jcdclznbzb" )
    , ( ( 7, 8 ), "x", "xxxxxxxsxxxxlxxxxxx" )
    , ( ( 6, 7 ), "s", "rhsstssmvssss" )
    , ( ( 8, 16 ), "j", "rhsxwjrtpjjjjxhcjhx" )
    , ( ( 13, 14 ), "q", "lqmqqqzsvqqjqq" )
    , ( ( 5, 7 ), "g", "gggsfggj" )
    , ( ( 15, 16 ), "s", "ssssssssssssssxd" )
    , ( ( 3, 5 ), "d", "dmwsm" )
    , ( ( 4, 5 ), "v", "vbvvvg" )
    , ( ( 5, 6 ), "f", "jfzbgfp" )
    , ( ( 1, 4 ), "k", "qkkkk" )
    , ( ( 11, 15 ), "l", "lllllllllllllln" )
    , ( ( 12, 16 ), "n", "nfpnnnnnnhncnjnnls" )
    , ( ( 6, 8 ), "l", "llllllllll" )
    , ( ( 13, 15 ), "p", "pppppppppppphppp" )
    , ( ( 4, 9 ), "k", "bkvqvwkgk" )
    , ( ( 1, 3 ), "j", "jsrg" )
    , ( ( 10, 14 ), "r", "rrvfrvrrrrtrrmsr" )
    , ( ( 2, 4 ), "r", "tcfnd" )
    , ( ( 5, 6 ), "t", "ttwtjk" )
    , ( ( 7, 18 ), "h", "wjjfhphhbqlvqkhjwhk" )
    , ( ( 6, 9 ), "p", "phkkzvppppjpcpnfpsxt" )
    , ( ( 5, 6 ), "f", "ffffmfffffff" )
    , ( ( 9, 16 ), "p", "gbwsmxplndwmrpps" )
    , ( ( 1, 6 ), "s", "sczssw" )
    , ( ( 5, 14 ), "t", "ctxlqhrlvvdttwlnt" )
    , ( ( 2, 5 ), "n", "nndkqnnft" )
    , ( ( 7, 8 ), "c", "zclccrwc" )
    , ( ( 4, 11 ), "q", "pqrqdkpqbjshn" )
    , ( ( 5, 6 ), "m", "nmcmrbmfcgmfw" )
    , ( ( 16, 17 ), "h", "hhhhhhhxhhrhhhhhlh" )
    , ( ( 5, 6 ), "v", "vvvvvv" )
    , ( ( 2, 11 ), "m", "wpsmlpznxdkhs" )
    , ( ( 3, 4 ), "s", "sswf" )
    , ( ( 2, 3 ), "s", "hsbczzspqkwjr" )
    , ( ( 4, 7 ), "s", "zsjrrsvssss" )
    , ( ( 11, 16 ), "j", "hpjdcwpjjnjfgkjlxt" )
    , ( ( 5, 7 ), "b", "rcbbbbg" )
    , ( ( 13, 15 ), "w", "wwwwwwwwwwwwwwww" )
    , ( ( 1, 6 ), "c", "cccmgc" )
    , ( ( 2, 4 ), "v", "vvgv" )
    , ( ( 4, 5 ), "m", "mfmmhms" )
    , ( ( 1, 3 ), "t", "mntqgkdfjsxzptk" )
    , ( ( 2, 7 ), "v", "nvnqmvv" )
    , ( ( 19, 20 ), "c", "ccccccccccccccpcccfc" )
    , ( ( 11, 12 ), "t", "wttmnqtbkttc" )
    , ( ( 3, 5 ), "p", "ptpvp" )
    , ( ( 1, 11 ), "l", "lglwgtlqlnxl" )
    , ( ( 4, 8 ), "m", "mprmmmmwmmfmm" )
    , ( ( 9, 10 ), "d", "ddddddddxdd" )
    , ( ( 16, 20 ), "r", "rrrrrrrrrrrrrrrlrrrt" )
    , ( ( 1, 4 ), "g", "gggg" )
    , ( ( 2, 12 ), "b", "bczgbbbfbwbprbbbtb" )
    , ( ( 2, 7 ), "n", "nnnmnxkntwwxnr" )
    , ( ( 14, 18 ), "z", "tzzzqzzzlnpqzpzzkz" )
    , ( ( 5, 7 ), "p", "ppppmkp" )
    , ( ( 9, 14 ), "c", "vvcgvrxlccxvlpfml" )
    , ( ( 2, 3 ), "l", "jlzpf" )
    , ( ( 3, 5 ), "p", "pbpbp" )
    , ( ( 9, 13 ), "j", "jjjjjjjjjjjjj" )
    , ( ( 5, 7 ), "k", "fmckjkkklkxpf" )
    , ( ( 5, 6 ), "d", "ddddrd" )
    , ( ( 9, 10 ), "s", "sssnsgssbs" )
    , ( ( 9, 10 ), "p", "ppwvppbpptpp" )
    , ( ( 1, 8 ), "z", "kmfszzrx" )
    , ( ( 9, 10 ), "v", "vvjjvsklvdkrkvs" )
    , ( ( 2, 17 ), "k", "kkctmcfzhtvskxlkq" )
    , ( ( 10, 12 ), "n", "vjnndvnlgnhmfc" )
    , ( ( 5, 6 ), "n", "hnnnnntn" )
    , ( ( 1, 6 ), "f", "fptffkhhkktfbtst" )
    , ( ( 4, 6 ), "k", "kqnkjhhwqhpzb" )
    , ( ( 6, 12 ), "r", "rrrrrrrrrrrv" )
    , ( ( 8, 13 ), "l", "llllllllwlllllll" )
    , ( ( 4, 6 ), "p", "qxprzs" )
    , ( ( 2, 10 ), "w", "wswpdwwwrcth" )
    , ( ( 4, 6 ), "n", "gnnfnnnnnnn" )
    , ( ( 10, 14 ), "s", "ssssssprbfssssw" )
    , ( ( 3, 4 ), "f", "ftfk" )
    , ( ( 6, 16 ), "x", "cqxxqwrdxxxxsxbxxxxt" )
    , ( ( 4, 8 ), "f", "ffsqvfpm" )
    , ( ( 8, 11 ), "t", "ttztttttttnttt" )
    , ( ( 13, 15 ), "q", "qqnqqqqqqqqqqqq" )
    , ( ( 2, 3 ), "w", "wwww" )
    , ( ( 2, 8 ), "n", "ntnnnnnrnn" )
    , ( ( 2, 3 ), "k", "jkzkk" )
    , ( ( 3, 4 ), "s", "sscscp" )
    , ( ( 14, 19 ), "g", "gzggggggggggfgfgggqg" )
    , ( ( 5, 6 ), "n", "nnnnwlnn" )
    , ( ( 11, 12 ), "b", "bbmbbbbbbbxbbn" )
    , ( ( 5, 6 ), "t", "zntzfk" )
    , ( ( 4, 5 ), "j", "ljphjl" )
    , ( ( 3, 12 ), "d", "zndtlvdvvdzzn" )
    , ( ( 7, 8 ), "h", "hhhhhhhwhh" )
    , ( ( 12, 13 ), "s", "sssssshssxssss" )
    , ( ( 4, 5 ), "h", "nhsxxmh" )
    , ( ( 7, 9 ), "f", "fzfkffffsfxn" )
    , ( ( 1, 8 ), "c", "cccfcpccmhcch" )
    , ( ( 1, 2 ), "d", "kfdwwm" )
    , ( ( 13, 14 ), "l", "llllllllllllcll" )
    , ( ( 2, 5 ), "p", "jpxdpkg" )
    , ( ( 2, 4 ), "h", "hvhbmhhhhhnh" )
    , ( ( 5, 9 ), "g", "ngqgtqtggdgg" )
    , ( ( 15, 17 ), "b", "brhlrjflddssrrjxb" )
    , ( ( 10, 15 ), "v", "vkfvvqtcxvvvtvcbvv" )
    , ( ( 1, 3 ), "g", "pvkqsgzggg" )
    , ( ( 7, 8 ), "j", "jjjjjjbjj" )
    , ( ( 3, 4 ), "w", "jwrw" )
    , ( ( 4, 7 ), "c", "mhcmkcjrpncxmcrccbc" )
    , ( ( 9, 12 ), "q", "qqqqqqqqqqqs" )
    , ( ( 13, 16 ), "n", "nwngndnnnnnnnnnnnn" )
    , ( ( 3, 4 ), "b", "fjbbb" )
    , ( ( 8, 9 ), "d", "jdfdsqnmdwfdnddkd" )
    , ( ( 1, 4 ), "f", "ggfwgbfhvs" )
    , ( ( 4, 5 ), "g", "gggvg" )
    , ( ( 8, 12 ), "x", "gxhxxxxkxzmfxxx" )
    , ( ( 1, 5 ), "q", "dqqhq" )
    , ( ( 3, 9 ), "m", "mmdmmmzmmp" )
    , ( ( 1, 2 ), "l", "llll" )
    , ( ( 6, 8 ), "q", "qjwhqqhpkbzppc" )
    , ( ( 3, 10 ), "m", "mmcjgrtzmmdmmm" )
    , ( ( 2, 4 ), "q", "cxvq" )
    , ( ( 11, 13 ), "v", "fvvvvvvvvvvvv" )
    , ( ( 7, 13 ), "b", "bbbgbnbkbkbrldbbtc" )
    , ( ( 14, 16 ), "m", "wmmmmmzxrmmjmwmh" )
    , ( ( 6, 10 ), "b", "bwvwbbvshbgtbsrlwbzt" )
    , ( ( 6, 8 ), "q", "qdwhcgpqxw" )
    , ( ( 16, 17 ), "l", "llllbjlrllllcbdhllpl" )
    , ( ( 3, 4 ), "m", "mmmrv" )
    , ( ( 7, 8 ), "m", "mhjnnchg" )
    , ( ( 12, 13 ), "p", "ppppppppppppt" )
    , ( ( 1, 4 ), "s", "sssx" )
    , ( ( 1, 2 ), "d", "xmpdq" )
    , ( ( 10, 11 ), "x", "xxxxxxxxxbbx" )
    , ( ( 2, 4 ), "s", "lxds" )
    , ( ( 1, 4 ), "b", "jbsxbbmbbj" )
    , ( ( 6, 8 ), "q", "qqqqqqblqq" )
    , ( ( 15, 16 ), "q", "qqqqqwzqqqqqnqqqqfq" )
    , ( ( 5, 7 ), "s", "fzvsssr" )
    , ( ( 6, 7 ), "l", "lncbgqr" )
    , ( ( 7, 8 ), "s", "ssssssvs" )
    , ( ( 3, 5 ), "r", "rbrjt" )
    , ( ( 3, 8 ), "j", "ksjjtvnjbjppjjjl" )
    , ( ( 6, 10 ), "s", "sszlkrsssss" )
    , ( ( 1, 4 ), "z", "znzfpz" )
    , ( ( 7, 11 ), "m", "dfkcbxmxmnmmtvmtdn" )
    , ( ( 6, 9 ), "h", "hlhhkhhhq" )
    , ( ( 8, 9 ), "p", "ppppppppvp" )
    , ( ( 6, 9 ), "c", "cccgccccmcch" )
    , ( ( 5, 8 ), "g", "bgkggjgtvggn" )
    , ( ( 3, 4 ), "x", "xxhk" )
    , ( ( 10, 12 ), "h", "hhhhhhhhhlhhhhdnh" )
    , ( ( 5, 6 ), "j", "zjjsjn" )
    , ( ( 9, 14 ), "s", "ksclwttsmpjtds" )
    , ( ( 6, 7 ), "l", "gtdcblql" )
    , ( ( 1, 4 ), "d", "dkndjkcd" )
    , ( ( 1, 6 ), "k", "kkkkkckmc" )
    , ( ( 10, 12 ), "x", "xxxxxxxxxrxl" )
    , ( ( 2, 5 ), "v", "fxdjtv" )
    , ( ( 3, 5 ), "q", "pjmkqdmqnzqppr" )
    , ( ( 5, 8 ), "t", "xtgtgtcht" )
    , ( ( 6, 11 ), "j", "nftjzjmfljqjrc" )
    , ( ( 6, 9 ), "g", "rskgggmgmwjggggvgb" )
    , ( ( 11, 12 ), "v", "vkvdmvdvvvdv" )
    , ( ( 15, 16 ), "z", "zzzzzzzzzzzzzzgxz" )
    , ( ( 13, 17 ), "v", "vvvvvvvvvvvvvvvvnv" )
    , ( ( 9, 14 ), "j", "clrfkrwhjtvzvqqj" )
    , ( ( 1, 12 ), "l", "lljljznslllffhblz" )
    , ( ( 4, 7 ), "c", "cccgcxclc" )
    , ( ( 6, 11 ), "z", "tbxqrzzbwbr" )
    , ( ( 18, 19 ), "m", "jmbmmqmshmczlphfgmf" )
    , ( ( 1, 5 ), "s", "ssvsq" )
    , ( ( 4, 5 ), "k", "kkkkw" )
    , ( ( 4, 7 ), "f", "fcqffxff" )
    , ( ( 3, 8 ), "f", "fffzthzf" )
    , ( ( 9, 12 ), "v", "vvvvvvvvvvvmvv" )
    , ( ( 14, 17 ), "f", "ftflcfffjtjrvfkffmvf" )
    , ( ( 4, 7 ), "n", "pnmnxnqqjp" )
    , ( ( 6, 7 ), "r", "rrrkrmr" )
    , ( ( 4, 13 ), "k", "drckdzxrsmzrkqckn" )
    , ( ( 5, 14 ), "t", "dttttttttttttt" )
    , ( ( 13, 14 ), "v", "vvvvfvvvvvvvvvv" )
    , ( ( 7, 12 ), "j", "jrljwnctjqjjxj" )
    , ( ( 6, 7 ), "v", "wchfzvm" )
    , ( ( 1, 8 ), "d", "dddddddzd" )
    , ( ( 10, 12 ), "g", "gvvzrglgrgggggggggg" )
    , ( ( 3, 4 ), "n", "ngtnnn" )
    , ( ( 2, 4 ), "b", "fzbb" )
    , ( ( 1, 15 ), "x", "cxxfxxxckxxhxlxxxxxx" )
    , ( ( 7, 19 ), "f", "ffkzcglddffcfvfhffv" )
    , ( ( 9, 12 ), "s", "sssssssmssss" )
    , ( ( 13, 20 ), "t", "ttttmttttttthtttddtt" )
    , ( ( 2, 15 ), "v", "vvqvcwvvvvsvvqvwm" )
    , ( ( 5, 10 ), "w", "wxcstswwwwnc" )
    , ( ( 3, 4 ), "v", "tjvvnvvtzfdcjjwb" )
    , ( ( 1, 2 ), "l", "lbclr" )
    , ( ( 2, 13 ), "d", "dkdlddcddddddd" )
    , ( ( 2, 7 ), "n", "npnngnnn" )
    , ( ( 4, 12 ), "g", "kmvvmfngwmlg" )
    , ( ( 1, 2 ), "w", "wwwww" )
    , ( ( 5, 11 ), "t", "ttttjtttttttttttt" )
    , ( ( 4, 5 ), "r", "srlrrr" )
    , ( ( 5, 8 ), "q", "qhqfpjqsnqqkq" )
    , ( ( 8, 15 ), "s", "hvtnslpsfbsssrw" )
    , ( ( 11, 16 ), "n", "gnwnfndrnnhnnknsnnc" )
    , ( ( 2, 7 ), "r", "tdrrshrrhsxrr" )
    , ( ( 16, 18 ), "m", "mmbmmmjmmmmmmmmmmbm" )
    , ( ( 6, 7 ), "n", "nnnnnxt" )
    , ( ( 4, 6 ), "k", "dpxzklksk" )
    , ( ( 1, 9 ), "g", "ggkxhgggggggggggqg" )
    , ( ( 1, 8 ), "l", "lllglllh" )
    , ( ( 1, 4 ), "c", "cwtc" )
    , ( ( 5, 6 ), "h", "vhhhvshh" )
    , ( ( 10, 11 ), "x", "xxxxxxxxxxc" )
    , ( ( 2, 3 ), "q", "qhqqgqmt" )
    , ( ( 3, 6 ), "k", "hkqqshgjnxmlkrjdzg" )
    , ( ( 9, 11 ), "l", "llprlllllllll" )
    , ( ( 5, 7 ), "l", "lknflmrv" )
    , ( ( 8, 9 ), "h", "hhhhhhhhh" )
    , ( ( 7, 8 ), "z", "zzzzzgvzzzzz" )
    , ( ( 18, 20 ), "v", "vvvvvvvhbvqvgvlvjbrv" )
    , ( ( 13, 15 ), "k", "xkfcvkrnfkkkvcpt" )
    , ( ( 3, 5 ), "l", "llnnglmgtz" )
    , ( ( 15, 19 ), "t", "tmtsfttxtctdtgtmpttt" )
    , ( ( 6, 8 ), "f", "gmffwvffff" )
    , ( ( 10, 13 ), "d", "dndsddddddpdjndddd" )
    , ( ( 7, 10 ), "r", "rjzqrpgrrrcmrrg" )
    , ( ( 1, 4 ), "m", "hlmm" )
    , ( ( 9, 15 ), "d", "pdddlrwdzddddddd" )
    , ( ( 6, 13 ), "q", "qqqhnvqqqqqqfbqq" )
    , ( ( 1, 11 ), "z", "wzsqmnrzwzzhzxczzzzd" )
    , ( ( 6, 11 ), "t", "tptnjttkttttvtttr" )
    , ( ( 3, 5 ), "n", "nnznnn" )
    , ( ( 5, 6 ), "t", "trtttslv" )
    , ( ( 5, 6 ), "g", "gggggt" )
    , ( ( 15, 19 ), "s", "sssssssssssxsswsssss" )
    , ( ( 1, 13 ), "q", "wzqjljdqqqqnqq" )
    , ( ( 6, 7 ), "k", "kkkkkgkkk" )
    , ( ( 4, 5 ), "k", "zkxvk" )
    , ( ( 7, 14 ), "t", "thsstltbvmsctqkfhdzc" )
    , ( ( 2, 5 ), "n", "hnnnn" )
    , ( ( 2, 16 ), "t", "gsvkhmhktcxkfqbtd" )
    , ( ( 8, 9 ), "q", "qqtzznrqg" )
    , ( ( 17, 18 ), "v", "vvzvvvvvvvvvvvvvlk" )
    , ( ( 3, 4 ), "v", "vvvl" )
    , ( ( 3, 4 ), "b", "bbvb" )
    , ( ( 10, 12 ), "w", "wwwcwwwwwwkzwhw" )
    , ( ( 1, 3 ), "d", "ntps" )
    , ( ( 8, 9 ), "j", "mqcjcjjfjjhjbjj" )
    , ( ( 1, 7 ), "j", "mjjjjjjj" )
    , ( ( 13, 14 ), "f", "bzffglvfcfsfjb" )
    , ( ( 2, 3 ), "k", "kqkq" )
    , ( ( 7, 15 ), "c", "fccpccshcccccccc" )
    , ( ( 12, 13 ), "k", "kkkkkkpkktksqk" )
    , ( ( 12, 13 ), "w", "rwwwwwkwwwwswwwhw" )
    , ( ( 5, 12 ), "k", "nlkthkkklkkktchmhb" )
    , ( ( 15, 16 ), "f", "fffffffdffffffbf" )
    , ( ( 3, 4 ), "k", "kqkprkkp" )
    , ( ( 4, 5 ), "p", "dcpdppzpppjqm" )
    , ( ( 4, 7 ), "b", "qbbkgbgz" )
    , ( ( 10, 11 ), "n", "nnnnnnnnnnw" )
    , ( ( 9, 12 ), "h", "hhhchbhhvhrhhh" )
    , ( ( 3, 5 ), "h", "hrhnbcl" )
    , ( ( 6, 10 ), "v", "nvlvhvrpvvvvvvv" )
    , ( ( 3, 6 ), "d", "dddddjd" )
    , ( ( 4, 5 ), "r", "rrcvr" )
    , ( ( 7, 12 ), "l", "llllllllllllltll" )
    , ( ( 3, 6 ), "b", "zbbbbt" )
    , ( ( 6, 10 ), "z", "zznzzzzzbzbhzz" )
    , ( ( 2, 5 ), "h", "rfwbmkhmhhhmjhmh" )
    , ( ( 11, 13 ), "q", "wkkzzqxvqqsqx" )
    , ( ( 2, 15 ), "p", "hbpjpppppptppppzb" )
    , ( ( 9, 10 ), "b", "bbmbbbbbsb" )
    , ( ( 3, 10 ), "t", "cqmtttjtttttf" )
    , ( ( 8, 11 ), "v", "tvgcvvvvvkv" )
    , ( ( 6, 9 ), "g", "tggnggtggkg" )
    , ( ( 3, 6 ), "w", "dfwnht" )
    , ( ( 8, 14 ), "c", "pncwqccsfgctpccxc" )
    , ( ( 6, 9 ), "p", "bpppjtzprggp" )
    , ( ( 15, 18 ), "j", "sjjjjjjdjmjbjjpvjj" )
    , ( ( 1, 6 ), "m", "mhmkrhxn" )
    , ( ( 10, 11 ), "d", "xcjtpdwdcfvhqdksfhd" )
    , ( ( 16, 17 ), "t", "txtlrttctwtztttnx" )
    , ( ( 13, 14 ), "j", "jjtjjmjjnjjjjjjj" )
    , ( ( 10, 12 ), "m", "ldqmmmgmmxrmfwrbv" )
    , ( ( 4, 6 ), "p", "psmpnpkfq" )
    , ( ( 13, 14 ), "t", "tltttsttmtttjttt" )
    , ( ( 7, 9 ), "g", "ggggggbgv" )
    , ( ( 8, 9 ), "q", "qqqqqqqqd" )
    , ( ( 4, 5 ), "d", "ddddl" )
    , ( ( 14, 16 ), "g", "gggggggwggpgfpgm" )
    , ( ( 4, 5 ), "v", "vvvvl" )
    , ( ( 5, 8 ), "v", "gtjpvvdv" )
    , ( ( 5, 11 ), "s", "dsslsvqpwsss" )
    , ( ( 4, 6 ), "h", "hhhghh" )
    , ( ( 16, 17 ), "k", "hkkkkkkkkkkkkkkqj" )
    , ( ( 5, 10 ), "d", "dddtddddjd" )
    , ( ( 6, 7 ), "v", "vclfvvzvj" )
    , ( ( 6, 8 ), "m", "dtkbcblppzx" )
    , ( ( 1, 4 ), "g", "hggggg" )
    , ( ( 9, 11 ), "q", "qdqvdqkdfqvqzqkq" )
    , ( ( 2, 6 ), "s", "ssgsbswhs" )
    , ( ( 3, 8 ), "j", "jjpjjjjv" )
    , ( ( 3, 8 ), "d", "dddddddqdddd" )
    , ( ( 6, 8 ), "v", "vvvvhcvn" )
    , ( ( 6, 12 ), "z", "gzzzzzzzzzzkzzzzz" )
    , ( ( 5, 12 ), "k", "nrkzklbxcwbc" )
    , ( ( 10, 14 ), "p", "clxjpnhsvttnjp" )
    , ( ( 6, 17 ), "w", "vztxwwwgwlwcwwwtw" )
    , ( ( 8, 11 ), "c", "cctzcccqcjc" )
    , ( ( 1, 3 ), "b", "zdqx" )
    , ( ( 3, 5 ), "x", "dvxxxx" )
    , ( ( 6, 13 ), "b", "gvbbbbbbbbvpkbb" )
    , ( ( 7, 12 ), "k", "hkbkkqkvkmpkrhk" )
    , ( ( 3, 6 ), "c", "ccrbcdccc" )
    , ( ( 4, 6 ), "m", "znhphh" )
    , ( ( 4, 11 ), "x", "xmmgbxxgdxxtbwg" )
    , ( ( 15, 16 ), "m", "nmmbmmbjmrbvmmbm" )
    , ( ( 11, 12 ), "j", "jdcjjtsjjdjj" )
    , ( ( 1, 4 ), "c", "cccfcc" )
    , ( ( 6, 15 ), "n", "ssvnnnnnnwnggzmp" )
    , ( ( 4, 6 ), "l", "qwfllpx" )
    , ( ( 6, 9 ), "b", "bbbbbsbbmb" )
    , ( ( 3, 6 ), "j", "ljjgfh" )
    , ( ( 5, 9 ), "t", "tttttphtwtvtf" )
    , ( ( 8, 12 ), "x", "xtdxxxdjghxxpxhkbxx" )
    , ( ( 5, 9 ), "r", "rrprrmrrrjvszrrtp" )
    , ( ( 15, 16 ), "r", "lrrrrrrrrrrrkrrrr" )
    , ( ( 2, 5 ), "q", "ltfgqcqmt" )
    , ( ( 7, 13 ), "k", "zkkkkkkkkkkkhkkkkk" )
    , ( ( 5, 6 ), "z", "zzzzzszz" )
    , ( ( 2, 7 ), "g", "tnjqnsgkdtc" )
    , ( ( 3, 4 ), "j", "njjjgkxcgckj" )
    , ( ( 4, 7 ), "j", "rxmjlxzhjjjsgjcj" )
    , ( ( 7, 10 ), "f", "rmfbffhffcf" )
    , ( ( 11, 12 ), "h", "hdhhhhhhhhhsh" )
    , ( ( 7, 8 ), "v", "nwrvvvvdv" )
    , ( ( 8, 9 ), "l", "llllllllf" )
    , ( ( 4, 5 ), "r", "rmxrrrrx" )
    , ( ( 2, 3 ), "c", "ccgdcc" )
    , ( ( 13, 15 ), "r", "rrwrrrnrrrrrdrslr" )
    , ( ( 4, 16 ), "x", "cnlxmtpxdzxblfxxjd" )
    , ( ( 4, 5 ), "m", "mmmmtm" )
    , ( ( 9, 13 ), "x", "gxxxxxxlxxqxxxxx" )
    , ( ( 1, 3 ), "d", "ddhd" )
    , ( ( 11, 14 ), "f", "tffffffffqlfff" )
    , ( ( 2, 4 ), "r", "xrrf" )
    , ( ( 1, 11 ), "m", "mtdmsmmmmdmmmmmsmtmr" )
    , ( ( 1, 8 ), "g", "pggtggggdgmgggn" )
    , ( ( 7, 8 ), "f", "ffvfffpff" )
    , ( ( 2, 7 ), "k", "khqgfzk" )
    , ( ( 11, 12 ), "s", "ssssssssssbsss" )
    , ( ( 7, 14 ), "h", "hthpwhhxhglzqtmhh" )
    , ( ( 2, 4 ), "z", "zzpmz" )
    , ( ( 16, 18 ), "x", "xxxqxxmlgbxxxxxxxx" )
    , ( ( 9, 11 ), "v", "dblhzhvvvnfvptvmf" )
    , ( ( 4, 11 ), "n", "nxsddnsnnngsdnghngk" )
    , ( ( 8, 11 ), "x", "xxxxxxxwxxxxxxxxx" )
    , ( ( 1, 4 ), "s", "swst" )
    , ( ( 13, 14 ), "m", "mgmmghmmmmmmrmmfmmmg" )
    , ( ( 4, 5 ), "c", "dcccc" )
    , ( ( 4, 5 ), "r", "jzrrc" )
    , ( ( 13, 19 ), "b", "bbbbbbbbbbbcbcbbbbb" )
    , ( ( 11, 14 ), "c", "ccccncfclccccfcccm" )
    , ( ( 3, 4 ), "t", "tstl" )
    , ( ( 1, 20 ), "v", "vzrzgsvsfgxjqkxgdpwv" )
    , ( ( 14, 15 ), "h", "hhvkbhhhhhhhhmhhsh" )
    , ( ( 9, 13 ), "b", "bbbbbbbbtbbbbbb" )
    , ( ( 2, 3 ), "b", "zbbb" )
    , ( ( 17, 18 ), "s", "smsssssrsssssssssfss" )
    , ( ( 5, 10 ), "v", "vfvvvfvdvjvlltv" )
    , ( ( 9, 10 ), "n", "nnnqnnnnxtn" )
    , ( ( 6, 7 ), "w", "pwtwwwfkwvk" )
    , ( ( 11, 14 ), "z", "wzzzzzjzzzlzzkz" )
    , ( ( 5, 6 ), "l", "lxlllv" )
    , ( ( 5, 8 ), "v", "vvvvvvthhv" )
    , ( ( 1, 9 ), "r", "rrrrjkzrdqmr" )
    , ( ( 6, 8 ), "s", "sssssssg" )
    , ( ( 2, 4 ), "f", "frfff" )
    , ( ( 1, 16 ), "r", "pzbdrgnpndnrrwkczmr" )
    , ( ( 8, 9 ), "b", "sbbbbbbblkwb" )
    , ( ( 2, 5 ), "z", "zzjzz" )
    , ( ( 3, 6 ), "q", "qqwqqr" )
    , ( ( 2, 13 ), "v", "vbvvbvvjvvnvcdnvc" )
    , ( ( 12, 15 ), "p", "pppppppppppppppp" )
    , ( ( 2, 7 ), "m", "mmmmmmd" )
    , ( ( 6, 11 ), "f", "ffffffffffz" )
    , ( ( 5, 6 ), "r", "drrthrzrrrp" )
    , ( ( 2, 7 ), "q", "fntqnbqqzb" )
    , ( ( 5, 14 ), "w", "wlfwstdfzvwvqw" )
    , ( ( 4, 7 ), "s", "mgsssslfjzsssv" )
    , ( ( 7, 8 ), "g", "tgtgjrggggsggtg" )
    , ( ( 11, 19 ), "z", "fkzzzvzzvzdzzzzzfzz" )
    , ( ( 3, 7 ), "w", "kwcwwww" )
    , ( ( 6, 14 ), "s", "sssssssssssswjss" )
    , ( ( 7, 8 ), "v", "vvmbxvxv" )
    , ( ( 2, 6 ), "n", "nnnnnp" )
    , ( ( 7, 8 ), "b", "bbbbbbbb" )
    , ( ( 3, 6 ), "z", "zzzzhz" )
    , ( ( 11, 17 ), "t", "bltttdttttttttttzt" )
    , ( ( 1, 9 ), "l", "llllllvll" )
    , ( ( 10, 11 ), "n", "tznsxfhdpnn" )
    , ( ( 6, 8 ), "t", "tttttnttt" )
    , ( ( 4, 10 ), "p", "pppppppbppppppnc" )
    , ( ( 4, 11 ), "j", "rhvjjjjjjwjnrcp" )
    , ( ( 3, 4 ), "j", "cjjj" )
    , ( ( 7, 12 ), "v", "kmctjvksqzvv" )
    , ( ( 16, 17 ), "w", "wwwwwwwwcwwwwwwwwww" )
    , ( ( 12, 16 ), "f", "fffffjbfffwffwffff" )
    , ( ( 9, 10 ), "p", "ppntppppjppkpdp" )
    , ( ( 3, 4 ), "l", "lllcf" )
    , ( ( 5, 6 ), "b", "dbbbbsbtb" )
    , ( ( 2, 3 ), "p", "pvpz" )
    , ( ( 5, 6 ), "f", "pqffdf" )
    , ( ( 1, 3 ), "l", "lnlpxl" )
    , ( ( 8, 10 ), "n", "nnnjttnxmmns" )
    , ( ( 1, 10 ), "j", "xjjwtjtjjjjjjj" )
    , ( ( 2, 8 ), "m", "smwmcmzrfqbmmwdmm" )
    , ( ( 1, 6 ), "k", "jxpsfkkkgm" )
    , ( ( 5, 9 ), "f", "zjfffjjwknqh" )
    , ( ( 1, 6 ), "c", "rcccczcccccc" )
    , ( ( 13, 17 ), "g", "zsgpfppggwshgbtggxzh" )
    , ( ( 12, 14 ), "n", "qmknbfcgnnnhwn" )
    , ( ( 1, 6 ), "k", "vdklkkzkkkkfkm" )
    , ( ( 1, 3 ), "h", "hhlhhhl" )
    , ( ( 16, 18 ), "p", "qggnxmswcppklptgsp" )
    , ( ( 1, 4 ), "m", "vmmqmmmmmmm" )
    , ( ( 8, 10 ), "l", "lllllxlllvllg" )
    , ( ( 4, 12 ), "g", "gjgghggwctzvgggggg" )
    , ( ( 8, 11 ), "x", "jxhxxxxxxxx" )
    , ( ( 4, 16 ), "n", "xnrnbkrkdvntnjkc" )
    , ( ( 2, 4 ), "m", "mdmmj" )
    , ( ( 6, 7 ), "n", "nnnnnngnnnntn" )
    , ( ( 1, 13 ), "j", "jjjgjjjfgjjmj" )
    , ( ( 8, 10 ), "z", "zzzzzzpjtz" )
    , ( ( 1, 18 ), "f", "ffkwvfgcrnffgnffmf" )
    , ( ( 4, 5 ), "j", "jjtjvb" )
    , ( ( 6, 11 ), "s", "ssscsnslsssssssshsss" )
    , ( ( 11, 12 ), "n", "nnnnnnnnnnmd" )
    , ( ( 2, 10 ), "n", "cpnhnrnbknnkwnbnlb" )
    , ( ( 2, 4 ), "d", "dddnh" )
    , ( ( 9, 12 ), "f", "fffffffffffldfff" )
    , ( ( 1, 9 ), "d", "ddddddvdlddddd" )
    , ( ( 1, 8 ), "w", "wnwwwdwww" )
    , ( ( 3, 4 ), "h", "bhgv" )
    , ( ( 1, 4 ), "x", "vxxj" )
    , ( ( 3, 4 ), "g", "gmgbg" )
    , ( ( 7, 8 ), "j", "nzwgbtnj" )
    , ( ( 3, 6 ), "z", "zzpzzhzw" )
    , ( ( 8, 10 ), "h", "hmhhhhszgz" )
    , ( ( 1, 5 ), "m", "dnqgnxjm" )
    , ( ( 11, 12 ), "z", "zkzpbjxszzzhwgdz" )
    , ( ( 10, 11 ), "r", "rlrrrrrrrrr" )
    , ( ( 1, 2 ), "v", "vvvvtsvvvvvvvvqvvvn" )
    , ( ( 13, 14 ), "n", "nrfzqlxxxsxqhnkhrmws" )
    , ( ( 1, 4 ), "z", "znftzjjwzc" )
    , ( ( 6, 15 ), "v", "fvvvlvvhvvvvvzhvv" )
    , ( ( 5, 10 ), "x", "mtxprgbqxxkfnssvq" )
    , ( ( 8, 9 ), "f", "lffffffwf" )
    , ( ( 1, 4 ), "g", "grxgvlhflrbghj" )
    , ( ( 3, 5 ), "c", "fcxcl" )
    , ( ( 6, 7 ), "s", "ssssdds" )
    , ( ( 10, 13 ), "l", "llllllllllllxl" )
    , ( ( 12, 15 ), "j", "jjvjjbjcjjjjsjjj" )
    , ( ( 1, 2 ), "c", "ctggc" )
    , ( ( 2, 4 ), "w", "wbwwwwr" )
    , ( ( 8, 20 ), "v", "phvvvvvrbvvfvvvvvvhv" )
    , ( ( 5, 8 ), "v", "cvvnvjbl" )
    , ( ( 4, 19 ), "x", "xhvxflxpkxxcfvwxxhl" )
    , ( ( 1, 2 ), "m", "mgqj" )
    , ( ( 5, 6 ), "q", "wpxdbq" )
    , ( ( 19, 20 ), "d", "ddddddbxddddddddddpd" )
    , ( ( 5, 11 ), "d", "dhhwddjddkdd" )
    , ( ( 6, 7 ), "g", "ggggggn" )
    , ( ( 1, 7 ), "h", "zhphhhhhgn" )
    , ( ( 7, 11 ), "s", "ssssssssssksssss" )
    , ( ( 2, 3 ), "n", "hnwn" )
    , ( ( 8, 9 ), "h", "hhsshhhhh" )
    , ( ( 1, 2 ), "c", "ccwcc" )
    , ( ( 2, 5 ), "s", "cdsmmfqfcrsh" )
    , ( ( 3, 5 ), "m", "mwmjt" )
    , ( ( 1, 4 ), "n", "ndntnnnnnnnnnn" )
    , ( ( 4, 6 ), "s", "ssslsssshsssmq" )
    , ( ( 5, 16 ), "r", "rrrrcrrrjrrrrrrrrr" )
    , ( ( 1, 6 ), "v", "bvvvvvvv" )
    , ( ( 9, 10 ), "t", "tsttttztxtttttb" )
    , ( ( 8, 12 ), "d", "tvrbvwxdddxmhfsd" )
    , ( ( 3, 9 ), "w", "wbwwwwwwww" )
    , ( ( 3, 5 ), "g", "bgglcqg" )
    , ( ( 8, 12 ), "f", "fqffvdzslhksrv" )
    , ( ( 1, 4 ), "h", "hsqh" )
    , ( ( 6, 12 ), "b", "hbwhxbfppkbb" )
    , ( ( 12, 15 ), "l", "llllllllllllllplv" )
    , ( ( 16, 17 ), "m", "mmmmmzmvmmmmmmkmhmmm" )
    , ( ( 2, 8 ), "p", "mpnnnpwpv" )
    , ( ( 9, 10 ), "x", "xxpxxxxlcxj" )
    , ( ( 10, 14 ), "c", "mccclvcccfcckwcbczc" )
    , ( ( 2, 3 ), "v", "vvsrg" )
    , ( ( 13, 15 ), "h", "hhhhrlhfhhhhvhhhshh" )
    , ( ( 3, 8 ), "z", "vsbkqlzzzzzsmzw" )
    , ( ( 9, 11 ), "h", "qhhhhhhhddnh" )
    , ( ( 4, 5 ), "h", "hhhkxhh" )
    , ( ( 7, 12 ), "t", "dtcvttttbhnntft" )
    , ( ( 1, 5 ), "z", "kksnxzzxz" )
    , ( ( 1, 3 ), "j", "cjjjjjjjfjj" )
    , ( ( 12, 15 ), "s", "sslssstssssssszss" )
    , ( ( 2, 4 ), "c", "mntc" )
    , ( ( 5, 8 ), "v", "mvbsvfvvvlsrv" )
    , ( ( 5, 6 ), "z", "zmhfjq" )
    , ( ( 10, 15 ), "r", "rrrrrrrjrbrmrjr" )
    , ( ( 9, 11 ), "j", "jjjjjjjjjjxjjj" )
    , ( ( 1, 2 ), "d", "jwhdd" )
    , ( ( 4, 5 ), "m", "mmmkm" )
    , ( ( 1, 7 ), "j", "rprmjbxjj" )
    , ( ( 13, 14 ), "g", "ggggggpqggggqgg" )
    , ( ( 1, 5 ), "l", "llxzlkpptdzg" )
    , ( ( 1, 2 ), "z", "zzzzzzzzzzzzjzzz" )
    , ( ( 3, 4 ), "h", "qhhwtz" )
    , ( ( 2, 5 ), "t", "tptttt" )
    , ( ( 1, 14 ), "c", "cccccccccccccxcccc" )
    , ( ( 8, 9 ), "t", "tgtpttwtqttvt" )
    , ( ( 1, 16 ), "m", "mhmtpmmpmmtmzmmcqj" )
    , ( ( 3, 4 ), "q", "qqvq" )
    , ( ( 10, 11 ), "h", "hxhhhhhhhbhh" )
    , ( ( 5, 6 ), "n", "xlchhnljrlnfrlwzs" )
    , ( ( 1, 9 ), "x", "mxxxxxxxtxxxfxx" )
    , ( ( 2, 7 ), "n", "bbnnrqmnnnnnl" )
    , ( ( 2, 7 ), "p", "rgpqnqp" )
    , ( ( 3, 4 ), "f", "fndf" )
    , ( ( 10, 11 ), "c", "cccccccccqc" )
    , ( ( 3, 10 ), "l", "lpzxlhpslfh" )
    , ( ( 3, 5 ), "k", "kkkkkkk" )
    , ( ( 14, 17 ), "b", "bbbbbbbtbbbbbfbbbb" )
    , ( ( 1, 2 ), "f", "gfff" )
    , ( ( 10, 14 ), "j", "jjjjjjhjjjdjrjc" )
    , ( ( 1, 9 ), "s", "wszsswssspsss" )
    , ( ( 4, 6 ), "k", "dckkkkkk" )
    , ( ( 3, 13 ), "h", "hhvkvhhhhhhdhh" )
    , ( ( 15, 16 ), "g", "ggggggggggggggngg" )
    , ( ( 2, 11 ), "m", "nzdsmbqtmmmmxskcmmv" )
    , ( ( 3, 11 ), "m", "mmmkmhxmwmcmqdlpmf" )
    , ( ( 1, 8 ), "n", "snnnbnwn" )
    , ( ( 1, 13 ), "j", "pjjjjjgjjjjjxjj" )
    , ( ( 3, 18 ), "m", "mmvvmqmlmmmmzcmkwqlw" )
    , ( ( 1, 4 ), "d", "dbdx" )
    , ( ( 12, 15 ), "r", "rrrrrrmrrrrrrrr" )
    , ( ( 4, 18 ), "s", "sssvsssssszsssssscss" )
    , ( ( 2, 5 ), "q", "nqbmmbqds" )
    , ( ( 3, 12 ), "d", "hrdvzzcrbjwdkgddbrpq" )
    , ( ( 2, 3 ), "r", "rsrghkrmdsfm" )
    , ( ( 5, 9 ), "k", "twfwkkkswqkkkkwv" )
    , ( ( 4, 6 ), "p", "tppxpstmxcw" )
    , ( ( 12, 13 ), "k", "kkkktkkkkrkksk" )
    , ( ( 1, 2 ), "m", "lmmm" )
    , ( ( 3, 5 ), "s", "shsss" )
    , ( ( 6, 7 ), "c", "ccccclc" )
    , ( ( 10, 17 ), "s", "ssssshsssssssssshs" )
    , ( ( 6, 15 ), "n", "nnnxnrtfnnnnnnnnn" )
    , ( ( 3, 18 ), "s", "jsfcdsscssmnsgssnj" )
    , ( ( 7, 8 ), "x", "xxcxxxxr" )
    , ( ( 3, 5 ), "l", "lvlllll" )
    , ( ( 11, 12 ), "h", "hmhhhhhhhcxjhhfdh" )
    , ( ( 3, 4 ), "d", "wdfdd" )
    , ( ( 3, 4 ), "r", "qrvr" )
    , ( ( 10, 18 ), "j", "mvwlxblnhjddlzkhqjfj" )
    , ( ( 6, 20 ), "b", "bhbbbbbbbbbtbbkbbbbc" )
    , ( ( 8, 9 ), "c", "cclccmnrr" )
    , ( ( 3, 6 ), "w", "wwwwwww" )
    , ( ( 5, 9 ), "k", "dlgkjnqxk" )
    , ( ( 12, 18 ), "f", "fqfffbfffffcfffhfkf" )
    , ( ( 1, 3 ), "w", "fwwgjsclwpw" )
    , ( ( 6, 7 ), "z", "zwzzzzl" )
    , ( ( 14, 16 ), "r", "jrrrrrrrrrrrrfrrrr" )
    , ( ( 11, 14 ), "b", "bbbbbbbbbbbbbw" )
    , ( ( 9, 11 ), "h", "hhhzhhhfxhhhh" )
    , ( ( 3, 4 ), "p", "pplnp" )
    , ( ( 2, 3 ), "f", "ffff" )
    , ( ( 5, 8 ), "p", "lppppppsppppppp" )
    , ( ( 17, 18 ), "w", "wwwwwwwwwwwwwwwwzcww" )
    , ( ( 11, 13 ), "n", "nnnnnnnqnnnnfn" )
    , ( ( 7, 12 ), "f", "fxmfpdfjrffjgtffzlfg" )
    , ( ( 4, 16 ), "w", "bctwmwtxvwqzrwwwwhw" )
    , ( ( 2, 7 ), "m", "gmmmmmjmmmm" )
    , ( ( 1, 15 ), "q", "tqqqqqqqqqqqqqqq" )
    , ( ( 3, 4 ), "q", "gqwq" )
    , ( ( 3, 12 ), "s", "ssssssssssrhpsg" )
    , ( ( 6, 8 ), "m", "mrmlmhcrsm" )
    , ( ( 4, 9 ), "q", "gdbffcqbqt" )
    , ( ( 1, 17 ), "k", "kkkkkkkkkkkkkkkkkmk" )
    , ( ( 15, 16 ), "h", "hghhhhhhhhhhhhrhh" )
    , ( ( 4, 5 ), "p", "pkpzmb" )
    , ( ( 2, 18 ), "h", "khvkdpbxdptllfdxvhh" )
    , ( ( 18, 20 ), "z", "zzczzzzzzzzzzzzzzpzs" )
    , ( ( 1, 11 ), "p", "ppppppcpzppppppppp" )
    , ( ( 4, 9 ), "z", "ztpfrjzwnv" )
    , ( ( 6, 11 ), "x", "snxxtstcqhv" )
    , ( ( 3, 5 ), "c", "nrlcccbcpsvcc" )
    , ( ( 2, 7 ), "z", "dztxzzqmfzrpz" )
    , ( ( 5, 14 ), "w", "pbcjnqpwwlccfscz" )
    , ( ( 1, 5 ), "f", "rfndsxdmhbgf" )
    , ( ( 8, 14 ), "t", "ttttpdfwtxfttd" )
    , ( ( 2, 11 ), "l", "lndmmrnxdmdpdmlzll" )
    , ( ( 3, 4 ), "h", "chzl" )
    , ( ( 10, 17 ), "d", "ngkkdbvflmcssmgmdk" )
    , ( ( 4, 7 ), "d", "bhksdtd" )
    , ( ( 2, 6 ), "k", "ktkdkzwsgkhkk" )
    , ( ( 1, 4 ), "r", "hrrs" )
    , ( ( 15, 19 ), "j", "ndnvjfjljnwklsmdbjj" )
    , ( ( 5, 12 ), "v", "vhvvvrvgvvqgwvvbfv" )
    , ( ( 2, 3 ), "r", "rfkkhrrhqhks" )
    , ( ( 13, 17 ), "q", "qqmlqqqqqmqqvqqqcqq" )
    , ( ( 4, 15 ), "z", "zvbkvbzczkrttcz" )
    , ( ( 4, 8 ), "s", "ssssssss" )
    , ( ( 13, 14 ), "x", "xmxxrxxxgxxxmb" )
    , ( ( 7, 10 ), "s", "sfjzslwsqsss" )
    , ( ( 4, 13 ), "c", "clccncccccccpc" )
    , ( ( 2, 4 ), "l", "lddlpplrqqs" )
    , ( ( 12, 13 ), "j", "jjjvjjhjjjjmjjjjj" )
    , ( ( 6, 9 ), "n", "lnnznnpnclnnn" )
    , ( ( 6, 10 ), "g", "gggggggwgjgg" )
    , ( ( 4, 6 ), "l", "tjhqmr" )
    , ( ( 2, 4 ), "d", "hddxjdvj" )
    , ( ( 5, 13 ), "t", "tzftwttwttjttt" )
    , ( ( 1, 9 ), "j", "jnjjjkjftjjfmjhjkj" )
    , ( ( 8, 9 ), "q", "qqqsqqqjj" )
    , ( ( 15, 19 ), "l", "lllllbtdlsllllllxlfl" )
    , ( ( 5, 6 ), "g", "gkgkrsgg" )
    , ( ( 2, 4 ), "t", "tttb" )
    , ( ( 12, 15 ), "p", "jpppppspgpppppkxb" )
    , ( ( 10, 13 ), "n", "nznprnnhnmgxhxnknnnn" )
    , ( ( 12, 13 ), "d", "dddsdddddddsd" )
    , ( ( 5, 15 ), "q", "qqqqkqqqmqfzqqqw" )
    , ( ( 5, 9 ), "s", "nmgslvgdz" )
    , ( ( 1, 4 ), "d", "gddkddd" )
    , ( ( 12, 16 ), "v", "zvdsdsgjrtjvzsjtx" )
    , ( ( 11, 14 ), "q", "pqdgjqqqqgqqjwlqqqmq" )
    , ( ( 2, 7 ), "p", "pkpqsppqgz" )
    , ( ( 6, 10 ), "b", "bzdbbbbbbvbbbx" )
    , ( ( 14, 15 ), "v", "vvvvqvvvcvvvvvvv" )
    , ( ( 4, 5 ), "w", "wjwwwhjwg" )
    , ( ( 5, 10 ), "x", "wgthfxtdpxx" )
    , ( ( 6, 7 ), "c", "ccqcfcbcccbml" )
    , ( ( 6, 7 ), "w", "rwwwwxb" )
    , ( ( 4, 5 ), "n", "jnnnngvljjmnr" )
    , ( ( 3, 11 ), "m", "lbmmmmmmmmtxgxmmzm" )
    , ( ( 1, 2 ), "b", "bbbvjcbbb" )
    , ( ( 6, 9 ), "b", "tbwbbcbbbb" )
    , ( ( 11, 13 ), "d", "sdkwqrjdddbdd" )
    , ( ( 9, 15 ), "t", "ttttpqttjttttsjt" )
    , ( ( 5, 7 ), "j", "jjjjjjzj" )
    , ( ( 12, 13 ), "v", "vvjvmvvqvfzvcvvvvvv" )
    , ( ( 6, 7 ), "d", "ddlddrd" )
    , ( ( 5, 6 ), "j", "jjjjwj" )
    , ( ( 5, 6 ), "f", "fffffp" )
    , ( ( 6, 7 ), "w", "zwmwdwww" )
    , ( ( 1, 4 ), "d", "jddddppdktdgh" )
    , ( ( 4, 14 ), "n", "nnnnncnnnnnnnnrn" )
    , ( ( 14, 17 ), "c", "ccccccsdccccccccn" )
    , ( ( 3, 4 ), "z", "zzzgqz" )
    , ( ( 5, 17 ), "m", "mmrsmmnzqlnbmmlljwpm" )
    , ( ( 3, 5 ), "j", "cgvjh" )
    , ( ( 12, 13 ), "w", "wtgblrdchjjkfhg" )
    , ( ( 4, 7 ), "t", "rgclgtt" )
    , ( ( 1, 3 ), "k", "wckhkkkjkk" )
    , ( ( 6, 11 ), "n", "nnnnnnnnnnvn" )
    , ( ( 17, 18 ), "k", "kktkkkknczkkkkhkkk" )
    , ( ( 1, 6 ), "x", "rwxqgxrxxxmsmkrx" )
    , ( ( 17, 18 ), "g", "ggggggggggggggqgjp" )
    , ( ( 14, 17 ), "w", "wwwwwwwwwwwwwnwww" )
    , ( ( 11, 12 ), "w", "vcbmkbwnwbwww" )
    , ( ( 15, 16 ), "g", "gggggggggghjgwgggjvg" )
    , ( ( 5, 9 ), "n", "nnnnwnnnfnnnnnnsnnnn" )
    , ( ( 3, 4 ), "k", "kkkjhk" )
    , ( ( 5, 8 ), "k", "kkkkmkkkk" )
    , ( ( 9, 13 ), "k", "kkrskkkkkkkqfkknmz" )
    , ( ( 2, 3 ), "j", "jtjcj" )
    , ( ( 7, 8 ), "c", "ccvcrcsxc" )
    , ( ( 5, 9 ), "k", "kkkkgkkkkk" )
    , ( ( 4, 5 ), "h", "hhzsxv" )
    , ( ( 1, 7 ), "d", "lgdbdhdddd" )
    , ( ( 5, 6 ), "j", "dsjjkj" )
    , ( ( 7, 20 ), "x", "xnxwmwkbbbkjbpfwkpgx" )
    , ( ( 11, 12 ), "q", "wmbqtffthfcqgq" )
    , ( ( 7, 16 ), "h", "hhfkhhdhhhhhhhhhhhh" )
    , ( ( 9, 13 ), "b", "bhbfbmbbsgbbfbj" )
    , ( ( 8, 10 ), "w", "xwwmwwwgfwwzpwnw" )
    , ( ( 7, 11 ), "m", "bmrmbwmmmmmmmm" )
    , ( ( 8, 9 ), "d", "lshdfglpdq" )
    , ( ( 11, 13 ), "w", "vxwwwwxckwwkww" )
    , ( ( 8, 13 ), "x", "xxzxgtpxxlxxx" )
    , ( ( 8, 13 ), "z", "jrsfgvzzzwrdxz" )
    , ( ( 10, 11 ), "q", "qqqqqlqqqqq" )
    , ( ( 2, 7 ), "m", "knxnmxm" )
    , ( ( 2, 4 ), "n", "znnhnnnnnnn" )
    , ( ( 4, 6 ), "k", "kmxgkkk" )
    , ( ( 10, 18 ), "z", "qhhzhzbldchlmwdzfrsz" )
    , ( ( 3, 4 ), "n", "nnnt" )
    , ( ( 11, 15 ), "v", "vvvvvvvvvvwvwvf" )
    , ( ( 4, 9 ), "x", "dxjxnmghvrxbnzgxljc" )
    , ( ( 1, 2 ), "m", "mmgm" )
    , ( ( 18, 19 ), "z", "zzzzczzzzczzzzzzzjsz" )
    , ( ( 6, 20 ), "p", "pkhzdzpppfbphphpxppp" )
    , ( ( 3, 9 ), "h", "zxhqqkkqknkfvq" )
    , ( ( 5, 8 ), "l", "lllltlll" )
    , ( ( 8, 10 ), "z", "zdzzzzmszz" )
    , ( ( 10, 17 ), "l", "txhgwzsrjlvlvglxl" )
    , ( ( 1, 12 ), "s", "bvgswssssmssvssssssb" )
    , ( ( 3, 6 ), "j", "xjjbjt" )
    , ( ( 3, 5 ), "x", "xxlxq" )
    , ( ( 5, 15 ), "r", "htprxzjstgzpddrtjrr" )
    , ( ( 1, 10 ), "x", "xzftsqxxpgzdlcth" )
    , ( ( 6, 9 ), "w", "wbdwwpbwwwwcrx" )
    , ( ( 4, 11 ), "n", "nnknnhnnnnk" )
    , ( ( 8, 11 ), "f", "ffffffpsfffff" )
    , ( ( 6, 9 ), "h", "hhhnhhqhhhnhvv" )
    , ( ( 6, 9 ), "x", "gqxzhlpnxlcrwnxxp" )
    , ( ( 5, 7 ), "k", "kkkkjkkk" )
    , ( ( 5, 7 ), "x", "xxdxxsqcx" )
    , ( ( 6, 7 ), "j", "jfjljjfp" )
    , ( ( 7, 8 ), "l", "clsldvlc" )
    , ( ( 5, 10 ), "h", "qhqmchbzhlfhc" )
    , ( ( 5, 9 ), "m", "mpdnhsmmb" )
    , ( ( 2, 4 ), "k", "jvmkjrkhkctwlrq" )
    , ( ( 2, 3 ), "s", "ssgstssds" )
    , ( ( 8, 9 ), "t", "tvttttttht" )
    , ( ( 5, 6 ), "n", "nnnpnpn" )
    , ( ( 8, 9 ), "x", "xxxxqxxxsp" )
    , ( ( 6, 7 ), "z", "zzzzzzl" )
    , ( ( 4, 5 ), "f", "fffpkffq" )
    , ( ( 1, 12 ), "b", "bsfbclbxbkbbmbmb" )
    , ( ( 14, 15 ), "b", "rcnwnhbdfbhtblvb" )
    , ( ( 7, 9 ), "j", "jjjjjjjjx" )
    , ( ( 2, 3 ), "x", "xxxx" )
    , ( ( 13, 14 ), "z", "zqzzzzzdztzzzmzz" )
    , ( ( 2, 6 ), "r", "rmlbjrrbrc" )
    , ( ( 2, 3 ), "m", "mwmm" )
    , ( ( 9, 10 ), "d", "ddddddjddz" )
    , ( ( 15, 18 ), "p", "pppppppzppppppzppj" )
    , ( ( 3, 6 ), "g", "glfgdgfgbgdkg" )
    , ( ( 1, 3 ), "s", "sdsblxzscp" )
    , ( ( 5, 6 ), "v", "vvvvsv" )
    , ( ( 1, 3 ), "d", "vdxdkd" )
    , ( ( 6, 8 ), "w", "wkzwcwvwwwqwd" )
    , ( ( 9, 10 ), "h", "hhhhhhhhwh" )
    , ( ( 9, 12 ), "b", "bdbbbbbwbbmbbbb" )
    , ( ( 2, 8 ), "b", "bbbbbbbcb" )
    , ( ( 2, 9 ), "v", "nvtgsfvpv" )
    , ( ( 11, 13 ), "v", "hvvgvvvvvvbvphlhnv" )
    , ( ( 6, 7 ), "r", "rrrrprr" )
    , ( ( 10, 16 ), "w", "wlxptrzwmwxhspcww" )
    , ( ( 5, 7 ), "f", "ffpfshf" )
    , ( ( 3, 6 ), "t", "rnttvx" )
    , ( ( 8, 16 ), "b", "pvlbtnfbvspdhtkk" )
    , ( ( 1, 4 ), "v", "vlvd" )
    , ( ( 4, 17 ), "l", "qflfllkllplllllkl" )
    , ( ( 1, 3 ), "s", "psswjplkhvxssftnpl" )
    , ( ( 6, 11 ), "t", "tthmbtwkfct" )
    , ( ( 11, 17 ), "w", "wwwwjwdtwcnwwwxkx" )
    , ( ( 9, 11 ), "s", "sssssssslsss" )
    , ( ( 8, 10 ), "n", "nnnnnpnwnnnvw" )
    , ( ( 12, 13 ), "m", "mmmmmmmmmmmnpmm" )
    , ( ( 14, 17 ), "w", "xbswvmsflkmqlpkxwm" )
    , ( ( 1, 3 ), "w", "mzww" )
    , ( ( 5, 6 ), "g", "ggggdw" )
    , ( ( 1, 15 ), "r", "rslcrjzhrjdpwqm" )
    , ( ( 7, 12 ), "g", "ggdgfggdzlxfkg" )
    , ( ( 2, 11 ), "x", "cpsxxkxxqhsxdxxjkgbt" )
    , ( ( 7, 8 ), "w", "wdvhwwwp" )
    , ( ( 1, 4 ), "z", "zmfzllxnrnlw" )
    , ( ( 9, 10 ), "b", "rkbbbbksbpdsbcm" )
    , ( ( 1, 8 ), "h", "sqdmcjpw" )
    , ( ( 2, 6 ), "x", "pxxvrx" )
    , ( ( 5, 6 ), "x", "xjshxxqt" )
    , ( ( 1, 13 ), "b", "fbbbbbbbbbbbbbb" )
    , ( ( 11, 13 ), "t", "bwhtttdvtbtkw" )
    , ( ( 2, 6 ), "j", "rjrggj" )
    , ( ( 5, 6 ), "v", "fvvvwvtv" )
    , ( ( 10, 15 ), "s", "ssdsstswssssssc" )
    , ( ( 2, 6 ), "h", "hnqzhlclp" )
    , ( ( 8, 12 ), "t", "pjztttrjtvttt" )
    , ( ( 5, 6 ), "g", "gwxrggtmg" )
    , ( ( 1, 8 ), "z", "kzzzzzzvz" )
    , ( ( 10, 15 ), "p", "pppppppppvpppppp" )
    , ( ( 3, 4 ), "g", "ngxdgg" )
    , ( ( 2, 5 ), "x", "xcxxnbwh" )
    , ( ( 3, 10 ), "s", "sgkghshxdssws" )
    , ( ( 1, 2 ), "s", "pssldmf" )
    , ( ( 2, 5 ), "m", "jmxmm" )
    , ( ( 5, 6 ), "n", "pnsjqnnn" )
    , ( ( 13, 17 ), "t", "ttxslvttlnttrdwtt" )
    , ( ( 1, 6 ), "n", "nnpnsn" )
    , ( ( 3, 20 ), "m", "mmmmmwjmmmmmtmmvmmmm" )
    , ( ( 15, 17 ), "s", "ssszsslsssszssssss" )
    , ( ( 5, 8 ), "s", "hsgzspsk" )
    , ( ( 7, 8 ), "c", "ccccccchc" )
    , ( ( 14, 17 ), "l", "llllllllllllllllk" )
    , ( ( 7, 14 ), "p", "xjbxdpkbgcpbfpptfx" )
    , ( ( 5, 6 ), "s", "sghmss" )
    , ( ( 4, 6 ), "s", "ssssss" )
    , ( ( 1, 2 ), "c", "kcwpwc" )
    , ( ( 5, 6 ), "m", "mmmqtmt" )
    , ( ( 1, 9 ), "l", "glllllllslllll" )
    , ( ( 3, 4 ), "r", "rrcr" )
    , ( ( 6, 9 ), "r", "rpcbrrrrdvrrwf" )
    , ( ( 3, 7 ), "l", "wglsfjtwlldg" )
    , ( ( 6, 9 ), "g", "gggbgggxw" )
    , ( ( 9, 10 ), "j", "jjjjjjjjrjjjjjjjjjj" )
    , ( ( 4, 14 ), "p", "vbppfpncsmhctp" )
    , ( ( 10, 13 ), "k", "kkkkkkkkkkkkkkkkk" )
    , ( ( 3, 5 ), "p", "dnlpp" )
    , ( ( 11, 15 ), "f", "fsffzftkfqflnflf" )
    , ( ( 9, 11 ), "q", "bqdqcqqqqgffqfqmrqlq" )
    , ( ( 1, 10 ), "l", "lszxlhdkgtprglxxl" )
    , ( ( 16, 18 ), "l", "sllllllmlllllllllwl" )
    , ( ( 4, 7 ), "b", "brblbbbtbj" )
    , ( ( 3, 6 ), "n", "rhnntq" )
    , ( ( 7, 9 ), "k", "kjnkjpbkkkkvkjm" )
    , ( ( 11, 12 ), "g", "kvjpqmhcgbrl" )
    , ( ( 3, 12 ), "h", "khhhvhhmchhgfh" )
    , ( ( 3, 4 ), "r", "xmpr" )
    , ( ( 3, 7 ), "m", "mmlmmmmhm" )
    , ( ( 7, 16 ), "m", "mmmlmmlmmmmmmmmmmm" )
    , ( ( 3, 4 ), "b", "sdbbbr" )
    , ( ( 14, 19 ), "k", "hkkkkkjclkgmzvgkkkk" )
    , ( ( 12, 14 ), "w", "ssqgwwcxcqwwww" )
    , ( ( 2, 3 ), "k", "lkkr" )
    , ( ( 1, 7 ), "t", "wtttttlt" )
    , ( ( 4, 8 ), "d", "wdjnqgdf" )
    , ( ( 8, 9 ), "j", "jjsjwjjlj" )
    , ( ( 4, 7 ), "h", "hnhphxhhhq" )
    , ( ( 2, 5 ), "d", "qdjgqdb" )
    , ( ( 3, 5 ), "w", "wpwzwdm" )
    , ( ( 3, 12 ), "n", "pnnngxnjqjhpcntfrvz" )
    , ( ( 10, 15 ), "h", "hhhhhvhhhhhhhhg" )
    , ( ( 4, 6 ), "s", "dwrsksjhtsrjdvmbsbwr" )
    , ( ( 8, 11 ), "v", "vvvvvvvcvvvvvv" )
    , ( ( 4, 5 ), "m", "lnmlmmwsmfsm" )
    , ( ( 7, 16 ), "c", "kvzcrcbcvkcpptdccq" )
    , ( ( 2, 3 ), "b", "bnbbpjp" )
    , ( ( 3, 5 ), "m", "hpjkrmmlwq" )
    , ( ( 3, 7 ), "v", "vvvnlhn" )
    , ( ( 3, 4 ), "b", "bnbbb" )
    , ( ( 3, 6 ), "d", "tkdktrctmjw" )
    , ( ( 3, 5 ), "f", "pffffj" )
    , ( ( 6, 10 ), "t", "ltrgjvjthtpttphrttk" )
    , ( ( 3, 8 ), "s", "ssrkstfgssxxxc" )
    , ( ( 1, 2 ), "d", "sdhkcfdcdg" )
    , ( ( 6, 12 ), "h", "shhhhhzzzhfh" )
    , ( ( 4, 7 ), "j", "jjkzgrj" )
    , ( ( 13, 15 ), "l", "llltlwlllllqzlbldl" )
    , ( ( 5, 9 ), "d", "dzxjdrftsprbldvddk" )
    , ( ( 4, 14 ), "q", "wqsqqxtbfnckzqcqqqq" )
    , ( ( 1, 2 ), "v", "lvdxdwpphqv" )
    , ( ( 5, 6 ), "z", "zpzhzjzqtzh" )
    , ( ( 3, 4 ), "q", "qqqlq" )
    , ( ( 9, 10 ), "v", "svvvhvvvtv" )
    , ( ( 3, 12 ), "g", "kjgmbzgklwfb" )
    , ( ( 10, 15 ), "v", "vvddvvvrhvvmvwvvv" )
    , ( ( 1, 20 ), "j", "kjjjjjjjjkjjpjjjjjjj" )
    , ( ( 6, 8 ), "t", "tttttdtt" )
    , ( ( 11, 12 ), "v", "vvvvvqvvqvxvvv" )
    , ( ( 12, 13 ), "h", "hnhshhhhshhhh" )
    , ( ( 7, 8 ), "z", "vzzzzzrzzzfpz" )
    , ( ( 7, 8 ), "x", "xkxhxxhn" )
    , ( ( 4, 7 ), "b", "hbbzptb" )
    , ( ( 5, 9 ), "d", "fddqjsdbj" )
    , ( ( 3, 10 ), "l", "llllllglxslll" )
    , ( ( 1, 9 ), "b", "dbsbbbbgbb" )
    , ( ( 5, 8 ), "n", "dtnnsnnnn" )
    , ( ( 7, 16 ), "m", "mmmmmmmmmmmmmmmsm" )
    , ( ( 3, 4 ), "f", "nhwk" )
    , ( ( 15, 17 ), "w", "wwfwwxwmwwwwwdswwwww" )
    , ( ( 1, 11 ), "l", "llllllllllll" )
    , ( ( 4, 9 ), "c", "cccccccchcc" )
    , ( ( 2, 3 ), "k", "kkkkbskk" )
    , ( ( 3, 6 ), "s", "nssqtf" )
    , ( ( 4, 5 ), "m", "mmrhm" )
    , ( ( 9, 11 ), "f", "nfnsrfdfnfff" )
    , ( ( 15, 16 ), "k", "kkkkkkkkkkkkkkzhk" )
    , ( ( 6, 9 ), "q", "tzqqxqhnq" )
    , ( ( 3, 11 ), "k", "kkkkkkkkkkck" )
    , ( ( 2, 5 ), "p", "wmpgpmjmrqg" )
    , ( ( 15, 19 ), "r", "rrrrrsrrrrrrhfrrjrr" )
    , ( ( 4, 10 ), "l", "lllsldllll" )
    , ( ( 4, 7 ), "s", "sjhzqns" )
    , ( ( 1, 3 ), "n", "nnknnp" )
    , ( ( 13, 14 ), "j", "hjjgxjzjvjpxjj" )
    , ( ( 4, 5 ), "r", "rrrgrrrrr" )
    , ( ( 10, 11 ), "p", "ppptphpxkpppp" )
    , ( ( 2, 7 ), "j", "fjsnxwpjgqnzjjj" )
    , ( ( 6, 8 ), "k", "kdkkwnvkkkk" )
    , ( ( 2, 5 ), "q", "qdqqjqqwq" )
    , ( ( 5, 7 ), "x", "xdxddbcxvnxxxxhxxxq" )
    , ( ( 2, 6 ), "n", "cnqlmrlwqhdbbvbnhskh" )
    , ( ( 7, 8 ), "z", "zzzzzzzwz" )
    , ( ( 6, 8 ), "r", "llrrtzrpr" )
    , ( ( 1, 7 ), "d", "ddlddvmkddjpd" )
    , ( ( 8, 9 ), "v", "vvvvvvvrkv" )
    , ( ( 18, 19 ), "t", "vtststttfmtqtmttdnz" )
    , ( ( 3, 9 ), "b", "nbwbzntrb" )
    , ( ( 3, 4 ), "r", "pzrrqqrj" )
    , ( ( 5, 9 ), "x", "bvxxllwcf" )
    , ( ( 4, 6 ), "f", "fxmlxf" )
    , ( ( 11, 15 ), "n", "nnqnwnnnwnknnnnnfnn" )
    , ( ( 9, 11 ), "n", "nnnnqnnnnnj" )
    , ( ( 7, 12 ), "k", "kkkkkvjkkksskrkkk" )
    , ( ( 2, 3 ), "b", "cbbvbv" )
    , ( ( 3, 6 ), "x", "xxfldxxxc" )
    , ( ( 6, 11 ), "k", "fkvvkkwkvkpjkjk" )
    , ( ( 10, 16 ), "f", "ffffffmffffffffffff" )
    , ( ( 7, 8 ), "p", "fppplpnc" )
    , ( ( 11, 20 ), "r", "srrrfrrrrrrrrhrrbrrr" )
    , ( ( 13, 17 ), "s", "smssssssssssssssb" )
    , ( ( 5, 8 ), "q", "fcqlqqqq" )
    , ( ( 6, 10 ), "g", "rmpsgrlxcvgtggwgvk" )
    , ( ( 13, 15 ), "h", "hhhhhhhhhcmfhhldhzh" )
    , ( ( 5, 10 ), "q", "qqqqjqqqqqcq" )
    , ( ( 5, 9 ), "m", "lmvcmmsznmmgmmmcs" )
    , ( ( 5, 6 ), "h", "hhhbzr" )
    , ( ( 3, 4 ), "d", "dzdg" )
    , ( ( 11, 14 ), "h", "rfvjnjbzvrhthdxhv" )
    , ( ( 14, 19 ), "g", "ggggggggggggggggggcg" )
    , ( ( 6, 7 ), "m", "mmmmmphg" )
    , ( ( 13, 14 ), "p", "ftzfrppkzrrpgp" )
    , ( ( 12, 16 ), "n", "lxnnnnnngnnbnncnn" )
    , ( ( 8, 9 ), "c", "dqgzbncfccrjtdkc" )
    , ( ( 6, 9 ), "r", "jdrrfrtkmkfltkm" )
    , ( ( 4, 6 ), "g", "dnggrr" )
    , ( ( 3, 4 ), "s", "ssssvs" )
    , ( ( 18, 19 ), "f", "wffffffffsffffffffvf" )
    , ( ( 6, 10 ), "l", "klllbxltll" )
    , ( ( 6, 7 ), "r", "rbdgrrr" )
    , ( ( 17, 18 ), "l", "vjplzpcftlkrllsbqlqg" )
    , ( ( 3, 9 ), "n", "bqnnnnrbxkdsdwnvtwwh" )
    , ( ( 1, 2 ), "w", "qwwt" )
    , ( ( 5, 18 ), "z", "zzzzzzzzzzzzzzzzzlz" )
    , ( ( 2, 7 ), "n", "nbnnnnnnn" )
    , ( ( 14, 15 ), "g", "mcdcmxpxmgkqdhm" )
    , ( ( 18, 19 ), "s", "gsssssssssswssssssss" )
    , ( ( 5, 6 ), "s", "tptssvs" )
    , ( ( 8, 12 ), "c", "cccnbcccmcctclccccx" )
    , ( ( 6, 15 ), "t", "tttttttttmttstf" )
    , ( ( 5, 6 ), "l", "lllklq" )
    , ( ( 7, 9 ), "d", "dqdcdcddxcddmdkrd" )
    , ( ( 4, 5 ), "r", "rrvrxqnzrm" )
    , ( ( 9, 11 ), "p", "pjpppppppppppppp" )
    , ( ( 4, 6 ), "v", "vpvvvvv" )
    , ( ( 6, 9 ), "h", "wwchhhgfh" )
    , ( ( 10, 11 ), "f", "flfcjvtljftfffhff" )
    , ( ( 6, 7 ), "v", "vvvvvvvv" )
    , ( ( 12, 15 ), "k", "kjkkkktkkkkkzvn" )
    , ( ( 6, 9 ), "v", "rsrvvgnwktwvvnvclvvc" )
    , ( ( 2, 12 ), "c", "ccvqsctcwkmkqzc" )
    , ( ( 16, 18 ), "w", "wwwwwwwwwwwwwwwwwwww" )
    , ( ( 17, 18 ), "g", "ggzgggggggglggggsgg" )
    , ( ( 13, 18 ), "v", "vvvvvnvvvgrvvkvtqv" )
    , ( ( 5, 11 ), "k", "kkkkkkkkkkkkkkk" )
    , ( ( 11, 12 ), "f", "ffffffffffvf" )
    , ( ( 1, 7 ), "h", "rstpvhh" )
    , ( ( 11, 14 ), "l", "lrnllwvlnflllfdfllt" )
    , ( ( 5, 7 ), "g", "gcgjgrkgj" )
    , ( ( 7, 18 ), "z", "zzzzzzgzztzzzzzzzxzz" )
    , ( ( 17, 18 ), "v", "vvvvvvvvvvvvmvvvvvvv" )
    , ( ( 16, 18 ), "m", "mmmmhmmmmmtmmmmvmx" )
    , ( ( 1, 3 ), "z", "vzzzwz" )
    , ( ( 5, 6 ), "n", "nnnhnq" )
    , ( ( 8, 15 ), "r", "jsrprrrrmrrkgrkrr" )
    , ( ( 2, 12 ), "g", "txwxcgwfqkfg" )
    , ( ( 9, 15 ), "l", "ldlllllllllllll" )
    , ( ( 3, 5 ), "f", "gfbsf" )
    , ( ( 15, 16 ), "v", "vvhrnzxfvvvvcwjv" )
    , ( ( 4, 15 ), "c", "cccmccccccccccccccc" )
    , ( ( 7, 13 ), "l", "bwlzlxzllctjcf" )
    , ( ( 1, 3 ), "q", "rsgtq" )
    , ( ( 4, 9 ), "n", "npznnnvvnzg" )
    , ( ( 3, 7 ), "z", "sqtczzfzzrzfz" )
    , ( ( 2, 3 ), "k", "ckkrjnkglnz" )
    , ( ( 9, 10 ), "q", "qqqqqqwqjqqfq" )
    , ( ( 4, 11 ), "v", "vvvbvvvvvvnvvd" )
    , ( ( 5, 7 ), "n", "lbwxnnnncnnwnv" )
    , ( ( 8, 9 ), "k", "kgkkkkkjf" )
    , ( ( 7, 9 ), "l", "llllllllll" )
    , ( ( 15, 19 ), "p", "pppbpcppxcptppvmpppb" )
    , ( ( 3, 4 ), "m", "fqmwcncsmp" )
    ]


data1 : List number
data1 =
    [ 1227
    , 1065
    , 329
    , 1063
    , 1889
    , 1700
    , 1805
    , 1373
    , 389
    , 1263
    , 1276
    , 1136
    , 1652
    , 1981
    , 1406
    , 1249
    , 1197
    , 1379
    , 1050
    , 1791
    , 1703
    , 2001
    , 1842
    , 1707
    , 1486
    , 1204
    , 1821
    , 1807
    , 1712
    , 1871
    , 1599
    , 1390
    , 1219
    , 1612
    , 1980
    , 1857
    , 1511
    , 1702
    , 1455
    , 1303
    , 1052
    , 1754
    , 1545
    , 1488
    , 1848
    , 1236
    , 1549
    , 1887
    , 1970
    , 1123
    , 1686
    , 1404
    , 1688
    , 1106
    , 1296
    , 401
    , 1829
    , 1693
    , 1389
    , 1957
    , 914
    , 1176
    , 1348
    , 1275
    , 1624
    , 1401
    , 1045
    , 1396
    , 1352
    , 1569
    , 1060
    , 1235
    , 1679
    , 1503
    , 1340
    , 1872
    , 1410
    , 1077
    , 958
    , 1681
    , 1189
    , 1466
    , 1087
    , 1852
    , 1293
    , 1139
    , 1300
    , 1323
    , 661
    , 1388
    , 1983
    , 1325
    , 1112
    , 1774
    , 1858
    , 1785
    , 1616
    , 1255
    , 1198
    , 1354
    , 1124
    , 1834
    , 1417
    , 1918
    , 1496
    , 33
    , 1150
    , 1861
    , 1172
    , 2006
    , 1199
    , 1558
    , 1919
    , 1620
    , 1613
    , 1710
    , 1477
    , 1592
    , 1709
    , 1909
    , 1670
    , 1922
    , 1840
    , 1768
    , 1982
    , 1193
    , 1736
    , 1877
    , 1770
    , 1191
    , 1433
    , 1072
    , 1148
    , 1225
    , 1147
    , 1171
    , 1424
    , 1913
    , 1228
    , 1339
    , 1814
    , 1504
    , 1251
    , 1240
    , 1272
    , 1500
    , 1927
    , 1428
    , 1641
    , 1453
    , 1729
    , 1976
    , 1808
    , 1180
    , 1024
    , 1108
    , 1085
    , 1669
    , 1636
    , 1005
    , 1520
    , 1929
    , 1626
    , 1551
    , 1234
    , 1988
    , 1256
    , 1524
    , 1571
    , 1506
    , 1977
    , 1749
    , 1408
    , 1540
    , 1934
    , 1810
    , 1328
    , 1910
    , 1478
    , 1600
    , 1699
    , 1413
    , 1446
    , 1798
    , 1013
    , 1998
    , 1661
    , 1058
    , 1051
    , 1220
    , 1447
    , 1675
    , 1912
    , 1668
    , 1932
    , 1962
    , 1055
    , 1757
    , 1116
    , 1090
    ]
