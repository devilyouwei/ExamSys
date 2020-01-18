-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-06-13 02:24:40
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exam`
--

-- --------------------------------------------------------

--
-- 表的结构 `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `c_select` int(3) NOT NULL,
  `c_multselect` int(3) NOT NULL,
  `c_fill` int(3) NOT NULL,
  `c_tf` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `exam`
--

INSERT INTO `exam` (`id`, `title`, `create_time`, `time`, `c_select`, `c_multselect`, `c_fill`, `c_tf`) VALUES
(1, '第一场考试！', 1496329843, 3600, 1, 1, 1, 1),
(2, 'ceshi', 1497187391, 3600, 3, 4, 4, 3);

-- --------------------------------------------------------

--
-- 表的结构 `exam_user`
--

CREATE TABLE `exam_user` (
  `id` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `score` int(3) NOT NULL,
  `done` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `exam_user`
--

INSERT INTO `exam_user` (`id`, `eid`, `uid`, `title`, `username`, `score`, `done`, `create_time`, `time`) VALUES
(1, 1, 2, '第一场考试！', 'zm', 0, 1, 1496329870, 3600),
(4, 2, 2, 'ceshi', 'zm', 0, 1, 1497187402, 3600);

-- --------------------------------------------------------

--
-- 表的结构 `q_fill`
--

CREATE TABLE `q_fill` (
  `id` int(11) NOT NULL,
  `ques` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `q_judge`
--

CREATE TABLE `q_judge` (
  `id` int(11) NOT NULL,
  `ques` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `q_judge`
--

INSERT INTO `q_judge` (`id`, `ques`, `answer`) VALUES
(1, '题目', '选择'),
(2, '当前，绝大多数各级党的组织和党员干部都能够按照中央要求，认真维护、严格遵守党的政治纪律，主流是好的。', '对'),
(3, '习近平同志指出，党的力量来自人民，人民能使力量倍增。', '错'),
(4, '习近平重新提倡政治规矩，其本质是为了维护党中央权威、维护党内团结统一、重塑党组织的纪律性和约束力，净化党的政治生态。', '对'),
(5, '领导班子成员对于职责分工内的事情，要认真抓好落实，特殊情况可以越位、缺位和错位。', '错'),
(6, '供给管理认为经济下行是结构问题。', '对'),
(7, '经济萧条阶段的功能就是强制性地挤出泡沫，强制性地淘汰落后，调整和提升结构，刺激创新。', '对'),
(8, '市场经济下的创新主要是政府的创新，政府是市场经济下创新的主体。', '错'),
(9, '进行资源配置，要更加注重政府在资源配置中起决定性作用。', '错'),
(10, '市场是否出清是供给侧管理和需求侧管理的核心区别。', '对'),
(11, '从企业性质来看，国企的杠杆率显著高于民营企业。', '对'),
(12, '指导思想是一个政党的精神旗帜。', '对'),
(13, '马克思主义的整个世界观不是教义，而是方法。', '对'),
(14, '时代是思想之母，实践是理论之源。', '对'),
(15, '中国共产党之所以叫共产党，就是因为从成立之日起我们党就把共产主义确立为远大理想。', '对'),
(16, '中国特色社会主义理论体系是指导党和人民沿着中国特色社会主义道路实现中华民族伟大复兴的正确理论。', '对'),
(17, '党的基本路线是国家的生命线、人民的幸福线。', '对'),
(18, '人民立场是中国共产党的根本政治立场，是马克思主义政党区别于其他政党的显著标志。', '对'),
(19, '带领人民创造幸福生活，是我们党始终不渝的奋斗目标。', '对'),
(20, '尊重人民主体地位，保证人民当家作主，是我们党的一贯主张。', '对'),
(21, '中国外交政策的宗旨是维护世界和平、促进共同发展。', '对'),
(22, '治国必先治党，治党务必从严。', '对'),
(23, '在领土主权和海洋权益问题上，绝不接受单方面诉诸第三方争议解决办法，是中国的一贯立场。', '对'),
(24, '自唐贞元以来，中国已将南沙群岛列入了中国的版图。', '对'),
(25, '在清代， 中国政府将南沙群岛标绘在权威性地图上， 对南沙群岛行使行政管辖。', '对'),
(26, '当前我国在改革完善粮食等重要农产品价格形成机制和收储制度方面，坚持市场化改革取向与保护农民利益并重，采取“分品种施策、激进式推进”的办法，完善农产品市场调控制度。', '错'),
(27, '2016年中央一号文件，提出要优先保障财政对农业农村的投入，但是不再将农业农村作为国家固定资产投资的重点领域。', '错'),
(28, '“十三五”期间，我国农业多功能需求不足，成为农业发展的障碍。', '错'),
(29, '当前国家现代农业示范区已成为引领全国农业现代化的先行区。', '对'),
(30, '“十三五”期间，我国新型工业化、信息化、城镇化快速推进，城乡共同发展新格局加快建立，为推进“四化”同步发展提供强劲拉动力。', '对'),
(31, '“十三五”时期，我国农业现代化建设仍处于补齐短板、大有作为的重要战略机遇期。', '对'),
(32, '2012年，“九二共识”首次被写入了政府工作报告。', '对'),
(33, '蔡英文上台后以各种方式推行“刚性台独”，以期最后实现“事实台独”。', '错'),
(34, '蔡英文的两岸政策有利于台湾在全球经济区域一体化过程的发展。', '错'),
(35, '《联合报》认为，马英九是近年来反对“台独”立场最为鲜明的国民党主席。', '错'),
(36, '国民党是两岸关系和平发展局面的开创力量。', '对'),
(37, '“两岸和平发展论坛”的前身就是国共论坛。', '对'),
(38, '特朗普在竞选阶段总体体现外交优先，内政次之的执政主张。', '错'),
(39, '美国总统选举实行选举人团制的直接选举制度。', '错'),
(40, '总统就职典礼是美国总统选举的最后一道程序。', '对'),
(41, '此次美国大选反映出的社会矛盾，本质上是美国金融垄断寡头过度扩张带来的必然结果。', '对');

-- --------------------------------------------------------

--
-- 表的结构 `q_mulsel`
--

CREATE TABLE `q_mulsel` (
  `id` int(11) NOT NULL,
  `ques` varchar(255) NOT NULL,
  `item0` varchar(255) NOT NULL,
  `item1` varchar(255) NOT NULL,
  `item2` varchar(255) NOT NULL,
  `item3` varchar(255) NOT NULL,
  `item4` varchar(255) NOT NULL,
  `item5` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `q_mulsel`
--

INSERT INTO `q_mulsel` (`id`, `ques`, `item0`, `item1`, `item2`, `item3`, `item4`, `item5`, `answer`) VALUES
(1, '题目', '选项1', '选项2', '选项3', '选项4', '', '', '正确答案'),
(2, '政治纪律是各级党组织和全体党员在（  ）方面必须遵守的规矩，是维护党的团结统一的根本保证。', 'A 政治方向', 'B 政治立场', 'C 政治言论', 'D 政治行为', '', '', 'ABCD'),
(3, '以党支部为单位召开全体党员会议，组织党员开展民主评议。对照党员标准，按照（     ）的程序，对党员进行评议。', 'A 个人自评', 'B 党员互评', 'C 民主测评', 'D 组织评定', '', '', 'ABCD'),
(4, '“两学一做”坚持（    ）与（   ）的内在统一，以“关键在做”的根本性要求，为学习教育确定了明确的主题归属。', 'A 思想教育', 'B 文化教育', 'C 行动落实', 'D 行为教育', '', '', 'AC'),
(5, '随着“供给侧改革”的提出，延续了多年的（    ）“三驾马车”在经济增长中的地位将逐渐弱化。', 'A 出口', 'B 进口', 'C 投资', 'D 消费', '', '', 'ACD'),
(6, '供给侧管理的手段主要包括（    ）。', 'A 产能整合', 'B 促改革提高效率', 'C 调结构', 'D 改善人口结构和劳动力质量', '', '', 'BCD'),
(7, '根据党中央和国务院部署，着力加强供给侧结构性改革，就是要实施好相互配合的几大政策支柱，即（    ）。', 'A 宏观政策要稳', 'B 产业政策要准', 'C 微观政策要活', 'D 改革政策要实', '', '', 'ABCD'),
(8, '这些年，我国存在产业结构失衡、部分产能过剩、先进制造业发展不足等问题，亟需把产业政策的大方向准确定位到结构性改革上，（    ），着力补齐短板，加快绿色发展。', 'A 推进农业现代化', 'B 加快工业建设', 'C 加快制造强国建设', 'D 加快服务业发展', '', '', 'ACD'),
(9, '产业政策要准，首要一点是明确控什么，扶什么，推动制造业（    ），支持企业技术改造和设备更新。', 'A 高端化', 'B 智能化', 'C 绿色化', 'D 服务化', '', '', 'ABCD'),
(10, '目前我国经济增长出现减速趋势，经济发展中（    ）等矛盾依然非常突出。', 'A 不平衡', 'B 不协调', 'C 不包容', 'D 不可持续', '', '', 'ABCD'),
(11, '公共政策应向符合国家产业政策导向的（   ）和（   ）倾斜，财政支出逐步向民生倾斜，加大对困难群体的扶持力度。', 'A 大中型企业', 'B 小型微型企业', 'C 劳动密集型产业', 'D 资金密集型企业', '', '', 'BD'),
(12, '鼓励和引导金融机构支持符合国家产业政策导向的（   ）发展，加大支出自主创业力度。', 'A 劳动密集型产业', 'B 服务业', 'C 大中型企业', 'D 小型微型企业', '', '', 'ABD'),
(13, '努力推进重点、困难群体就业。要加紧消除流动就业的制度壁垒，进一步完善（    ）“三位一体”的工作机制。', 'A 职业培训', 'B 政策引领', 'C 就业服务', 'D 劳动维权', '', '', 'ACD'),
(14, '全党要坚定（  ）。', 'A 道路自信', 'B 理论自信', 'C 制度自信', 'D 文化自信', '', '', 'ABCD'),
(15, '中国特色社会主义道路是（）的必由之路。', 'A 实现社会主义现代化', 'B 全面摆脱贫困', 'C 创造人民美好生活', 'D 实现世界强国', '', '', 'AC'),
(16, '“五位一体”的总体布局包括（  ）。', 'A 经济建设', 'B 政治建设', 'C 文化建设', 'D 社会建设和生态文明建设', '', '', 'ABCD'),
(17, '“四个全面”的战略布局包括（  ）。', 'A 全面建成小康社会', 'B 全面深化改革', 'C 全面依法治国', 'D 全面从严治党', '', '', 'ABCD'),
(18, '我国当前国情包括（  ）。', 'A 我国仍处于并将长期处于社会主义初级阶段', 'B 人民日益增长的物质文化需要同落后的社会生产之间的矛盾仍是社会主要矛盾', 'C 人民日益增长的物质文化需要同落后的社会生产之间的矛盾这一社会主要矛盾', 'D 当前已全面消除了贫困', '', '', 'ABC'),
(19, '全面依法治国的核心是（  ）有机统一。', 'A 坚持党的领导', 'B 人民当家作主', 'C 依法治国', 'D 全面从严治党', '', '', 'ABC'),
(20, '我国掌握南海局势制动权的方法包括（    ）。', 'A 通过钻井、固岛、巡海、修法等实质性措施加强在南海地区的实际存在', 'B 提出解决南海问题“双轨模式”', 'C 发布《中国关于菲律宾共和国所提南海仲裁管辖权问题的立场文》', 'D 大力推进“一带一路”战略构想', '', '', 'ABCD'),
(21, '在南海四大群岛中，我国实际控制的有（   ）。', 'A 西沙群岛', 'B 中沙群岛', 'C 南沙群岛', 'D 东沙群岛', '', '', 'ABD'),
(22, '中华人民共和国建立后，南沙群岛先后被划归（）管辖。', 'A 广东省', 'B 广西壮族自治区', 'C 海南省', 'D 云南省', '', '', 'AC'),
(23, '中国共产党对于权力运行制约和监督机制，提出（    ）。', 'A 用权必担责', 'B 有权必有责', 'C 滥权必追责', 'D 个别人权力允许不受制约', '', '', 'ABC'),
(24, '党中央提出要建立廉洁政治，坚决反对腐败，从体制机制上提出了“三不”，是指（      ）。', 'A 不会腐', 'B 不能腐', 'C 不敢腐', 'D 不想腐', '', '', 'BCD'),
(25, '党的各级领导干部是人民公仆，没有搞特殊化的权利，要带头执行廉洁自律准则，自觉同特权思想和特权现象作斗争，注重（    ），教育管理好亲属和身边工作人员。', 'A 家庭', 'B 家教', 'C 家风', 'D 家族', '', '', 'ABC'),
(26, '根据党纪党规，下列行为中，要坚决反对的有（    ）。', 'A 以言代法', 'B 以权压法', 'C 徇私枉法', 'D 领导干部享有搞特殊化的权利', '', '', 'ABCD'),
(27, '党的十八届六中全会强调，要坚持有腐必反、有贪必肃，坚持（    ），党内决不允许有腐败分子藏身之地。', 'A 无禁区', 'B 全覆盖', 'C 零容忍', 'D 有弹性', '', '', 'ABC'),
(28, '新形势下，党内监督要重点解决的问题有（    ）。', 'A 党的领导弱化', 'B 党的建设缺失', 'C 党的观念淡漠', 'D 管党治党宽松软', '', '', 'ABCD'),
(29, '2016年3月开始修订《中国共产党党内监督条例》，着重突出的特点包括（）。', 'A 突出尊崇党章，聚焦全面从严治党', 'B 突出“两个围绕”，强化担当精神', 'C 突出民主集中制，维护党的集中统一。', 'D 突出关键少数，重点盯住一把手', '', '', 'ABCD'),
(30, '下列关于监督主体、监督职责的划分的说法中，符合《中国共产党党内监督条例》精神的有（  ）。', 'A 党中央和中央领导同志应该排除在党内监督之外', 'B  党委(党组)在党内监督中负主体责任，书记是第一责任人', 'C 纪委是党内监督的专责机关，履行监督执纪问责职责', 'D 党内监督没有禁区、没有例外', '', '', 'BCD'),
(31, '2016年3月开始修订《中国共产党党内监督条例》，所把握的原则包括（    ）。', 'A 坚持党的领导、强化责任担当', 'B 坚持问题导向，不贪大求全', 'C 坚持信任不能代替监督，强调党内监督没有禁区、没有例外', 'D 坚持民主集中制，强化自上而下的组织监督', '', '', 'ABCD'),
(32, '2016年3月修订《中国共产党党内监督条例》所坚持的“两个围绕”，是（    ）。', 'A 围绕理论、思想、制度构建体系', 'B 围绕权力、责任、担当设计制度', 'C 围绕权力话担当', 'D 围绕权利话义务', '', '', 'AB'),
(33, '现在我国产量稳居世界第一的产品有（  ）。', 'A 肉类', 'B 禽蛋', 'C 蔬菜', 'D 水果和水产品', '', '', 'ABCD'),
(34, '农业现代化是农业发展的根本方向，农业现代化的重要标志包括（    ）。', 'A 完善的基础设施', 'B 先进的科技', 'C 先进的农机装备', 'D 持续的农民增收', '', '', 'ABC'),
(35, '“十二五”期间，我国新农村建设所取得的重大进展，包括（    ）。', 'A 是农村人居环境整治力度大', 'B 是农村危房改造力度大', 'C 是休闲农业与乡村旅游蓬勃发展', 'D 是农村社会事业和社会保险制度基本建立', '', '', 'ABCD'),
(36, '我国农村改革从20世纪80年代初期开始到现在大体经历了三个阶段，依次是（    ）。', 'A 改革农村经营体制，侧重处理好农民与集体的关系', 'B 是改革农村税费制度，侧重处理好农民与国家的关系', 'C 推进农村土地制度改革，构建新型农业经营体系，建立健全城乡发展一体化 制度，侧重处理好工农城乡关系', 'D 稳定和完善农村基本经营制度', '', '', 'ABC'),
(37, '在农村土地产权关系方面，习近平总书记强调的“三权分置”，是指（    ），这是农户承包耕地制度的一项重大改革。', 'A 赋予农民自主权', 'B 落实集体所有权', 'C 稳定农户承包权', 'D 放活土地经营权', '', '', 'BCD'),
(38, '2016年，我国在推动金融资源更多向农村倾斜方面，实施的举措有（    ）。', 'A  开展农村信用社省联社改革试点，逐步淡出行政管理，强化服务职能', 'B 鼓励国有和股份制金融机构拓展“三农”业务', 'C 支持中国邮政储蓄银行建立三农金融事业部，打造专业化为农服务体系', 'D 引导互联网金融、移动金融在农村规范发展', '', '', 'ABCD'),
(39, '“十三五”时期，我国农业现代化面临的挑战，主要有（    ）。', 'A 在居民消费结构升级的背景下，部分农产品供求结构性失衡的问题日益凸显', 'B 在资源环境约束趋紧的背景下，农业发展方式粗放的问题日益凸显', 'C 在经济发展速度放缓、动力转换的背景下，农民持续增收难度加大的问题日益凸显', 'D 农业基础设施加快改善，农产品供给充裕，农民发展规模经营主动性 不断增强', '', '', 'ABC'),
(40, '根据我国农业发展规划目标，到2020年，全国农业现代化取得明显进展，基本实现农业现代化的包括（    ）。', 'A 东部沿海发达地区', 'B 大城市郊区', 'C 国有垦区', 'D 国家现代农业示范区', '', '', 'ABCD'),
(41, '“十三五”时期，我国农业现代化建设仍处于补齐短板、大有作为的重要战略机遇期，遵循农业现代化发展规律，必须推动农业现代化与（  ）同步发展。', 'A 新型工业化', 'B 信息化', 'C 城镇化', 'D 国防现代化', '', '', 'ABC'),
(42, '我国“十三五”农业现代化主要指标涉及的内容包括（    ）。', 'A 粮食供给保障', 'B 农业结构', 'C 质量效益', 'D 可持续发展', '', '', 'ABCD'),
(43, 'RCEP是应对（  ）和（  ）的发展而提出来的。', 'A 经济全球化', 'B 区域经济一体化', 'C 自由贸易', 'D 稳健的货币政策', '', '', 'AB'),
(44, '下面哪些选项是RCEP的目标（    ）。', 'A 消除内部贸易壁垒', 'B 创造和完善自由的投资环境', 'C 扩大服务贸易', 'D 全面开放市场', '', '', 'ABC'),
(45, '回顾过去二十多年两岸关系呈现出（    ）的起伏轨迹。', 'A 发展', 'B 停滞', 'C 高度发展', 'D 陷入僵局', '', '', 'ABCD'),
(46, '2016年11月2日召开的“两岸和平发展论坛”共分政治等哪几个组别？', 'A 经济', 'B 文化', 'C 社会', 'D 青年', '', '', 'ABCD'),
(47, '美国总统选举过程包括党内预选、各党确定各自总统候选人（   ）等环节。', 'A 总统候选人竞选', 'B 全国选民投票', 'C 选举人团投票', 'D 当选总统就职', '', '', 'ABCD'),
(48, '美国民众最深层次的焦虑是来自于（    ）和（    ）的不断加剧。', 'A 机会不平等', 'B 收入不平等', 'C 分配不平等', 'D 种族歧视', '', '', 'AB'),
(49, '其实，特朗普所提出的“改革”基调是（    ）的，不可能解决美国的积重难返的困境。', 'A 片面的', 'B 排外的', 'C 保守的', 'D 倒退的', '', '', 'BCD'),
(50, '崔天凯大使表示，中美经贸关系的本质是（    ），（    ）是两国唯一正确选择。', 'A 互利共赢', 'B 合作', 'C 改革', 'D 发展', '', '', 'AB'),
(51, '中美的经贸问题主要是（    ）。', 'A 贸易逆差', 'B 市场竞争', 'C 货币分歧', 'D 知识产权保护', '', '', 'ABCD'),
(52, '马英九执政，两岸逐渐开启了（    ）的新模式。', 'A 大交流', 'B 大合作', 'C 大融合', 'D 大发展', '', '', 'ABD'),
(53, '习近平在推动两岸交流中就青少年交流方面提出要鼓励青少年（    ）。', 'A 早接触', 'B 多交往', 'C 共创业', 'D 增进亲情', '', '', 'ABD'),
(54, '中美的摩擦和矛盾主要集中在以下哪些领域（   ）？', 'A 安全', 'B 经贸', 'C 意识形态', 'D 军事', '', '', 'ABC'),
(55, '从根本上说，中美关系的形态取决于（    ）？', 'A 民意', 'B 两国力量对比变化', 'C 战略管控能力', 'D 领导层的意志', '', '', 'BC'),
(56, '中美的安全问题主要集中于以下哪些领域（    ）？', 'A 半岛安全', 'B 南海争端', 'C 东南亚危机', 'D 台湾事务', '', '', 'BCD'),
(57, '美国大选反映了美国政治形态的哪些变化（    ）？', 'A 美国两党力量格局的重大变化', 'B 美国社会认同出现巨大裂痕', 'C 美国社会的自我革新', 'D 美国政治形态的世代更替', '', '', 'ABD'),
(58, '此次选举反映出来的认同分裂包括上层富人和中下层之间的对立，（    ）等等。', 'A 白人社会与有色种族群的冲突', 'B 沿海地区和内陆地区的分歧', 'C 性别、各利益集团之间的偏见', 'D 上层精英和广大中下层的对立', '', '', 'ABCD'),
(59, '从深层次来看，特朗普的胜选嬴在哪些因素？（    ）', 'A 美国贫富差距过大', 'B 草根民众的不满情意', 'C 白人的身份焦虑危机', 'D 利用社交媒体的竞选策略', '', '', 'ABCD'),
(60, '在竞选总统的投票站里，浓缩着一个（    ）的美国。', 'A 积极向上', 'B 分裂', 'C 焦虑', 'D 渴望变革', '', '', 'BCD'),
(61, '目前美国社会矛盾激化，反映了全球趋势下美国哪些方面严重滞后的更深层次矛盾。（    ）', 'A 利益结构', 'B 产业结构', 'C 处理种族主义的理念', 'D 政府资源配置', '', '', 'ABD'),
(62, '美国高层中的哪些思想导致世界范围的全球治理将面临更大困难？（    ）', 'A 种族主义', 'B 保护主义', 'C 孤立主义', 'D 反全球化倾向', '', '', 'BCD');

-- --------------------------------------------------------

--
-- 表的结构 `q_select`
--

CREATE TABLE `q_select` (
  `id` int(11) NOT NULL,
  `ques` varchar(255) NOT NULL,
  `item0` varchar(255) NOT NULL,
  `item1` varchar(255) NOT NULL,
  `item2` varchar(255) NOT NULL,
  `item3` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `q_select`
--

INSERT INTO `q_select` (`id`, `ques`, `item0`, `item1`, `item2`, `item3`, `answer`) VALUES
(1, '题目', '选项1', '选项2', '选项3', '选项4', '正确答案'),
(2, '（    ）是党在一定历史时期行动的主要任务、奋斗目标、基本路线，其总揽全局，是党的建设依据。', 'A 政治路线', 'B 经济路线', 'C 文化路线', 'D 思想路线', 'A'),
(3, '党的组织纪律的核心是党的民主集中制原则，而（     ）则是党的民主集中制原则的重要内容之一，是党的纪律建设的核心内容。', 'A 四个自信', 'B 四个服从', 'C 四个意识', 'D 四个全面', 'B'),
(4, '全面从严治党，核心是加强（    ），基础在全面，关键在严、要害在治。', 'A 政治建设', 'B 经济建设', 'C 群众基础', 'D 党的领导', 'D'),
(5, '习近平同志在2015年“两会”期间参加（    ）代表团审议时强调：自然生态要山清水秀，政治生态也要山清水秀。严惩腐败分子是保持政治生态山清水秀的必然要求。', 'A 湖南', 'B 江苏', 'C 江西', 'D 山东', 'C'),
(6, '在“两学一做”的主要措施中，不设党小组的，以党支部为单位集中学习，党支部（    ）召开一次全体党员会议，每次围绕一个专题组织讨论。', 'A 每个月', 'B 每星期', 'C 每季度', 'D 每年', 'C'),
(7, '近年来，新一届政府坚持宏观要稳、微观要活的调控思路，企业的外部环境进一步改善。政府机构改革顺利推进，职能转变步伐加快，（   ）多项行政审批项目被取消或下放。', 'A 200', 'B 150', 'C 120', 'D 100', 'D'),
(8, '推进供给侧结构性改革总体思路，必须实施相互配合的（   ）政策支柱，社会政策要托底是其中之一。', 'A 四大', 'B 五大', 'C 六大', 'D 七大', 'B'),
(9, '2016供给侧改革重点推动钢铁产业结构调整，整合分散钢铁产能，推动城市钢厂搬迁，优化产业布局，压缩钢铁产能总量（   ）万吨以上。', 'A 5000', 'B 6000', 'C 7000', 'D 8000', 'D'),
(10, '2015年年底前淘汰16万安倍以下预焙槽，以及2015年年底后达不到规范条件的产能，用电价格在标准价格基础上上浮（  ）。', 'A 0.05', 'B 0.1', 'C 0.15', 'D 0.2', 'B'),
(11, '1997-2015年期间，我国的增量资本产出率平均为（    ）左右。', 'A 3.8', 'B 4', 'C 4.2', 'D 3.5', 'C'),
(12, '（    ）则是在提高生产效率、推动经济增长中改善债务结构，以行政力量与市场手段并举、以可控方式和可控节奏逐步消化泡沫和杠杆问题。', 'A 加杠杆', 'B 去杠杆', 'C 去产能', 'D 去库存', 'B'),
(13, '无论是消费升级还是产业培育，挖掘新动能的根本在于（   ）。', 'A 制度', 'B 文化', 'C 创新', 'D 政策', 'C'),
(14, '截止2015年年底，全国依然有（   ）多万贫困群众，相当于一个中等省份的人口总量。', 'A 3000', 'B 4000', 'C 5000', 'D 6000', 'C'),
(15, '习近平同志指出，严明党的纪律，首要的是要严明（   ）纪律。', 'A 政治', 'B 组织', 'C 生活', 'D 生态', 'A'),
(16, '群众史观是马克思主义唯物史观的基本观点，（    ）是我们党的生命线和根本工作路线。', 'A 经济路线', 'B 政治路线', 'C 群众路线', 'D 文化路线', 'C'),
(17, '党的组织路线是党在一定历史时期内根据政治路线的需要而制定的关于组织工作总的原则和方针，其中最重要的是（   ）。', 'A 组织建设', 'B 干部队伍建设', 'C 群众基础', 'D 思想建设', 'B'),
(18, '习近平指出，我们党是按照马克思主义建党原则建立起来的政党，我们党以（   ）为根本组织制度和领导制度，组织严密是党的光荣传统和独特优势。', 'A 民主集中制', 'B 思想基本原则', 'C 四个自行', 'D 四个服从', 'A'),
(19, '习近平强调，如果党的政治纪律成了摆设，就会形成（   ），使党的章程、原则、制度、部署丧失严肃性和权威性。', 'A 蝴蝶效应', 'B 破窗效应', 'C 木桶效应', 'D 近因效应', 'B'),
(20, '2016年7月1日，我们党成立（）周年。', 'A 93', 'B 94', 'C 95', 'D 96', 'C'),
(21, '至中华人民共和国成立，我们党团结带领中国人民进行了（）年浴血奋战。', 'A 27', 'B 28', 'C 29', 'D 30', 'B'),
(22, '我国当前是世界第（）大经济体。', 'A 一', 'B 二', 'C 三', 'D 四', 'B'),
(23, '（）是我们立党立国的根本指导思想。', 'A 马克思主义', 'B 实事求是', 'C 坚持党的领域', 'D 民主集中制', 'A'),
(24, '（）是更基础、更广泛、更深厚的自信。', 'A 道路自信', 'B 理论自信', 'C 制度自信', 'D 文化自信', 'D'),
(25, '民族精神的核心是（）。', 'A 爱国主义', 'B 集体主义', 'C 改革创新', 'D 实事求是', 'A'),
(26, '时代精神的核心是（）。', 'A 爱国主义', 'B 集体主义', 'C 改革创新', 'D 实事求是', 'C'),
(27, '到 2020 年中国共产党成立 100 年时实现的第一个百年奋斗目标是（）。', 'A 全面建成小康社会', 'B 全面摆脱贫困', 'C 建成富强民主文明和谐的社会主义现代化国家', 'D 达到中等发达国有水平', 'A'),
(28, '到本世纪中叶中华人民共和国成立 100 年时实现的第二个百年奋斗目标是（）。', 'A 全面建成小康社会', 'B 全面摆脱贫困', 'C 建成富强民主文明和谐的社会主义现代化国家', 'D 达到中等发达国有水平', 'C'),
(29, '（）是党执政兴国的第一要务，是解决中国所有问题的关键。', 'A 反腐', 'B 创新', 'C 改革', 'D发展', 'D'),
(30, '（）是当代中国最鲜明的特色，是我们党在新的历史时期最鲜明的旗帜。', 'A 发展', 'B 改革开放', 'C 全面反腐', 'D 理论创新', 'B'),
(31, '中国特色社会主义最本质的特征是（）。', 'A 中国共产党领导', 'B 坚持人民民主地位', 'C 坚持与时俱进', 'D 坚持改革开放', 'A'),
(32, '中国特色社会主义制度的最大优势是（）。', 'A 中国共产党领导', 'B 坚持人民民主地位', 'C 坚持与时俱进', 'D 坚持改革开放', 'A'),
(33, '党和国家的根本所在、命脉所在是（）。', 'A 坚持和完善党的领导', 'B 坚持人民民主地位', 'C 坚持与时俱进', 'D 坚持改革开放', 'A'),
(34, '（）是全面从严治党的基础。', 'A 坚持和完善党的领导', 'B 坚持人民民主地位', 'C 坚持与时俱进', 'D 严肃党内政治生活', 'D'),
(35, '我们党作为执政党，面临的最大威胁就是（）。', 'A 台独', 'B 台独', 'C 腐败', 'D 国内外敌对势力', 'C'),
(36, '大量翔实的史实证明，南沙群岛是（）人民最早发现和开发经营的。', 'A 中国', 'B 越南', 'C 菲律宾', 'D 老挝', 'A'),
(37, '南海面积约为（）万平方千米。', 'A 300', 'B 350', 'C 400', 'D 450', 'B'),
(38, '南海约等于我国的渤海、黄海和东海总面积的（）倍。', 'A 2', 'B 3', 'C 4', 'D 5', 'B'),
(39, '南海争端争执的焦点在（  ）。', 'A 西沙群岛', 'B 北沙群岛', 'C 南沙群岛', 'D 东沙群岛', 'C'),
(40, '华南沿海一带从中国（ ）开始已经是中国领土。', 'A 商朝', 'B 周朝', 'C 秦朝', 'D 汉朝', 'C'),
(41, '南海周边国家从（  ）朝开始到清朝是中国中央政府的藩属国。', 'A 南北', 'B 唐', 'C 宋', 'D 元', 'D'),
(42, '中国人民在发现南沙群岛后，最迟自（  ）以来就一直在南沙群岛及其附近海域从事捕捞、种植等生产经营活动。', 'A 商周', 'B 两汉', 'C 唐宋', 'D 宋元', 'C'),
(43, '1939 年，（  ）侵占了南海诸岛。', 'A 菲律宾', 'B 越南', 'C 日本', 'D 英国', 'C'),
(44, '非法占据我国南海诸岛最早的是（  ）。', 'A 越南', 'B 菲律宾', 'C 马来西亚', 'D 印尼', 'A'),
(45, '非法占据我国南海诸岛最多的是（  ）。', 'A 越南', 'B 菲律宾', 'C 马来西亚', 'D 印尼', 'B'),
(46, '非法占据我国南海诸岛最肥的是（  ）。', 'A 越南', 'B 菲律宾', 'C 马来西亚', 'D 印尼', 'C'),
(47, '经过南海海域的国际贸易量占全球贸易量的（  ）左右。', 'A 50%', 'B 60%', 'C 70%', 'D 80%', 'D'),
(48, '办好中国的事情，关键在党，关键在（  ）。', 'A 反腐倡廉', 'B  执行力', 'C  科学发展', 'D 党要管党、从严治党', 'D'),
(49, '新形势下，加强和规范党内政治生活，必须以（  ）为根本遵循。', 'A  党章', 'B 习近平总书记系列重要讲话', 'C  毛泽东思想', 'D 中国特色社会主义理论体系', 'A'),
(50, '当前中国共产党努力打造的生动活泼的政治局面可以概括为“既有集中又有民主，既有纪律又有自由，既有统一意志又有（  ）。', 'A  群众路线', 'B 集思广益', 'C  积极性', 'D 个人心情舒畅', 'D'),
(51, '新形势下，加强和规范党内政治生活，重点是（  ）。', 'A 各级领导机关和领导干部', 'B 高级干部', 'C 中央政治局', 'D 中央委员会', 'A'),
(52, '当前“两学一做”活动中，提出的“四个意识”是指政治意识、大局意识、核心意识、（  ）。', 'A  危机意识', 'B  傲娇意识', 'C 看齐意识', 'D  自豪意识', 'C'),
(53, '《关于新形势下党内政治生活的若干准则》提出，必须高度重视思想政治建设，把（  ）作为开展党内政治生活的首要任务。', 'A 坚定理想信念', 'B 坚持党的基本路线', 'C 坚决维护党中央权威', 'D 严明党的政治纪律', 'A'),
(54, '党在社会主义初级阶段的基本路线可以简要概括为“一个中心，两个基本点”，其中的“两个基本点”是指（  ）。', 'A 经济建设和改革开放', 'B 对内改革和对外开放', 'C 坚持四项基本原则和坚持改革开放', 'D 经济建设和科学发展', 'C'),
(55, '《关于新形势下党内政治生活的若干准则》提出了“四个服从”，即坚持党员个人服从党的组织，少数服从多数，下级组织服从上级组织，全党各个组织和全体党员服从党的全国代表大会和中央委员会，核心是（  ）。', 'A 党员个人服从党的组织', 'B 少数服从多数', 'C 下级组织服从上级组织', 'D  全党各个组织和全体党员服从党的全国代表大会和中央委员会', 'D'),
(56, '党的根本组织原则是（  ）。', 'A  民主集中制', 'B 将在外军令有所不受', 'C 先斩后奏', 'D 少数服从多数', 'A'),
(57, '我们党强身治病、保持肌体健康的锐利武器是（  ）。', 'A 批评与自我批评', 'B  党内民主', 'C 党的组织生活制度', 'D 坚持正确的选人用人导向', 'A'),
(58, '（  ）年，我们党制定过《关于党内政治生活的若干准则》，这是第一次以党内法规的形式对党内政治生活作出规范，应该说具有开创性的意义。', 'A 1980', 'B 1982', 'C 1987', 'D 1990', 'A'),
(59, '(    )是我国经济社会发展的基础。', 'A  工业', 'B “三农”', 'C 服务业', 'D 建筑业', 'B'),
(60, '中国2011年粮食产量首次突破（   ）大关，2013年突破12000亿斤大关，2014年达到12142亿斤，2015年12428亿斤。', 'A 11000亿斤', 'B 10000亿斤', 'C 8000亿斤', 'D 6000亿斤', 'A'),
(61, '中国的粮食生产还为全世界粮食安全做出了重要贡献，我们用不到世界1/10的耕地生产了世界（    ）的粮食，养活了占世界近1/5的人口。', 'A  1/3', 'B  1/6', 'C  1/4', 'D  1/8', 'C'),
(62, '习近平总书记多次强调，“小康不小康，关键看老乡”；全面建成小康社会，艰巨繁重的任务在(    )。', 'A 农村', 'B  城市', 'C 少数民族地区', 'D 革命老区', 'A'),
(63, '“十二五”期间，我国农业科技进步贡献率已达到56%。这标志着我国农业发展已从过去主要依靠增加资源要素投入进入到主要依靠（    ）的新时期。', 'A 科技进步', 'B 农民培训', 'C  土地承包', 'D 增加土地供应量', 'A'),
(64, '2015年，（    ）院士主持的第四期“超级稻”攻关，实现了百亩连片平均亩产 1026.7公斤的新纪录，标志着我国杂交水稻研究又攀上世界新高峰。', 'A  屠呦呦', 'B  袁隆平', 'C  黄旭华', 'D 师昌绪', 'B'),
(65, '当前我国推进农村土地制度改革，构建新型农业经营体系，建立健全城乡发展一体化制度，是侧重处理好（    ）的关系。', 'A  农民与集体', 'B 农民和国家', 'C 农村和城市', 'D 工农城乡', 'D'),
(66, '为了把农村土地“三权分置”落到实处，我们开展了土地承包经营权（    ）登记颁证试点，目前已有12个省开展整省推进试点，2160个县开展了整县推进试点。', 'A  确权', 'B  流转', 'C  没收', 'D 转让', 'A'),
(67, '在新型农业经营体系构建过程中，发展现代农业的重要路径可以概括为“新型经营主体+社会化服务+（    ）”。', 'A  农业合作社', 'B 适度规模经营', 'C  家庭承包经营', 'D 统分结合的双层经营体制', 'B'),
(68, '当前我国农村中，给传统的农业产业注入了崭新的生机和活力，运用互联网思维，利用电商平台，创新性地销售各类特色农产品，并将各种文化创意引入到农业生产中去，这样一个群体，我们给以合适的称谓是（    ）。', 'A 新型职业农民', 'B 跨界电商', 'C 现代农民', 'D 新兴农民', 'A'),
(69, '“十二五”期间，我国的（    ）已成为引领全国农业现代化的先行区。', 'A  大型农垦区', 'B 大城市郊区', 'C 国家现代农业示范区', 'D 现代农家乐', 'C'),
(70, '“十三五”期间，我国农业现代化的农业劳动生产率（万元/人）预期目标将达到（    ）。', 'A 3', 'B 4', 'C  >4.7', 'D >6.8', 'C'),
(71, '“十三五”期间，我国农业结构调整目标中，2020年目标值比2015年基数值减少的是（    ）。', 'A 玉米种植面积', 'B  奶类产量', 'C  禽肉类产量', 'D 大豆种植面积', 'A'),
(72, '当前，我国农业发展方式粗放的问题日益凸显，下列选项中不属于这个问题的表现是（    ）。', 'A 工业“三废”和城市生 活垃圾等污染向农业农村扩散', 'B 耕地数量减少质量下降、地下水超采', 'C 农产品质量安全风险增多', 'D 农产品价格提升空间较为有限', 'D'),
(73, '“十二五”期间，我国农村居民人均可支配收入达到11422元，增幅连续六年高于城镇居民收入和国内生产总值增幅，城乡居民收入差距缩小到（    ）。', 'A 2:1', 'B  2.73：1', 'C 5:1', 'D 4.5:1', 'B'),
(74, '2015年11月7日，两岸领导人在新加坡举行“世纪之握”，就推进（    ）交换意见。', 'A 两岸关系和平发展', 'B 两岸一体化', 'C 两岸三通', 'D 两岸互联互通', 'A'),
(75, '“九二共识”作为一个专有名词，是指（     ）的共识。', 'A 海峡两岸保护双方在对方的贸易投资', 'B 海峡两岸彻底结束军事对峙', 'C 海峡两岸坚持一国两制解决台湾问题', 'D 海峡两岸均坚持一个中国原则', 'D'),
(76, '2016年10月30日，中国国民党主席洪秀柱率领中国国民党大陆访问团抵达（    ），正式展开“和平之旅”。', 'A 北京', 'B 天津', 'C 南京', 'D 广州', 'C'),
(77, '2016年11月1日，（    ）在北京会见了洪秀柱一行，并就两岸关系发展提出了意见。', 'A 习近平', 'B 李克强', 'C 张志军', 'D 傅莹', 'A'),
(78, '台湾问题是关乎（    ）的问题。', 'A 改革与发展', 'B 中国主权', 'C 发展与稳定', 'D 制度与体制', 'B'),
(79, '（    ）年，国民党主席连战率团访问大陆，并与时任中共中央总书记胡锦涛会面。', 'A 2004', 'B 2005', 'C 2006', 'D 2007', 'B'),
(80, '发展两岸关系，实现和平统一的前提和基础是（　）', 'A 坚持一个中国原则', 'B 港、澳、台地区实行高度自治', 'C 港、澳、台地区保持繁荣稳定', 'D  港、澳、台地区保持原有的资本主义制度50年不变', 'A'),
(81, '综观习近平总书记的一系列对台讲话，（    ）字自始至终贯穿其中。', 'A 亲', 'B 情', 'C 心', 'D 知', 'B'),
(82, '“两岸和平发展论坛”（其前身是国共论坛），目前已成功举办（    ）届。', 'A 8', 'B 9', 'C  10', 'D 11', 'C'),
(83, '2016年11月2日“两岸和平发展论坛”在（    ）举行。', 'A 南京', 'B 上海', 'C 北京', 'D 广州', 'C'),
(84, '习近平总书记在会见洪秀柱时，就两岸关系提出了（    ）点意见。', 'A 3', 'B 4', '5.0', 'D 6', 'D'),
(85, '《联合报》认为，（    ）是近年来反对“台独”立场最为鲜明的国民党主席。', 'A 连战', 'B 马英九', 'C 朱立伦', 'D 洪秀柱', 'D'),
(86, '国共论坛是由（    ）促成的。', 'A 胡连会', 'B 胡吴会', 'C 习朱会', 'D 习马会', 'A'),
(87, '2014年2月11日，国台办主任张志军和台湾“陆委会主席”王郁琦在（   ）会晤。', 'A 北京', 'B 上海', 'C 南京', 'D 广州', 'C'),
(88, '（    ）关系是世界上最重要也是复杂的双边关系。', 'A 中美', 'B 美俄', 'C 中俄', 'D 中欧', 'A'),
(89, '2016年11月9日，美国总统选举落下帷幕，特朗普当选美国第（    ）届总统。', 'A 56', 'B 57', 'C 58', 'D 59', 'C'),
(90, '美国总统每（    ）年选举一次。', 'A 一', 'B 二', 'C 三', 'D 四', 'D'),
(91, '美国的全民投票在选举年11月的第（   ）个星期一的次是举行，这一天被称为选举日。', 'A 一', 'B 二', 'C 三', 'D 四', 'A'),
(92, '在美国，选举人团投票表决在选举年12月第（    ）个星期三之后的第一个星期一举行。', 'A 一', 'B 二', 'C 三', 'D 四', 'C'),
(93, '美国原有的工业化时代的政治形态正在由（    ）的政治形态取代。', 'A 碎片化', 'B 娱乐化', 'C 网络信息化', 'D 跨国化', 'C'),
(94, '中美建交几十年来（    ）是主流。', 'A 摩擦', 'B 合作', 'C 矛盾', 'D 争端', 'B'),
(95, '（    ）是决定国际关系走向的最关键因素。', 'A 人民意志', 'B 政府导向', 'C 军事力量', 'D  国家利益', 'D'),
(96, '2016年11月（    ）日，中国国家主席习近平与美国当选总统特朗普通电话，就保持中美关系发展势头与其互动。', 'A 13', 'B 14', 'C 15', 'D 16', 'B'),
(97, '当前，实现中美关系的（    ），是双方面临的最大课题。', 'A 平稳过渡', 'B 快速发展', 'C  震荡回归', 'D 密切发展', 'A'),
(98, '特朗普竞选期间对中国喊话最莫过于（    ）话题。', 'A 安全', 'B 意识形态', 'C 经济', 'D 货币', 'C'),
(99, '2016年11月2日举行的“两岸和平发展论坛”，打破了原有的惯例，改由两岸各（   ）个民间团体合办。', 'A 8', 'B 9', 'C  10', 'D 11', 'C'),
(100, '在“九二共识”的基础上，大陆海协会与台湾海基会于2008年6月恢复两岸两会制度性协商，并相继达成了包括ECFA在内的（   ）余项重要协议和多项共识。', 'A 10', 'B 20', 'C 30', 'D 40', 'B'),
(101, '目前，新兴经济体在世界经济总量中的比重已经超过（  ），对于经济增量的带动能力比发达经济体更大。', 'A 30%', 'B 40%', 'C 50%', 'D 60%', 'C'),
(102, '这次美国选举辩论的重要议题之一就是（    ），这就涉及了整个利益结构的核心问题。', 'A 资源配置改革', 'B 分配制度改革', 'C  贸易体系改革', 'D 医疗保障改革', 'D'),
(103, '“九二共识”的精髓是（    ）？', 'A 一个中国', 'B 求同存异', 'C 国家统一', 'D 两岸互联互通', 'B');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `admin`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 1),
(2, 'zm', 'd9c2967765305ff512a5ab979ed1f7a0', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_user`
--
ALTER TABLE `exam_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `q_fill`
--
ALTER TABLE `q_fill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `q_judge`
--
ALTER TABLE `q_judge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `q_mulsel`
--
ALTER TABLE `q_mulsel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `q_select`
--
ALTER TABLE `q_select`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `exam_user`
--
ALTER TABLE `exam_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `q_fill`
--
ALTER TABLE `q_fill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `q_judge`
--
ALTER TABLE `q_judge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- 使用表AUTO_INCREMENT `q_mulsel`
--
ALTER TABLE `q_mulsel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- 使用表AUTO_INCREMENT `q_select`
--
ALTER TABLE `q_select`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;