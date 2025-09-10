`timescale 1ns/1ps
module noc_wrapper(
  // Clock and Reset
  input wire ACLK,
  input wire ARESETn
);

  // Internal wiring for all group connections
  // Group 1 ports
  wire [15:0] group211_out_data, group311_out_data, group411_out_data, group511_out_data;
  wire [15:0] group611_out_data, group711_out_data, group811_out_data;
  wire group211_out_valid, group311_out_valid, group411_out_valid, group511_out_valid;
  wire group611_out_valid, group711_out_valid, group811_out_valid;
  wire [15:0] group211_in_data, group311_in_data, group411_in_data, group511_in_data;
  wire [15:0] group611_in_data, group711_in_data, group811_in_data;
  wire group211_in_valid, group311_in_valid, group411_in_valid, group511_in_valid;
  wire group611_in_valid, group711_in_valid, group811_in_valid;
  
  wire [15:0] group212_out_data, group312_out_data, group412_out_data, group512_out_data;
  wire [15:0] group612_out_data, group712_out_data, group812_out_data;
  wire group212_out_valid, group312_out_valid, group412_out_valid, group512_out_valid;
  wire group612_out_valid, group712_out_valid, group812_out_valid;
  wire [15:0] group212_in_data, group312_in_data, group412_in_data, group512_in_data;
  wire [15:0] group612_in_data, group712_in_data, group812_in_data;
  wire group212_in_valid, group312_in_valid, group412_in_valid, group512_in_valid;
  wire group612_in_valid, group712_in_valid, group812_in_valid;
  
  wire [15:0] group213_out_data, group313_out_data, group413_out_data, group513_out_data;
  wire [15:0] group613_out_data, group713_out_data, group813_out_data;
  wire group213_out_valid, group313_out_valid, group413_out_valid, group513_out_valid;
  wire group613_out_valid, group713_out_valid, group813_out_valid;
  wire [15:0] group213_in_data, group313_in_data, group413_in_data, group513_in_data;
  wire [15:0] group613_in_data, group713_in_data, group813_in_data;
  wire group213_in_valid, group313_in_valid, group413_in_valid, group513_in_valid;
  wire group613_in_valid, group713_in_valid, group813_in_valid;
  
  wire [15:0] group214_out_data, group314_out_data, group414_out_data, group514_out_data;
  wire [15:0] group614_out_data, group714_out_data, group814_out_data;
  wire group214_out_valid, group314_out_valid, group414_out_valid, group514_out_valid;
  wire group614_out_valid, group714_out_valid, group814_out_valid;
  wire [15:0] group214_in_data, group314_in_data, group414_in_data, group514_in_data;
  wire [15:0] group614_in_data, group714_in_data, group814_in_data;
  wire group214_in_valid, group314_in_valid, group414_in_valid, group514_in_valid;
  wire group614_in_valid, group714_in_valid, group814_in_valid;

  // Group 2 ports
  wire [15:0] group221_out_data, group321_out_data, group421_out_data, group521_out_data;
  wire [15:0] group621_out_data, group721_out_data, group821_out_data;
  wire group221_out_valid, group321_out_valid, group421_out_valid, group521_out_valid;
  wire group621_out_valid, group721_out_valid, group821_out_valid;
  wire [15:0] group221_in_data, group321_in_data, group421_in_data, group521_in_data;
  wire [15:0] group621_in_data, group721_in_data, group821_in_data;
  wire group221_in_valid, group321_in_valid, group421_in_valid, group521_in_valid;
  wire group621_in_valid, group721_in_valid, group821_in_valid;
  
  wire [15:0] group222_out_data, group322_out_data, group422_out_data, group522_out_data;
  wire [15:0] group622_out_data, group722_out_data, group822_out_data;
  wire group222_out_valid, group322_out_valid, group422_out_valid, group522_out_valid;
  wire group622_out_valid, group722_out_valid, group822_out_valid;
  wire [15:0] group222_in_data, group322_in_data, group422_in_data, group522_in_data;
  wire [15:0] group622_in_data, group722_in_data, group822_in_data;
  wire group222_in_valid, group322_in_valid, group422_in_valid, group522_in_valid;
  wire group622_in_valid, group722_in_valid, group822_in_valid;
  
  wire [15:0] group223_out_data, group323_out_data, group423_out_data, group523_out_data;
  wire [15:0] group623_out_data, group723_out_data, group823_out_data;
  wire group223_out_valid, group323_out_valid, group423_out_valid, group523_out_valid;
  wire group623_out_valid, group723_out_valid, group823_out_valid;
  wire [15:0] group223_in_data, group323_in_data, group423_in_data, group523_in_data;
  wire [15:0] group623_in_data, group723_in_data, group823_in_data;
  wire group223_in_valid, group323_in_valid, group423_in_valid, group523_in_valid;
  wire group623_in_valid, group723_in_valid, group823_in_valid;
  
  wire [15:0] group224_out_data, group324_out_data, group424_out_data, group524_out_data;
  wire [15:0] group624_out_data, group724_out_data, group824_out_data;
  wire group224_out_valid, group324_out_valid, group424_out_valid, group524_out_valid;
  wire group624_out_valid, group724_out_valid, group824_out_valid;
  wire [15:0] group224_in_data, group324_in_data, group424_in_data, group524_in_data;
  wire [15:0] group624_in_data, group724_in_data, group824_in_data;
  wire group224_in_valid, group324_in_valid, group424_in_valid, group524_in_valid;
  wire group624_in_valid, group724_in_valid, group824_in_valid;

  // Group 3 ports
  wire [15:0] group231_out_data, group331_out_data, group431_out_data, group531_out_data;
  wire [15:0] group631_out_data, group731_out_data, group831_out_data;
  wire group231_out_valid, group331_out_valid, group431_out_valid, group531_out_valid;
  wire group631_out_valid, group731_out_valid, group831_out_valid;
  wire [15:0] group231_in_data, group331_in_data, group431_in_data, group531_in_data;
  wire [15:0] group631_in_data, group731_in_data, group831_in_data;
  wire group231_in_valid, group331_in_valid, group431_in_valid, group531_in_valid;
  wire group631_in_valid, group731_in_valid, group831_in_valid;
  
  wire [15:0] group232_out_data, group332_out_data, group432_out_data, group532_out_data;
  wire [15:0] group632_out_data, group732_out_data, group832_out_data;
  wire group232_out_valid, group332_out_valid, group432_out_valid, group532_out_valid;
  wire group632_out_valid, group732_out_valid, group832_out_valid;
  wire [15:0] group232_in_data, group332_in_data, group432_in_data, group532_in_data;
  wire [15:0] group632_in_data, group732_in_data, group832_in_data;
  wire group232_in_valid, group332_in_valid, group432_in_valid, group532_in_valid;
  wire group632_in_valid, group732_in_valid, group832_in_valid;
  
  wire [15:0] group233_out_data, group333_out_data, group433_out_data, group533_out_data;
  wire [15:0] group633_out_data, group733_out_data, group833_out_data;
  wire group233_out_valid, group333_out_valid, group433_out_valid, group533_out_valid;
  wire group633_out_valid, group733_out_valid, group833_out_valid;
  wire [15:0] group233_in_data, group333_in_data, group433_in_data, group533_in_data;
  wire [15:0] group633_in_data, group733_in_data, group833_in_data;
  wire group233_in_valid, group333_in_valid, group433_in_valid, group533_in_valid;
  wire group633_in_valid, group733_in_valid, group833_in_valid;
  
  wire [15:0] group234_out_data, group334_out_data, group434_out_data, group534_out_data;
  wire [15:0] group634_out_data, group734_out_data, group834_out_data;
  wire group234_out_valid, group334_out_valid, group434_out_valid, group534_out_valid;
  wire group634_out_valid, group734_out_valid, group834_out_valid;
  wire [15:0] group234_in_data, group334_in_data, group434_in_data, group534_in_data;
  wire [15:0] group634_in_data, group734_in_data, group834_in_data;
  wire group234_in_valid, group334_in_valid, group434_in_valid, group534_in_valid;
  wire group634_in_valid, group734_in_valid, group834_in_valid;

  // Group 4 ports
  wire [15:0] group241_out_data, group341_out_data, group441_out_data, group541_out_data;
  wire [15:0] group641_out_data, group741_out_data, group841_out_data;
  wire group241_out_valid, group341_out_valid, group441_out_valid, group541_out_valid;
  wire group641_out_valid, group741_out_valid, group841_out_valid;
  wire [15:0] group241_in_data, group341_in_data, group441_in_data, group541_in_data;
  wire [15:0] group641_in_data, group741_in_data, group841_in_data;
  wire group241_in_valid, group341_in_valid, group441_in_valid, group541_in_valid;
  wire group641_in_valid, group741_in_valid, group841_in_valid;
  
  wire [15:0] group242_out_data, group342_out_data, group442_out_data, group542_out_data;
  wire [15:0] group642_out_data, group742_out_data, group842_out_data;
  wire group242_out_valid, group342_out_valid, group442_out_valid, group542_out_valid;
  wire group642_out_valid, group742_out_valid, group842_out_valid;
  wire [15:0] group242_in_data, group342_in_data, group442_in_data, group542_in_data;
  wire [15:0] group642_in_data, group742_in_data, group842_in_data;
  wire group242_in_valid, group342_in_valid, group442_in_valid, group542_in_valid;
  wire group642_in_valid, group742_in_valid, group842_in_valid;
  
  wire [15:0] group243_out_data, group343_out_data, group443_out_data, group543_out_data;
  wire [15:0] group643_out_data, group743_out_data, group843_out_data;
  wire group243_out_valid, group343_out_valid, group443_out_valid, group543_out_valid;
  wire group643_out_valid, group743_out_valid, group843_out_valid;
  wire [15:0] group243_in_data, group343_in_data, group443_in_data, group543_in_data;
  wire [15:0] group643_in_data, group743_in_data, group843_in_data;
  wire group243_in_valid, group343_in_valid, group443_in_valid, group543_in_valid;
  wire group643_in_valid, group743_in_valid, group843_in_valid;
  
  wire [15:0] group244_out_data, group344_out_data, group444_out_data, group544_out_data;
  wire [15:0] group644_out_data, group744_out_data, group844_out_data;
  wire group244_out_valid, group344_out_valid, group444_out_valid, group544_out_valid;
  wire group644_out_valid, group744_out_valid, group844_out_valid;
  wire [15:0] group244_in_data, group344_in_data, group444_in_data, group544_in_data;
  wire [15:0] group644_in_data, group744_in_data, group844_in_data;
  wire group244_in_valid, group344_in_valid, group444_in_valid, group544_in_valid;
  wire group644_in_valid, group744_in_valid, group844_in_valid;

  // Group 5 ports
  wire [15:0] group251_out_data, group351_out_data, group451_out_data, group551_out_data;
  wire [15:0] group651_out_data, group751_out_data, group851_out_data;
  wire group251_out_valid, group351_out_valid, group451_out_valid, group551_out_valid;
  wire group651_out_valid, group751_out_valid, group851_out_valid;
  wire [15:0] group251_in_data, group351_in_data, group451_in_data, group551_in_data;
  wire [15:0] group651_in_data, group751_in_data, group851_in_data;
  wire group251_in_valid, group351_in_valid, group451_in_valid, group551_in_valid;
  wire group651_in_valid, group751_in_valid, group851_in_valid;
  
  wire [15:0] group252_out_data, group352_out_data, group452_out_data, group552_out_data;
  wire [15:0] group652_out_data, group752_out_data, group852_out_data;
  wire group252_out_valid, group352_out_valid, group452_out_valid, group552_out_valid;
  wire group652_out_valid, group752_out_valid, group852_out_valid;
  wire [15:0] group252_in_data, group352_in_data, group452_in_data, group552_in_data;
  wire [15:0] group652_in_data, group752_in_data, group852_in_data;
  wire group252_in_valid, group352_in_valid, group452_in_valid, group552_in_valid;
  wire group652_in_valid, group752_in_valid, group852_in_valid;
  
  wire [15:0] group253_out_data, group353_out_data, group453_out_data, group553_out_data;
  wire [15:0] group653_out_data, group753_out_data, group853_out_data;
  wire group253_out_valid, group353_out_valid, group453_out_valid, group553_out_valid;
  wire group653_out_valid, group753_out_valid, group853_out_valid;
  wire [15:0] group253_in_data, group353_in_data, group453_in_data, group553_in_data;
  wire [15:0] group653_in_data, group753_in_data, group853_in_data;
  wire group253_in_valid, group353_in_valid, group453_in_valid, group553_in_valid;
  wire group653_in_valid, group753_in_valid, group853_in_valid;
  
  wire [15:0] group254_out_data, group354_out_data, group454_out_data, group554_out_data;
  wire [15:0] group654_out_data, group754_out_data, group854_out_data;
  wire group254_out_valid, group354_out_valid, group454_out_valid, group554_out_valid;
  wire group654_out_valid, group754_out_valid, group854_out_valid;
  wire [15:0] group254_in_data, group354_in_data, group454_in_data, group554_in_data;
  wire [15:0] group654_in_data, group754_in_data, group854_in_data;
  wire group254_in_valid, group354_in_valid, group454_in_valid, group554_in_valid;
  wire group654_in_valid, group754_in_valid, group854_in_valid;

  // Group 6 ports
  wire [15:0] group261_out_data, group361_out_data, group461_out_data, group561_out_data;
  wire [15:0] group661_out_data, group761_out_data, group861_out_data;
  wire group261_out_valid, group361_out_valid, group461_out_valid, group561_out_valid;
  wire group661_out_valid, group761_out_valid, group861_out_valid;
  wire [15:0] group261_in_data, group361_in_data, group461_in_data, group561_in_data;
  wire [15:0] group661_in_data, group761_in_data, group861_in_data;
  wire group261_in_valid, group361_in_valid, group461_in_valid, group561_in_valid;
  wire group661_in_valid, group761_in_valid, group861_in_valid;
  
  wire [15:0] group262_out_data, group362_out_data, group462_out_data, group562_out_data;
  wire [15:0] group662_out_data, group762_out_data, group862_out_data;
  wire group262_out_valid, group362_out_valid, group462_out_valid, group562_out_valid;
  wire group662_out_valid, group762_out_valid, group862_out_valid;
  wire [15:0] group262_in_data, group362_in_data, group462_in_data, group562_in_data;
  wire [15:0] group662_in_data, group762_in_data, group862_in_data;
  wire group262_in_valid, group362_in_valid, group462_in_valid, group562_in_valid;
  wire group662_in_valid, group762_in_valid, group862_in_valid;
  
  wire [15:0] group263_out_data, group363_out_data, group463_out_data, group563_out_data;
  wire [15:0] group663_out_data, group763_out_data, group863_out_data;
  wire group263_out_valid, group363_out_valid, group463_out_valid, group563_out_valid;
  wire group663_out_valid, group763_out_valid, group863_out_valid;
  wire [15:0] group263_in_data, group363_in_data, group463_in_data, group563_in_data;
  wire [15:0] group663_in_data, group763_in_data, group863_in_data;
  wire group263_in_valid, group363_in_valid, group463_in_valid, group563_in_valid;
  wire group663_in_valid, group763_in_valid, group863_in_valid;
  
  wire [15:0] group264_out_data, group364_out_data, group464_out_data, group564_out_data;
  wire [15:0] group664_out_data, group764_out_data, group864_out_data;
  wire group264_out_valid, group364_out_valid, group464_out_valid, group564_out_valid;
  wire group664_out_valid, group764_out_valid, group864_out_valid;
  wire [15:0] group264_in_data, group364_in_data, group464_in_data, group564_in_data;
  wire [15:0] group664_in_data, group764_in_data, group864_in_data;
  wire group264_in_valid, group364_in_valid, group464_in_valid, group564_in_valid;
  wire group664_in_valid, group764_in_valid, group864_in_valid;

  // Group 7 ports
  wire [15:0] group271_out_data, group371_out_data, group471_out_data, group571_out_data;
  wire [15:0] group671_out_data, group771_out_data, group871_out_data;
  wire group271_out_valid, group371_out_valid, group471_out_valid, group571_out_valid;
  wire group671_out_valid, group771_out_valid, group871_out_valid;
  wire [15:0] group271_in_data, group371_in_data, group471_in_data, group571_in_data;
  wire [15:0] group671_in_data, group771_in_data, group871_in_data;
  wire group271_in_valid, group371_in_valid, group471_in_valid, group571_in_valid;
  wire group671_in_valid, group771_in_valid, group871_in_valid;
  
  wire [15:0] group272_out_data, group372_out_data, group472_out_data, group572_out_data;
  wire [15:0] group672_out_data, group772_out_data, group872_out_data;
  wire group272_out_valid, group372_out_valid, group472_out_valid, group572_out_valid;
  wire group672_out_valid, group772_out_valid, group872_out_valid;
  wire [15:0] group272_in_data, group372_in_data, group472_in_data, group572_in_data;
  wire [15:0] group672_in_data, group772_in_data, group872_in_data;
  wire group272_in_valid, group372_in_valid, group472_in_valid, group572_in_valid;
  wire group672_in_valid, group772_in_valid, group872_in_valid;
  
  wire [15:0] group273_out_data, group373_out_data, group473_out_data, group573_out_data;
  wire [15:0] group673_out_data, group773_out_data, group873_out_data;
  wire group273_out_valid, group373_out_valid, group473_out_valid, group573_out_valid;
  wire group673_out_valid, group773_out_valid, group873_out_valid;
  wire [15:0] group273_in_data, group373_in_data, group473_in_data, group573_in_data;
  wire [15:0] group673_in_data, group773_in_data, group873_in_data;
  wire group273_in_valid, group373_in_valid, group473_in_valid, group573_in_valid;
  wire group673_in_valid, group773_in_valid, group873_in_valid;
  
  wire [15:0] group274_out_data, group374_out_data, group474_out_data, group574_out_data;
  wire [15:0] group674_out_data, group774_out_data, group874_out_data;
  wire group274_out_valid, group374_out_valid, group474_out_valid, group574_out_valid;
  wire group674_out_valid, group774_out_valid, group874_out_valid;
  wire [15:0] group274_in_data, group374_in_data, group474_in_data, group574_in_data;
  wire [15:0] group674_in_data, group774_in_data, group874_in_data;
  wire group274_in_valid, group374_in_valid, group474_in_valid, group574_in_valid;
  wire group674_in_valid, group774_in_valid, group874_in_valid;

  // Group 8 ports
  wire [15:0] group281_out_data, group381_out_data, group481_out_data, group581_out_data;
  wire [15:0] group681_out_data, group781_out_data, group881_out_data;
  wire group281_out_valid, group381_out_valid, group481_out_valid, group581_out_valid;
  wire group681_out_valid, group781_out_valid, group881_out_valid;
  wire [15:0] group281_in_data, group381_in_data, group481_in_data, group581_in_data;
  wire [15:0] group681_in_data, group781_in_data, group881_in_data;
  wire group281_in_valid, group381_in_valid, group481_in_valid, group581_in_valid;
  wire group681_in_valid, group781_in_valid, group881_in_valid;
  
  wire [15:0] group282_out_data, group382_out_data, group482_out_data, group582_out_data;
  wire [15:0] group682_out_data, group782_out_data, group882_out_data;
  wire group282_out_valid, group382_out_valid, group482_out_valid, group582_out_valid;
  wire group682_out_valid, group782_out_valid, group882_out_valid;
  wire [15:0] group282_in_data, group382_in_data, group482_in_data, group582_in_data;
  wire [15:0] group682_in_data, group782_in_data, group882_in_data;
  wire group282_in_valid, group382_in_valid, group482_in_valid, group582_in_valid;
  wire group682_in_valid, group782_in_valid, group882_in_valid;
  
  wire [15:0] group283_out_data, group383_out_data, group483_out_data, group583_out_data;
  wire [15:0] group683_out_data, group783_out_data, group883_out_data;
  wire group283_out_valid, group383_out_valid, group483_out_valid, group583_out_valid;
  wire group683_out_valid, group783_out_valid, group883_out_valid;
  wire [15:0] group283_in_data, group383_in_data, group483_in_data, group583_in_data;
  wire [15:0] group683_in_data, group783_in_data, group883_in_data;
  wire group283_in_valid, group383_in_valid, group483_in_valid, group583_in_valid;
  wire group683_in_valid, group783_in_valid, group883_in_valid;
  
  wire [15:0] group284_out_data, group384_out_data, group484_out_data, group584_out_data;
  wire [15:0] group684_out_data, group784_out_data, group884_out_data;
  wire group284_out_valid, group384_out_valid, group484_out_valid, group584_out_valid;
  wire group684_out_valid, group784_out_valid, group884_out_valid;
  wire [15:0] group284_in_data, group384_in_data, group484_in_data, group584_in_data;
  wire [15:0] group684_in_data, group784_in_data, group884_in_data;
  wire group284_in_valid, group384_in_valid, group484_in_valid, group584_in_valid;
  wire group684_in_valid, group784_in_valid, group884_in_valid;

  // Instantiate all 8 groups
  group1 g1 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group211_out_data(group211_out_data),
    .group211_out_valid(group211_out_valid),
    .group211_in_data(group211_in_data),
    .group211_in_valid(group211_in_valid),
    
    .group311_out_data(group311_out_data),
    .group311_out_valid(group311_out_valid),
    .group311_in_data(group311_in_data),
    .group311_in_valid(group311_in_valid),
    
    .group411_out_data(group411_out_data),
    .group411_out_valid(group411_out_valid),
    .group411_in_data(group411_in_data),
    .group411_in_valid(group411_in_valid),
    
    .group511_out_data(group511_out_data),
    .group511_out_valid(group511_out_valid),
    .group511_in_data(group511_in_data),
    .group511_in_valid(group511_in_valid),
    
    .group611_out_data(group611_out_data),
    .group611_out_valid(group611_out_valid),
    .group611_in_data(group611_in_data),
    .group611_in_valid(group611_in_valid),
    
    .group711_out_data(group711_out_data),
    .group711_out_valid(group711_out_valid),
    .group711_in_data(group711_in_data),
    .group711_in_valid(group711_in_valid),
    
    .group811_out_data(group811_out_data),
    .group811_out_valid(group811_out_valid),
    .group811_in_data(group811_in_data),
    .group811_in_valid(group811_in_valid),
    
    // Spine 2 group ports
    .group212_out_data(group212_out_data),
    .group212_out_valid(group212_out_valid),
    .group212_in_data(group212_in_data),
    .group212_in_valid(group212_in_valid),
    
    .group312_out_data(group312_out_data),
    .group312_out_valid(group312_out_valid),
    .group312_in_data(group312_in_data),
    .group312_in_valid(group312_in_valid),
    
    .group412_out_data(group412_out_data),
    .group412_out_valid(group412_out_valid),
    .group412_in_data(group412_in_data),
    .group412_in_valid(group412_in_valid),
    
    .group512_out_data(group512_out_data),
    .group512_out_valid(group512_out_valid),
    .group512_in_data(group512_in_data),
    .group512_in_valid(group512_in_valid),
    
    .group612_out_data(group612_out_data),
    .group612_out_valid(group612_out_valid),
    .group612_in_data(group612_in_data),
    .group612_in_valid(group612_in_valid),
    
    .group712_out_data(group712_out_data),
    .group712_out_valid(group712_out_valid),
    .group712_in_data(group712_in_data),
    .group712_in_valid(group712_in_valid),
    
    .group812_out_data(group812_out_data),
    .group812_out_valid(group812_out_valid),
    .group812_in_data(group812_in_data),
    .group812_in_valid(group812_in_valid),
    
    // Spine 3 group ports
    .group213_out_data(group213_out_data),
    .group213_out_valid(group213_out_valid),
    .group213_in_data(group213_in_data),
    .group213_in_valid(group213_in_valid),
    
    .group313_out_data(group313_out_data),
    .group313_out_valid(group313_out_valid),
    .group313_in_data(group313_in_data),
    .group313_in_valid(group313_in_valid),
    
    .group413_out_data(group413_out_data),
    .group413_out_valid(group413_out_valid),
    .group413_in_data(group413_in_data),
    .group413_in_valid(group413_in_valid),
    
    .group513_out_data(group513_out_data),
    .group513_out_valid(group513_out_valid),
    .group513_in_data(group513_in_data),
    .group513_in_valid(group513_in_valid),
    
    .group613_out_data(group613_out_data),
    .group613_out_valid(group613_out_valid),
    .group613_in_data(group613_in_data),
    .group613_in_valid(group613_in_valid),
    .group713_out_data(group713_out_data),
    .group713_out_valid(group713_out_valid),
    .group713_in_data(group713_in_data),
    .group713_in_valid(group713_in_valid),
    
    .group813_out_data(group813_out_data),
    .group813_out_valid(group813_out_valid),
    .group813_in_data(group813_in_data),
    .group813_in_valid(group813_in_valid),
    
    // Spine 4 group ports
    .group214_out_data(group214_out_data),
    .group214_out_valid(group214_out_valid),
    .group214_in_data(group214_in_data),
    .group214_in_valid(group214_in_valid),
    
    .group314_out_data(group314_out_data),
    .group314_out_valid(group314_out_valid),
    .group314_in_data(group314_in_data),
    .group314_in_valid(group314_in_valid),
    
    .group414_out_data(group414_out_data),
    .group414_out_valid(group414_out_valid),
    .group414_in_data(group414_in_data),
    .group414_in_valid(group414_in_valid),
    
    .group514_out_data(group514_out_data),
    .group514_out_valid(group514_out_valid),
    .group514_in_data(group514_in_data),
    .group514_in_valid(group514_in_valid),
    
    .group614_out_data(group614_out_data),
    .group614_out_valid(group614_out_valid),
    .group614_in_data(group614_in_data),
    .group614_in_valid(group614_in_valid),
    
    .group714_out_data(group714_out_data),
    .group714_out_valid(group714_out_valid),
    .group714_in_data(group714_in_data),
    .group714_in_valid(group714_in_valid),
    
    .group814_out_data(group814_out_data),
    .group814_out_valid(group814_out_valid),
    .group814_in_data(group814_in_data),
    .group814_in_valid(group814_in_valid)
  );

  group2 g2 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group211_out_data(group211_in_data),
    .group211_out_valid(group211_in_valid),
    .group211_in_data(group211_out_data),
    .group211_in_valid(group211_out_valid),
    
    .group321_out_data(group321_out_data),
    .group321_out_valid(group321_out_valid),
    .group321_in_data(group321_in_data),
    .group321_in_valid(group321_in_valid),
    
    .group421_out_data(group421_out_data),
    .group421_out_valid(group421_out_valid),
    .group421_in_data(group421_in_data),
    .group421_in_valid(group421_in_valid),
    
    .group521_out_data(group521_out_data),
    .group521_out_valid(group521_out_valid),
    .group521_in_data(group521_in_data),
    .group521_in_valid(group521_in_valid),
    
    .group621_out_data(group621_out_data),
    .group621_out_valid(group621_out_valid),
    .group621_in_data(group621_in_data),
    .group621_in_valid(group621_in_valid),
    
    .group721_out_data(group721_out_data),
    .group721_out_valid(group721_out_valid),
    .group721_in_data(group721_in_data),
    .group721_in_valid(group721_in_valid),
    
    .group821_out_data(group821_out_data),
    .group821_out_valid(group821_out_valid),
    .group821_in_data(group821_in_data),
    .group821_in_valid(group821_in_valid),
    
    // Spine 2 group ports
    .group212_out_data(group212_in_data),
    .group212_out_valid(group212_in_valid),
    .group212_in_data(group212_out_data),
    .group212_in_valid(group212_out_valid),
    
    .group322_out_data(group322_out_data),
    .group322_out_valid(group322_out_valid),
    .group322_in_data(group322_in_data),
    .group322_in_valid(group322_in_valid),
    
    .group422_out_data(group422_out_data),
    .group422_out_valid(group422_out_valid),
    .group422_in_data(group422_in_data),
    .group422_in_valid(group422_in_valid),
    
    .group522_out_data(group522_out_data),
    .group522_out_valid(group522_out_valid),
    .group522_in_data(group522_in_data),
    .group522_in_valid(group522_in_valid),
    
    .group622_out_data(group622_out_data),
    .group622_out_valid(group622_out_valid),
    .group622_in_data(group622_in_data),
    .group622_in_valid(group622_in_valid),
    
    .group722_out_data(group722_out_data),
    .group722_out_valid(group722_out_valid),
    .group722_in_data(group722_in_data),
    .group722_in_valid(group722_in_valid),
    
    .group822_out_data(group822_out_data),
    .group822_out_valid(group822_out_valid),
    .group822_in_data(group822_in_data),
    .group822_in_valid(group822_in_valid),
    
    // Spine 3 group ports
    .group213_out_data(group213_in_data),
    .group213_out_valid(group213_in_valid),
    .group213_in_data(group213_out_data),
    .group213_in_valid(group213_out_valid),
    
    .group323_out_data(group323_out_data),
    .group323_out_valid(group323_out_valid),
    .group323_in_data(group323_in_data),
    .group323_in_valid(group323_in_valid),
    
    .group423_out_data(group423_out_data),
    .group423_out_valid(group423_out_valid),
    .group423_in_data(group423_in_data),
    .group423_in_valid(group423_in_valid),
    
    .group523_out_data(group523_out_data),
    .group523_out_valid(group523_out_valid),
    .group523_in_data(group523_in_data),
    .group523_in_valid(group523_in_valid),
    
    .group623_out_data(group623_out_data),
    .group623_out_valid(group623_out_valid),
    .group623_in_data(group623_in_data),
    .group623_in_valid(group623_in_valid),
    
    .group723_out_data(group723_out_data),
    .group723_out_valid(group723_out_valid),
    .group723_in_data(group723_in_data),
    .group723_in_valid(group723_in_valid),
    
    .group823_out_data(group823_out_data),
    .group823_out_valid(group823_out_valid),
    .group823_in_data(group823_in_data),
    .group823_in_valid(group823_in_valid),
    
    // Spine 4 group ports
    .group214_out_data(group214_in_data),
    .group214_out_valid(group214_in_valid),
    .group214_in_data(group214_out_data),
    .group214_in_valid(group214_out_valid),
    
    .group324_out_data(group324_out_data),
    .group324_out_valid(group324_out_valid),
    .group324_in_data(group324_in_data),
    .group324_in_valid(group324_in_valid),
    
    .group424_out_data(group424_out_data),
    .group424_out_valid(group424_out_valid),
    .group424_in_data(group424_in_data),
    .group424_in_valid(group424_in_valid),
    
    .group524_out_data(group524_out_data),
    .group524_out_valid(group524_out_valid),
    .group524_in_data(group524_in_data),
    .group524_in_valid(group524_in_valid),
    
    .group624_out_data(group624_out_data),
    .group624_out_valid(group624_out_valid),
    .group624_in_data(group624_in_data),
    .group624_in_valid(group624_in_valid),
    
    .group724_out_data(group724_out_data),
    .group724_out_valid(group724_out_valid),
    .group724_in_data(group724_in_data),
    .group724_in_valid(group724_in_valid),
    
    .group824_out_data(group824_out_data),
    .group824_out_valid(group824_out_valid),
    .group824_in_data(group824_in_data),
    .group824_in_valid(group824_in_valid)
  );

  // Instantiate groups 3-8 similarly with proper connections
  group3 g3 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group311_out_data(group311_in_data),
    .group311_out_valid(group311_in_valid),
    .group311_in_data(group311_out_data),
    .group311_in_valid(group311_out_valid),
    
    .group321_out_data(group321_in_data),
    .group321_out_valid(group321_in_valid),
    .group321_in_data(group321_out_data),
    .group321_in_valid(group321_out_valid),
    
    .group431_out_data(group431_out_data),
    .group431_out_valid(group431_out_valid),
    .group431_in_data(group431_in_data),
    .group431_in_valid(group431_in_valid),
    
    .group531_out_data(group531_out_data),
    .group531_out_valid(group531_out_valid),
    .group531_in_data(group531_in_data),
    .group531_in_valid(group531_in_valid),
    
    .group631_out_data(group631_out_data),
    .group631_out_valid(group631_out_valid),
    .group631_in_data(group631_in_data),
    .group631_in_valid(group631_in_valid),
    
    .group731_out_data(group731_out_data),
    .group731_out_valid(group731_out_valid),
    .group731_in_data(group731_in_data),
    .group731_in_valid(group731_in_valid),
    
    .group831_out_data(group831_out_data),
    .group831_out_valid(group831_out_valid),
    .group831_in_data(group831_in_data),
    .group831_in_valid(group831_in_valid),
    
    // Spine 2 group ports
    .group312_out_data(group312_in_data),
    .group312_out_valid(group312_in_valid),
    .group312_in_data(group312_out_data),
    .group312_in_valid(group312_out_valid),
    
    .group322_out_data(group322_in_data),
    .group322_out_valid(group322_in_valid),
    .group322_in_data(group322_out_data),
    .group322_in_valid(group322_out_valid),
    
    .group432_out_data(group432_out_data),
    .group432_out_valid(group432_out_valid),
    .group432_in_data(group432_in_data),
    .group432_in_valid(group432_in_valid),
    
    .group532_out_data(group532_out_data),
    .group532_out_valid(group532_out_valid),
    .group532_in_data(group532_in_data),
    .group532_in_valid(group532_in_valid),
    
    .group632_out_data(group632_out_data),
    .group632_out_valid(group632_out_valid),
    .group632_in_data(group632_in_data),
    .group632_in_valid(group632_in_valid),
    
    .group732_out_data(group732_out_data),
    .group732_out_valid(group732_out_valid),
    .group732_in_data(group732_in_data),
    .group732_in_valid(group732_in_valid),
    
    .group832_out_data(group832_out_data),
    .group832_out_valid(group832_out_valid),
    .group832_in_data(group832_in_data),
    .group832_in_valid(group832_in_valid),
    
    // Spine 3 group ports
    .group313_out_data(group313_in_data),
    .group313_out_valid(group313_in_valid),
    .group313_in_data(group313_out_data),
    .group313_in_valid(group313_out_valid),
    
    .group323_out_data(group323_in_data),
    .group323_out_valid(group323_in_valid),
    .group323_in_data(group323_out_data),
    .group323_in_valid(group323_out_valid),
    
    .group433_out_data(group433_out_data),
    .group433_out_valid(group433_out_valid),
    .group433_in_data(group433_in_data),
    .group433_in_valid(group433_in_valid),
    
    .group533_out_data(group533_out_data),
    .group533_out_valid(group533_out_valid),
    .group533_in_data(group533_in_data),
    .group533_in_valid(group533_in_valid),
    
    .group633_out_data(group633_out_data),
    .group633_out_valid(group633_out_valid),
    .group633_in_data(group633_in_data),
    .group633_in_valid(group633_in_valid),
    
    .group733_out_data(group733_out_data),
    .group733_out_valid(group733_out_valid),
    .group733_in_data(group733_in_data),
    .group733_in_valid(group733_in_valid),
    
    .group833_out_data(group833_out_data),
    .group833_out_valid(group833_out_valid),
    .group833_in_data(group833_in_data),
    .group833_in_valid(group833_in_valid),
    
    // Spine 4 group ports
    .group314_out_data(group314_in_data),
    .group314_out_valid(group314_in_valid),
    .group314_in_data(group314_out_data),
    .group314_in_valid(group314_out_valid),
    
    .group324_out_data(group324_in_data),
    .group324_out_valid(group324_in_valid),
    .group324_in_data(group324_out_data),
    .group324_in_valid(group324_out_valid),
    
    .group434_out_data(group434_out_data),
    .group434_out_valid(group434_out_valid),
    .group434_in_data(group434_in_data),
    .group434_in_valid(group434_in_valid),
    
极 group534_out_data(group534_out_data),
    .group534_out_valid(group534_out_valid),
    .group534_in_data(group534_in_data),
    .group534_in_valid(group534_in_valid),
    
    .group634_out_data(group634_out_data),
    .group634_out_valid(group634_out_valid),
    .group634_in_data(group634_in_data),
    .group634_in_valid(group634_in_valid),
    
    .group734_out_data(group734_out_data),
    .group734_out_valid(group734_out_valid),
    .group734_in_data(group734_in_data),
    .group734_in_valid(group734_in_valid),
    
    .group834_out_data(group834_out_data),
    .group834_out_valid(group834_out_valid),
   极 group834_in_data(group834_in_data),
    .group834_in_valid(group834_in_valid)
  );

  group4 g4 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group411_out_data(group411_in_data),
    .group411_out_valid(group411_in_valid),
    .group411_in_data(group411_out_data),
    .group411_in_valid(group411_out_valid),
    
    .group421_out_data(group421_in_data),
    .group421_out_valid(group421_in_valid),
    .group421_in_data(group421_out_data),
    .group421_in_valid(group421_out_valid),
    
    .group431_out_data(group431_in_data),
    .group431_out_valid(group431_in_valid),
    .group431_in_data(group431_out_data),
    .group431_in_valid(group431_out_valid),
    
    .group541_out_data(group541_out_data),
    .group541_out_valid(group541_out_valid),
    .group541_in_data(group541_in_data),
    .group541_in_valid(group541_in_valid),
    
    .group641_out_data(group641_out_data),
    .group641_out_valid(group641_out_valid),
    .group641_in_data(group641_in_data),
    .group641_in_valid(group641_in_valid),
    
    .group741_out_data(group741_out_data),
    .group741_out_valid(group741_out_valid),
    .group741_in_data(group741_in_data),
    .group741_in_valid(group741_in_valid),
    
    .group841_out_data(group841_out_data),
    .group841_out_valid(group841_out_valid),
    .group841_in_data(group841_in_data),
    .group841_in_valid(group841_in_valid),
    
    // Spine 2 group ports
    .group412_out_data(group412_in_data),
    .group412_out_valid(group412_in_valid),
    .group412_in_data(group412_out_data),
    .group412_in_valid(group412_out_valid),
    
    .group422_out_data(group422_in_data),
    .group422_out_valid(group422_in_valid),
    .group422_in_data(group422_out_data),
    .group422_in_valid(group422_out_valid),
    
    .group432_out_data(group432_in_data),
    .group432_out_valid(group432_in_valid),
    .group432_in_data(group432_out_data),
    .极 group432_in_valid(group432_out_valid),
    
    .group542_out_data(group542_out_data),
    .group542_out_valid(group542_out_valid),
    .group542极_data(group542_in_data),
    .group542_in_valid(group542_in_valid),
    
    .group642_out_data(group642_out_data),
    .group642_out_valid(group642_out_valid),
    .group642_in_data(group642_in_data),
    .group642_in_valid(group642_in_valid),
    
    .group742_out_data(group742_out_data),
    .group742_out_valid(group742_out_valid),
    .group742_in_data(group742极_data),
    .group742_in_valid(group742_in_valid),
    
    .group842_out_data(group842_out_data),
    .group842_out_valid(group842_out_valid),
    .group842_in_data(group842_in_data),
    .group842_in_valid(group842_in_valid),
    
    // Spine 3 group ports
    .group413_out_data(group413_in_data),
    .group413_out_valid(group413_in_valid),
    .group413_in_data(group413_out_data),
    .group413_in_valid(group413_out_valid),
    
    .group423_out_data(group423_in_data),
    .group423_out_valid(group423_in_valid),
    .group423_in_data(group423_out_data),
    .group423_in_valid(group423_out_valid),
    
    .group433_out_data(group433_in_data),
    .group433_out_valid(group433_in_valid),
    .group433_in_data(group433_out_data),
    .group433_in_valid(group433_out_valid),
    
    .group543_out_data(group543_out_data),
    .group543_out_valid(group543_out_valid),
    .group543_in_data(group543_in_data),
    .group543_in_valid(group543_in_valid),
    
    .group643_out_data(group643_out_data),
    .group643_out_valid(group643_out_valid),
    .group643_in_data(group643_in_data),
    .group643_in_valid(group643_in_valid),
    
    .group743_out_data(group743_out_data),
    .group743_out_valid(group743_out_valid),
    .group743_in_data(group743_in_data),
    .group743_in_valid(group743_in_valid),
    
    .group843_out_data(group843_out_data),
    .group843_out_valid(group843_out_valid),
    .group843_in_data(group843_in_data),
    .group843_in_valid(group843_in_valid),
    
    // Spine 4 group ports
    .group414_out_data(group414_in_data),
    .极 group414_out_valid(group414_in_valid),
    .group414_in_data(group414_out_data),
    .group414_in_valid(group414_out_valid),
    
    .group424_out_data(group424_in_data),
    .group424_out_valid(group424_in_valid),
    .group424_in_data(group424_out_data),
    .group424_in_valid(group424_out_valid),
    
    .group434_out_data(group434_in_data),
    .group434_out_valid(group434_in_valid),
    .group434_in_data(group434_out_data),
    .group434_in_valid(group434_out_valid),
    
    .group544_out_data(group544_out_data),
    .group544_out_valid(group544_out_valid),
    .group544_in_data(group544_in_data),
    .group544_in_valid(group544极_valid),
    
    .group644_out_data(group644_out_data),
    .group644_out_valid(group644_out_valid),
    .group644_in_data(group644_in_data),
    .group644_in_valid(group644_in_valid),
    
    .group744_out_data(group744_out_data),
    .group744_out_valid(group744_out_valid),
    .group744_in_data(group744_in_data),
    .group744_in_valid(group744_in_valid),
    
    .group844_out_data(group844_out_data),
    .group844_out_valid(group844_out_valid),
    .group844_in_data(group844_in_data),
    .group844_in_valid(group844_in_valid)
  );

  group5 g5 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group511_out_data(group511_in_data),
    .group511_out_valid(group511_in_valid),
    .group511_in_data(group511_out_data),
    .group511_in_valid(group511_out_valid),
    
    .group521_out_data(group521_in_data),
    .group521_out_valid(group521_in_valid),
    .group521极_data(group521_out_data),
    .group521_in_valid(group521_out_valid),
    
    .group531_out_data(group531_in_data),
    .group531_out_valid(group531_in_valid),
    .group531_in_data(group531_out_data),
    .group531_in_valid(group531_out_valid),
    
    .group541_out_data(group541_in_data),
    .group541_out_valid(group541_in_valid),
    .group541_in_data(group541_out_data),
    .group541_in_valid(group541_out_valid),
    
    .group651_out_data(group651_out_data),
    .group651_out_valid(group651_out_valid),
    .group651_in_data(group651_in_data),
    .group651_in_valid(group651_in_valid),
    
    .group751_out_data(group751_out_data),
    .group751_out_valid(group751_out_valid),
    .group751_in_data(group751_in_data),
    .group751_in_valid(group751_in_valid),
    
    .group851_out_data(group851_out_data),
    .group851_out_valid(group851_out_valid),
    .group851_in_data(group851_in_data),
    .group851_in_valid(group851_in_valid),
    
    // Spine 2 group ports
    .group512_out_data(group512_in_data),
    .group512_out_valid(group512_in_valid),
    .group512_in_data(group512_out_data),
    .group512_in_valid(group512_out_valid),
    
    .group522_out_data(group522_in_data),
    .group522_out_valid(group522_in_valid),
    .group522_in_data(group522_out_data),
    .group522_in_valid(group522_out_valid),
    
    .group532_out_data(group532_in_data),
    .group532_out_valid(group532_in_valid),
    .group532_in_data(group532_out_data),
    .group532_in_valid(group532_out_valid),
    
    .group542_out_data(group542_in_data),
    .group542_out_valid(group542_in_valid),
    .group542_in_data(group542_out_data),
    .group542_in_valid(group542_out_valid),
    
    .group652_out_data(group652_out_data),
    .group652_out_valid(group652_out_valid),
    .group652_in_data(group652_in_data),
    .group652_in_valid(group652_in_valid),
    
    .group752_out_data(group752_out_data),
    .group752_out_valid(group752_out_valid),
    .group752_in_data(group752_in_data),
    .group752_in_valid(group752_in_valid),
    
    .group852_out_data(group852_out_data),
    .group852_out_valid(group852_out_valid),
    .group852极_data(group852_in_data),
    .group852_in_valid(group852_in_valid),
    
    // Spine 3 group ports
    .group513_out_data(group513_in_data),
    .group513_out_valid(group513_in_valid),
    .group513_in_data(group513_out_data),
    .group513_in_valid(group513_out_valid),
    
    .group523_out_data(group523_in_data),
    .group523_out_valid(group523_in_valid),
    .group523_in_data(group523_out_data),
    .group523_in_valid(group523_out_valid),
    
    .group533_out_data(group533_in_data),
    .group533_out_valid(group533_in_valid),
    .group533_in_data(group533_out_data),
    .group533_in_valid(group533_out_valid),
    
    .group543_out_data(group543_in_data),
    .group543_out_valid(group543_in_valid),
    .group543_in_data(group543_out_data),
    .group543_in_valid(group543_out_valid),
    
    .group653_out_data(group653_out_data),
    .group653_out_valid(group653_out_valid),
    .group653_in_data(group653_in_data),
    .group653_in_valid(group653_in_valid),
    
    .group753_out_data(group753_out_data),
    .group753_out_valid(group753_out_valid),
    .group753_in_data(group753_in_data),
    .group753_in_valid(group753_in_valid),
    
    .group853_out_data(group853_out_data),
    .group853_out_valid(group853_out_valid),
    .group853_in_data(group853_in_data),
    .group853_in_valid(group853_in_valid),
    
    // Spine 4 group ports
    .group514_out_data(group514_in_data),
    .group514_out_valid(group514_in_valid),
    .group514_in_data(group514_out_data),
    .group514_in_valid(group514_out_valid),
    
    .group524_out_data(group524_in_data),
    .group524_out_valid(group524极_valid),
    .group524_in_data(group524_out_data),
    .group524_in_valid(group524_out_valid),
    
    .group534_out_data(group534_in_data),
    .group534_out_valid(group534_in_valid),
    .group534_in_data(group534_out_data),
    .group534_in_valid(group534_out_valid),
    
    .group544_out_data(group544_in_data),
    .group544_out_valid(group544_in_valid),
    .group544_in_data(group544_out_data),
    .group544_in_valid(group544_out_valid),
    
    .group654_out_data(group654_out_data),
    .group654_out_valid(group654_out_valid),
    .group654_in_data(group654_in_data),
    .group654_in_valid(group654_in_valid),
    
    .group754_out_data(group754_out_data),
    .group754_out_valid(group754_out_valid),
    .group754_in_data(group754_in_data),
    .group754_in_valid(group754_in_valid),
    
    .group854_out_data(group854_out_data),
    .group854_out_valid(group854_out_valid),
    .group854_in_data(group854_in_data),
    .group854_in_valid(group854_in_valid)
  );

  group6 g6 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group611_out_data(group611_in_data),
    .group611_out_valid(group611_in_valid),
    .group611_in_data(group611_out_data),
    .group611_in_valid(group611_out_valid),
    
    .group621_out_data(group621_in_data),
    .group621_out_valid(group621_in_valid),
    .group621_in_data(group621_out_data),
    .group621_in_valid(group621_out_valid),
    
    .group631_out_data(group631_in_data),
    .group631_out_valid(group631_in_valid),
    .group631_in_data(group631_out_data),
    .group631_in_valid(group631_out_valid),
    
    .group641_out_data(group641_in_data),
    .group641_out_valid(group641_in_valid),
    .group641_in_data(group641_out_data),
    .group641_in_valid(group641_out_valid),
    
    .group651_out_data(group651_in_data),
    .group651_out_valid(group651_in_valid),
    .group651_in_data(group651_out_data),
    .group651_in_valid(group极_out_valid),
    
    .group761_out_data(group761_out_data),
    .group761_out_valid(group761_out_valid),
    .group761_in_data(group761_in_data),
    .group761_in_valid(group761_in_valid),
    
    .group861_out_data(group861_out_data),
    .group861_out_valid(group861_out_valid),
    .group861_in_data(group861_in_data),
    .group861_in_valid(group861_in_valid),
    
    // Spine 2 group ports
    .group612_out_data(group612_in_data),
    .group612_out_valid(group612_in_valid),
    .group612_in_data(group612_out_data),
    .group612极_valid(group612_out_valid),
    
    .group622_out_data(group622_in_data),
    .group622_out_valid(group622_in_valid),
    .group622_in_data(group622_out_data),
    .group622_in_valid(group622_out_valid),
    
    .group632_out_data(group极_in_data),
    .group632_out_valid(group632_in_valid),
    .group632_in_data(group632_out_data),
    .group632_in_valid(group632_out_valid),
    
    .group642_out_data(group642_in_data),
    .group642_out_valid(group642_in_valid),
    .group642_in_data(group642_out_data),
    .group642_in_valid(group642_out_valid),
    
    .group652_out_data(group652_in_data),
    .group652_out_valid(group652_in_valid),
    .group652_in_data(group652_out_data),
    .group652_in_valid(group652_out_valid),
    
    .group762_out_data(group762_out_data),
    .group762_out_valid(group762_out_valid),
    .group762_in_data(group762_in_data),
    .group762_in_valid(group762_in_valid),
    
    .group862_out_data(group862_out_data),
    .group862_out_valid(group862_out_valid),
    .group862_in_data(group862_in_data),
    .group862_in_valid(group862_in_valid),
    
    // Spine 3 group ports
    .group613_out_data(group613_in_data),
    .group613_out_valid(group613_in_valid),
    .group613_in_data(group613_out_data),
    .group613_in_valid(group613_out_valid),
    
    .group623_out_data(group623_in_data),
    .group623_out_valid(group623_in_valid),
    .group623_in_data(group623_out_data),
    .group623_in_valid(group623_out_valid),
    
    .group633_out_data(group633_in_data),
    .group633_out_valid(group633_in_valid),
    .group633_in_data(group633_out_data),
    .group633_in_valid(group633_out_valid),
    
    .group643_out_data(group643_in_data),
    .group643_out_valid(group643_in_valid),
    .group643极_data(group643_out_data),
    .group643_in_valid(group643_out_valid),
    
    .group653_out_data(group653_in_data),
    .group653_out_valid(group653_in_valid),
    .group653_in_data(group653_out_data),
    .group653_in_valid(group653_out_valid),
    
    .group763_out_data(group763_out_data),
    .group763_out_valid(group763_out_valid),
    .group763_in_data(group763_in_data),
    .group763_in_valid(group763_in_valid),
    
    .group863_out_data(group863_out_data),
    .group863_out_valid(group863_out_valid),
    .group863_in_data(group863_in_data),
    .group863_in_valid(group863_in_valid),
    
    // Spine 4 group ports
    .group614_out_data(group614_in_data),
    .group614_out_valid(group614_in_valid),
    .group614_in_data(group614_out_data),
    .group614_in_valid(group614_out_valid),
    
    .group624_out_data(group624_in_data),
    .group624_out_valid(group624_in_valid),
    .group624_in_data(group624_out_data),
    .group624_in_valid(group624_out_valid),
    
    .group634_out_data(group634_in_data),
    .group634_out_valid(group634_in_valid),
    .group634_in_data(group极_out_data),
    .group634_in_valid(group634_out_valid),
    
    .group644_out_data(group644_in_data),
    .group644_out_valid(group644_in_valid),
    .group644_in_data(group644_out_data),
    .group644_in_valid(group644_out_valid),
    
    .group654_out_data(group654_in_data),
    .group654_out_valid(group654_in_valid),
    .group654_in_data(group654_out极),
    .group654_in_valid(group654_out_valid),
    
    .group764_out_data(group764_out_data),
    .group764_out_valid(group764_out_valid),
    .group764_in_data(group764_in_data),
    .group764_in_valid(group764_in_valid),
    
    .group864_out_data(group864_out_data),
    .group864_out_valid(group864_out_valid),
    .group864_in_data(group864_in_data),
    .group864_in_valid(group864_in_valid)
  );

  group7 g7 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group711_out_data(group711_in_data),
    .group711_out_valid(group711_in_valid),
    .group711_in_data(group711_out_data),
    .group711_in_valid(group711_out_valid),
    
    .group721_out_data(group721_in_data),
    .group721_out_valid(group721_in_valid),
    .group721_in_data(group721_out_data),
    .group721_in_valid(group721_out_valid),
    
    .group731_out_data(group731_in_data),
    .group731_out_valid(group731_in_valid),
    .group731_in_data(group731_out_data),
    .group731_in_valid(group731_out_valid),
    
    .group741_out_data(group741_in_data),
    .group741_out_valid(group741_in_valid),
    .group741_in_data(group741_out_data),
    .group741_in_valid(group741_out_valid),
    
    .group751_out_data(group751_in_data),
    .group751_out_valid(group751_in_valid),
    .group751_in_data(group751_out_data),
    .group751_in_valid(group751_out_valid),
    
    .group761_out_data(group761_in_data),
    .group761_out_valid(group761_in_valid),
    .group761_in_data(group761_out_data),
    .group761_in_valid(group761_out_valid),
    
    .group871_out_data(group871_out_data),
    .group871_out_valid(group871_out_valid),
    .group871_in_data(group871_in_data),
    .group871_in_valid(group871_in_valid),
    
    // Spine 2 group ports
    .group712_out_data(group712_in_data),
    .group712_out_valid(group712极_valid),
    .group712_in_data(group712_out_data),
    .group712_in_valid(group712_out_valid),
    
    .group722_out_data(group722_in_data),
    .group722_out_valid(group722_in_valid),
    .group722_in_data(group722_out_data),
    .group722_in_valid(group722_out_valid),
    
    .group732_out_data(group732_in_data),
    .group732_out_valid(group732_in_valid),
    .group732_in_data(group732_out_data),
    .group732_in_valid(group732_out_valid),
    
    .group742_out_data(group742_in_data),
    .group742_out_valid(group742_in_valid),
    .group742_in_data(group742_out_data),
    .group742_in_valid(group742_out_valid),
    
    .group752_out_data(group752_in_data),
    .group752_out_valid(group752_in_valid),
    .group752_in_data(group752_out_data),
    .group752_in_valid(group752_out_valid),
    
    .group762_out_data(group762_in_data),
    .group762_out_valid(group762_in_valid),
    .group762_in_data(group762_out_data),
    .group762_in_valid(group762_out_valid),
    
    .group872_out_data(group872_out_data),
    .group872_out_valid(group872_out_valid),
    .group872_in_data(group872_in_data),
    .group872_in_valid(group872_in_valid),
    
    // Spine 3 group ports
    .group713_out_data(group713_in_data),
    .group713_out_valid(group713_in_valid),
    .group713极_data(group713_out_data),
    .group713_in_valid(group713_out_valid),
    
    .group723_out_data(group723_in_data),
    .group723_out_valid(group723_in_valid),
    .极 group723_in_data(group723_out_data),
    .group723_in_valid(group723_out_valid),
    
    .group733_out_data(group733_in_data),
    .group733_out_valid(group733_in_valid),
    .group733_in_data(group733_out_data),
    .group733_in_valid(group733_out_valid),
    
    .group743_out_data(group743_in_data),
    .group743_out_valid(group743_in_valid),
    .group743_in_data(group743_out_data),
    .group743_in_valid(group743_out_valid),
    
    .group753_out_data(group753_in_data),
    .group753_out_valid(group753_in_valid),
    .group753_in_data(group753_out_data),
    .group753_in_valid(group753_out_valid),
    
    .group763_out_data(group763_in_data),
    .group763_out_valid(group763_in_valid),
    .group763_in_data(group763_out_data),
    .group763_in_valid(group763_out_valid),
    
    .group873_out_data(group873_out极),
    .group873_out_valid(group873_out_valid),
    .group873_in_data(group873_in_data),
    .group873_in_valid(group873_in_valid),
    
    // Spine 4 group ports
    .group714_out_data(group714_in_data),
    .group714_out_valid(group714_in_valid),
    .group714_in_data(group714_out_data),
    .group714_in_valid(group714_out_valid),
    
    .group724_out_data(group724_in_data),
    .group724_out_valid(group724_in_valid),
    .group724_in_data(group724_out_data),
    .group724_in_valid(group724_out_valid),
    
    .group734_out_data(group734_in_data),
    .group734_out_valid(group734_in_valid),
    .group734_in_data(group734_out_data),
    .group734_in_valid(group734_out_valid),
    
    .group744_out_data(group744_in_data),
    .group744_out_valid(group744_in_valid),
    .group744_in_data(group744_out_data),
    .group744_in_valid(group744_out_valid),
    
    .group754_out_data(group754_in_data),
    .group754_out_valid(group754_in_valid),
    .group754_in_data(group754_out_data),
    .group754_in_valid(group754_out_valid),
    
    .group764_out_data(group764_in_data),
    .group764_out_valid(group764_in_valid),
    .group764_in_data(group764_out_data),
    .group764_in_valid(group764_out_valid),
    
    .group874_out_data(group874_out_data),
    .group874_out_valid(group874_out_valid),
    .group874_in_data(group874_in_data),
    .group874_in_valid(group874_in_valid)
  );

  group8 g8 (
    .ACLK(ACLK),
    .ARESETn(ARESETn),
    
    // Spine 1 group ports
    .group811_out_data(group811_in_data),
    .group811_out_valid(group811_in_valid),
    .group811_in_data(group811_out_data),
    .group811_in_valid(group811_out_valid),
    
    .group821_out_data(group821_in_data),
    .group821_out_valid(group821_in_valid),
    .group821_in_data(group821_out_data),
    .group821_in_valid(group821_out_valid),
    
    .group831_out_data(group831_in_data),
    .group831_out_valid(group831_in_valid),
    .group831_in_data(group831_out_data),
    .group831_in_valid(group831_out_valid),
    
    .group841_out_data(group841_in_data),
    .group841_out_valid(group841_in_valid),
    .group841_in_data(group841_out_data),
    .group841_in_valid(group841_out_valid),
    
    .group851_out_data(group851_in_data),
    .group851_out_valid(group851_in_valid),
    .group851_in_data(group851_out_data),
    .group851_in_valid(group851_out_valid),
    
    .group861_out_data(group861_in_data),
    .group861_out_valid(group861_in_valid),
    .group861_in_data(group861_out_data),
    .group861_in_valid(group861_out_valid),
    
    .group871_out_data(group871_in_data),
    .group871_out_valid(group871_in_valid),
    .group871_in_data(group871_out_data),
    .group871_in_valid(group871_out_valid),
    
    // Spine 2 group ports
    .group812_out_data(group812_in_data),
    .group812_out_valid(group812_in_valid),
    .group812_in_data(group812_out_data),
    .group812_in_valid(group812_out_valid),
    
    .group822_out_data(group822_in_data),
    .group822_out_valid(group822_in_valid),
    .group822极_data(group822_out_data),
    .group822_in_valid(group822_out_valid),
    
    .group832_out_data(group832_in_data),
    .group832_out_valid(group832_in_valid),
    .group832_in_data(group832_out_data),
    .group832_in_valid(group832_out_valid),
    
    .group842_out_data(group842_in_data),
    .group842_out_valid(group842_in_valid),
    .group842_in_data(group842_out_data),
    .group842_in_valid(group842_out_valid),
    
    .group852_out_data(group852_in_data),
    .group852_out_valid(group852_in_valid),
    .group852_in_data(group852_out_data),
    .group852_in_valid(group852_out_valid),
    
    .group862_out_data(group862_in_data),
    .group862_out_valid(group862_in_valid),
    .group862_in_data(group862_out_data),
    .group862_in_valid(group862_out_valid),
    
    .group872_out_data(group872_in_data),
    .group872_out_valid(group872_in_valid),
    .group872_in_data(group872_out_data),
    .group872_in_valid(group872_out_valid),
    
    // Spine 3 group ports
    .group813_out_data(group813_in_data),
    .group813_out_valid(group813_in_valid),
    .group813_in_data(group813_out_data),
    .group813_in_valid(group813_out_valid),
    
    .group823_out_data(group823_in_data),
    .group823_out_valid(group823_in_valid),
    .group823_in_data(group823_out_data),
    .group823_in_valid(group823_out_valid),
    
    .group833_out_data(group833_in_data),
    .group833_out_valid(group833_in_valid),
    .group833_in_data(group833_out_data),
    .group833极_valid(group833_out_valid),
    
    .group843_out_data(group843_in_data),
    .group843_out_valid(group843_in_valid),
    .group843_in_data(group843_out_data),
    .group843_in_valid(group843_out_valid),
    
    .group853_out极(group853_in_data),
    .group853_out_valid(group853_in_valid),
    .group853_in_data(group853_out_data),
    .group853_in_valid(group853_out_valid),
    
    .group863_out_data(group863_in_data),
    .group863_out_valid(group863_in_valid),
    .group863_in_data(group863_out_data),
    .group863_in_valid(group863_out_valid),
    
    .group873_out_data(group873_in_data),
    .group873_out_valid(group873_in_valid),
    .group873_in_data(group873_out_data),
    .group873_in_valid(group873_out_valid),
    
    // Spine 4 group ports
    .group814_out_data(group814_in_data),
    .group814_out_valid(group814_in_valid),
    .group814_in_data(group814_out_data),
    .group814_in_valid(group814_out_valid),
    
    .group824_out_data(group824_in_data),
    .group824_out_valid(group824_in_valid),
    .group824_in_data(group824_out_data),
    .group824_in_valid(group824_out_valid),
    
    .group834_out_data(group834_in_data),
    .group834_out_valid(group834_in_valid),
    .group834_in_data(group834_out_data),
    .group834_in_valid(group834_out_valid),
    
    .group844_out_data(group844_in_data),
    .group844_out_valid(group844_in_valid),
    .group844_in_data(group844_out_data),
    .group844_in_valid(group844_out_valid),
    
    .group854_out_data(group854_in_data),
    .group854_out_valid(group854_in_valid),
    .group854_in_data(group854_out_data),
    .group854_in_valid(group854_out_valid),
    
    .group864_out_data(group864_in_data),
    .group864_out_valid(group864_in_valid),
    .group864_in_data(group864_out_data),
    .group864_in_valid(group864_out_valid),
    
    .group874_out_data(group874_in_data),
    .group874_out_valid(group874_in_valid),
    .group874_in_data(group874_out_data),
    .group874_in_valid(group874_out_valid)
  );

endmodule
