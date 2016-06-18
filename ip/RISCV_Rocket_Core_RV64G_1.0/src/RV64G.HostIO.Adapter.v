module MultiWidthFifo(
  input   clk,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input  [15:0] io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output [31:0] io_out_bits,
  output [5:0] io_count
);
  reg [15:0] T_24_0;
  reg [31:0] GEN_66;
  reg [15:0] T_24_1;
  reg [31:0] GEN_196;
  reg [15:0] T_24_2;
  reg [31:0] GEN_199;
  reg [15:0] T_24_3;
  reg [31:0] GEN_201;
  reg [15:0] T_24_4;
  reg [31:0] GEN_202;
  reg [15:0] T_24_5;
  reg [31:0] GEN_217;
  reg [15:0] T_24_6;
  reg [31:0] GEN_218;
  reg [15:0] T_24_7;
  reg [31:0] GEN_219;
  reg [15:0] T_24_8;
  reg [31:0] GEN_220;
  reg [15:0] T_24_9;
  reg [31:0] GEN_221;
  reg [15:0] T_24_10;
  reg [31:0] GEN_222;
  reg [15:0] T_24_11;
  reg [31:0] GEN_223;
  reg [15:0] T_24_12;
  reg [31:0] GEN_224;
  reg [15:0] T_24_13;
  reg [31:0] GEN_225;
  reg [15:0] T_24_14;
  reg [31:0] GEN_226;
  reg [15:0] T_24_15;
  reg [31:0] GEN_227;
  reg [15:0] T_24_16;
  reg [31:0] GEN_228;
  reg [15:0] T_24_17;
  reg [31:0] GEN_229;
  reg [15:0] T_24_18;
  reg [31:0] GEN_230;
  reg [15:0] T_24_19;
  reg [31:0] GEN_231;
  reg [15:0] T_24_20;
  reg [31:0] GEN_232;
  reg [15:0] T_24_21;
  reg [31:0] GEN_233;
  reg [15:0] T_24_22;
  reg [31:0] GEN_234;
  reg [15:0] T_24_23;
  reg [31:0] GEN_235;
  reg [15:0] T_24_24;
  reg [31:0] GEN_236;
  reg [15:0] T_24_25;
  reg [31:0] GEN_237;
  reg [15:0] T_24_26;
  reg [31:0] GEN_238;
  reg [15:0] T_24_27;
  reg [31:0] GEN_239;
  reg [15:0] T_24_28;
  reg [31:0] GEN_240;
  reg [15:0] T_24_29;
  reg [31:0] GEN_241;
  reg [15:0] T_24_30;
  reg [31:0] GEN_242;
  reg [15:0] T_24_31;
  reg [31:0] GEN_243;
  reg [15:0] T_24_32;
  reg [31:0] GEN_244;
  reg [15:0] T_24_33;
  reg [31:0] GEN_245;
  reg [15:0] T_24_34;
  reg [31:0] GEN_246;
  reg [15:0] T_24_35;
  reg [31:0] GEN_247;
  reg [15:0] T_24_36;
  reg [31:0] GEN_248;
  reg [15:0] T_24_37;
  reg [31:0] GEN_249;
  reg [15:0] T_24_38;
  reg [31:0] GEN_250;
  reg [15:0] T_24_39;
  reg [31:0] GEN_251;
  reg [15:0] T_24_40;
  reg [31:0] GEN_252;
  reg [15:0] T_24_41;
  reg [31:0] GEN_253;
  reg [15:0] T_24_42;
  reg [31:0] GEN_254;
  reg [15:0] T_24_43;
  reg [31:0] GEN_255;
  reg [15:0] T_24_44;
  reg [31:0] GEN_256;
  reg [15:0] T_24_45;
  reg [31:0] GEN_257;
  reg [15:0] T_24_46;
  reg [31:0] GEN_258;
  reg [15:0] T_24_47;
  reg [31:0] GEN_259;
  reg [15:0] T_24_48;
  reg [31:0] GEN_260;
  reg [15:0] T_24_49;
  reg [31:0] GEN_261;
  reg [15:0] T_24_50;
  reg [31:0] GEN_262;
  reg [15:0] T_24_51;
  reg [31:0] GEN_263;
  reg [15:0] T_24_52;
  reg [31:0] GEN_264;
  reg [15:0] T_24_53;
  reg [31:0] GEN_265;
  reg [15:0] T_24_54;
  reg [31:0] GEN_266;
  reg [15:0] T_24_55;
  reg [31:0] GEN_267;
  reg [15:0] T_24_56;
  reg [31:0] GEN_268;
  reg [15:0] T_24_57;
  reg [31:0] GEN_269;
  reg [15:0] T_24_58;
  reg [31:0] GEN_270;
  reg [15:0] T_24_59;
  reg [31:0] GEN_271;
  reg [15:0] T_24_60;
  reg [31:0] GEN_272;
  reg [15:0] T_24_61;
  reg [31:0] GEN_273;
  reg [15:0] T_24_62;
  reg [31:0] GEN_274;
  reg [15:0] T_24_63;
  reg [31:0] GEN_275;
  wire [31:0] T_26;
  wire [31:0] T_27;
  wire [31:0] T_28;
  wire [31:0] T_29;
  wire [31:0] T_30;
  wire [31:0] T_31;
  wire [31:0] T_32;
  wire [31:0] T_33;
  wire [31:0] T_34;
  wire [31:0] T_35;
  wire [31:0] T_36;
  wire [31:0] T_37;
  wire [31:0] T_38;
  wire [31:0] T_39;
  wire [31:0] T_40;
  wire [31:0] T_41;
  wire [31:0] T_42;
  wire [31:0] T_43;
  wire [31:0] T_44;
  wire [31:0] T_45;
  wire [31:0] T_46;
  wire [31:0] T_47;
  wire [31:0] T_48;
  wire [31:0] T_49;
  wire [31:0] T_50;
  wire [31:0] T_51;
  wire [31:0] T_52;
  wire [31:0] T_53;
  wire [31:0] T_54;
  wire [31:0] T_55;
  wire [31:0] T_56;
  wire [31:0] T_57;
  wire [31:0] T_63_0;
  wire [31:0] T_63_1;
  wire [31:0] T_63_2;
  wire [31:0] T_63_3;
  wire [31:0] T_63_4;
  wire [31:0] T_63_5;
  wire [31:0] T_63_6;
  wire [31:0] T_63_7;
  wire [31:0] T_63_8;
  wire [31:0] T_63_9;
  wire [31:0] T_63_10;
  wire [31:0] T_63_11;
  wire [31:0] T_63_12;
  wire [31:0] T_63_13;
  wire [31:0] T_63_14;
  wire [31:0] T_63_15;
  wire [31:0] T_63_16;
  wire [31:0] T_63_17;
  wire [31:0] T_63_18;
  wire [31:0] T_63_19;
  wire [31:0] T_63_20;
  wire [31:0] T_63_21;
  wire [31:0] T_63_22;
  wire [31:0] T_63_23;
  wire [31:0] T_63_24;
  wire [31:0] T_63_25;
  wire [31:0] T_63_26;
  wire [31:0] T_63_27;
  wire [31:0] T_63_28;
  wire [31:0] T_63_29;
  wire [31:0] T_63_30;
  wire [31:0] T_63_31;
  reg [5:0] T_66;
  reg [31:0] GEN_276;
  reg [4:0] T_68;
  reg [31:0] GEN_277;
  reg [6:0] T_70;
  reg [31:0] GEN_278;
  wire  T_71;
  wire [15:0] GEN_0;
  wire [5:0] GEN_164;
  wire [15:0] GEN_2;
  wire [5:0] GEN_165;
  wire [15:0] GEN_3;
  wire [5:0] GEN_166;
  wire [15:0] GEN_4;
  wire [5:0] GEN_167;
  wire [15:0] GEN_5;
  wire [5:0] GEN_168;
  wire [15:0] GEN_6;
  wire [5:0] GEN_169;
  wire [15:0] GEN_7;
  wire [5:0] GEN_170;
  wire [15:0] GEN_8;
  wire [5:0] GEN_171;
  wire [15:0] GEN_9;
  wire [5:0] GEN_172;
  wire [15:0] GEN_10;
  wire [5:0] GEN_173;
  wire [15:0] GEN_11;
  wire [5:0] GEN_174;
  wire [15:0] GEN_12;
  wire [5:0] GEN_175;
  wire [15:0] GEN_13;
  wire [5:0] GEN_176;
  wire [15:0] GEN_14;
  wire [5:0] GEN_177;
  wire [15:0] GEN_15;
  wire [5:0] GEN_178;
  wire [15:0] GEN_16;
  wire [5:0] GEN_179;
  wire [15:0] GEN_17;
  wire [5:0] GEN_180;
  wire [15:0] GEN_18;
  wire [5:0] GEN_181;
  wire [15:0] GEN_19;
  wire [5:0] GEN_182;
  wire [15:0] GEN_20;
  wire [5:0] GEN_183;
  wire [15:0] GEN_21;
  wire [5:0] GEN_184;
  wire [15:0] GEN_22;
  wire [5:0] GEN_185;
  wire [15:0] GEN_23;
  wire [5:0] GEN_186;
  wire [15:0] GEN_24;
  wire [5:0] GEN_187;
  wire [15:0] GEN_25;
  wire [5:0] GEN_188;
  wire [15:0] GEN_26;
  wire [5:0] GEN_189;
  wire [15:0] GEN_27;
  wire [5:0] GEN_190;
  wire [15:0] GEN_28;
  wire [5:0] GEN_191;
  wire [15:0] GEN_29;
  wire [5:0] GEN_192;
  wire [15:0] GEN_30;
  wire [5:0] GEN_193;
  wire [15:0] GEN_31;
  wire [5:0] GEN_194;
  wire [15:0] GEN_32;
  wire [5:0] GEN_195;
  wire [15:0] GEN_33;
  wire [15:0] GEN_34;
  wire [15:0] GEN_35;
  wire [15:0] GEN_36;
  wire [15:0] GEN_37;
  wire [15:0] GEN_38;
  wire [15:0] GEN_39;
  wire [15:0] GEN_40;
  wire [15:0] GEN_41;
  wire [15:0] GEN_42;
  wire [15:0] GEN_43;
  wire [15:0] GEN_44;
  wire [15:0] GEN_45;
  wire [15:0] GEN_46;
  wire [15:0] GEN_47;
  wire [15:0] GEN_48;
  wire [15:0] GEN_49;
  wire [15:0] GEN_50;
  wire [15:0] GEN_51;
  wire [15:0] GEN_52;
  wire [15:0] GEN_53;
  wire [15:0] GEN_54;
  wire [15:0] GEN_55;
  wire [15:0] GEN_56;
  wire [15:0] GEN_57;
  wire [15:0] GEN_58;
  wire [15:0] GEN_59;
  wire [15:0] GEN_60;
  wire [15:0] GEN_61;
  wire [15:0] GEN_62;
  wire [15:0] GEN_63;
  wire [15:0] GEN_64;
  wire [15:0] GEN_65;
  wire [6:0] T_73;
  wire [5:0] T_74;
  wire [15:0] GEN_67;
  wire [15:0] GEN_68;
  wire [15:0] GEN_69;
  wire [15:0] GEN_70;
  wire [15:0] GEN_71;
  wire [15:0] GEN_72;
  wire [15:0] GEN_73;
  wire [15:0] GEN_74;
  wire [15:0] GEN_75;
  wire [15:0] GEN_76;
  wire [15:0] GEN_77;
  wire [15:0] GEN_78;
  wire [15:0] GEN_79;
  wire [15:0] GEN_80;
  wire [15:0] GEN_81;
  wire [15:0] GEN_82;
  wire [15:0] GEN_83;
  wire [15:0] GEN_84;
  wire [15:0] GEN_85;
  wire [15:0] GEN_86;
  wire [15:0] GEN_87;
  wire [15:0] GEN_88;
  wire [15:0] GEN_89;
  wire [15:0] GEN_90;
  wire [15:0] GEN_91;
  wire [15:0] GEN_92;
  wire [15:0] GEN_93;
  wire [15:0] GEN_94;
  wire [15:0] GEN_95;
  wire [15:0] GEN_96;
  wire [15:0] GEN_97;
  wire [15:0] GEN_98;
  wire [15:0] GEN_99;
  wire [15:0] GEN_100;
  wire [15:0] GEN_101;
  wire [15:0] GEN_102;
  wire [15:0] GEN_103;
  wire [15:0] GEN_104;
  wire [15:0] GEN_105;
  wire [15:0] GEN_106;
  wire [15:0] GEN_107;
  wire [15:0] GEN_108;
  wire [15:0] GEN_109;
  wire [15:0] GEN_110;
  wire [15:0] GEN_111;
  wire [15:0] GEN_112;
  wire [15:0] GEN_113;
  wire [15:0] GEN_114;
  wire [15:0] GEN_115;
  wire [15:0] GEN_116;
  wire [15:0] GEN_117;
  wire [15:0] GEN_118;
  wire [15:0] GEN_119;
  wire [15:0] GEN_120;
  wire [15:0] GEN_121;
  wire [15:0] GEN_122;
  wire [15:0] GEN_123;
  wire [15:0] GEN_124;
  wire [15:0] GEN_125;
  wire [15:0] GEN_126;
  wire [15:0] GEN_127;
  wire [15:0] GEN_128;
  wire [15:0] GEN_129;
  wire [15:0] GEN_130;
  wire [5:0] GEN_131;
  wire  T_75;
  wire [4:0] GEN_197;
  wire [5:0] T_77;
  wire [4:0] T_78;
  wire [4:0] GEN_132;
  wire  T_81;
  wire [6:0] GEN_198;
  wire [7:0] T_83;
  wire [6:0] T_84;
  wire [7:0] T_87;
  wire [6:0] T_88;
  wire [6:0] GEN_200;
  wire [7:0] T_91;
  wire [6:0] T_92;
  wire [6:0] T_93;
  wire [6:0] T_94;
  wire [6:0] T_95;
  wire [6:0] T_97;
  wire  T_99;
  wire [31:0] GEN_1;
  wire [31:0] GEN_133;
  wire [4:0] GEN_203;
  wire [31:0] GEN_134;
  wire [4:0] GEN_204;
  wire [31:0] GEN_135;
  wire [4:0] GEN_205;
  wire [31:0] GEN_136;
  wire [4:0] GEN_206;
  wire [31:0] GEN_137;
  wire [4:0] GEN_207;
  wire [31:0] GEN_138;
  wire [4:0] GEN_208;
  wire [31:0] GEN_139;
  wire [4:0] GEN_209;
  wire [31:0] GEN_140;
  wire [4:0] GEN_210;
  wire [31:0] GEN_141;
  wire [4:0] GEN_211;
  wire [31:0] GEN_142;
  wire [4:0] GEN_212;
  wire [31:0] GEN_143;
  wire [4:0] GEN_213;
  wire [31:0] GEN_144;
  wire [4:0] GEN_214;
  wire [31:0] GEN_145;
  wire [4:0] GEN_215;
  wire [31:0] GEN_146;
  wire [4:0] GEN_216;
  wire [31:0] GEN_147;
  wire [31:0] GEN_148;
  wire [31:0] GEN_149;
  wire [31:0] GEN_150;
  wire [31:0] GEN_151;
  wire [31:0] GEN_152;
  wire [31:0] GEN_153;
  wire [31:0] GEN_154;
  wire [31:0] GEN_155;
  wire [31:0] GEN_156;
  wire [31:0] GEN_157;
  wire [31:0] GEN_158;
  wire [31:0] GEN_159;
  wire [31:0] GEN_160;
  wire [31:0] GEN_161;
  wire [31:0] GEN_162;
  wire [31:0] GEN_163;
  wire  T_101;
  assign io_in_ready = T_101;
  assign io_out_valid = T_99;
  assign io_out_bits = GEN_1;
  assign io_count = T_97[5:0];
  assign T_26 = {T_24_1,T_24_0};
  assign T_27 = {T_24_3,T_24_2};
  assign T_28 = {T_24_5,T_24_4};
  assign T_29 = {T_24_7,T_24_6};
  assign T_30 = {T_24_9,T_24_8};
  assign T_31 = {T_24_11,T_24_10};
  assign T_32 = {T_24_13,T_24_12};
  assign T_33 = {T_24_15,T_24_14};
  assign T_34 = {T_24_17,T_24_16};
  assign T_35 = {T_24_19,T_24_18};
  assign T_36 = {T_24_21,T_24_20};
  assign T_37 = {T_24_23,T_24_22};
  assign T_38 = {T_24_25,T_24_24};
  assign T_39 = {T_24_27,T_24_26};
  assign T_40 = {T_24_29,T_24_28};
  assign T_41 = {T_24_31,T_24_30};
  assign T_42 = {T_24_33,T_24_32};
  assign T_43 = {T_24_35,T_24_34};
  assign T_44 = {T_24_37,T_24_36};
  assign T_45 = {T_24_39,T_24_38};
  assign T_46 = {T_24_41,T_24_40};
  assign T_47 = {T_24_43,T_24_42};
  assign T_48 = {T_24_45,T_24_44};
  assign T_49 = {T_24_47,T_24_46};
  assign T_50 = {T_24_49,T_24_48};
  assign T_51 = {T_24_51,T_24_50};
  assign T_52 = {T_24_53,T_24_52};
  assign T_53 = {T_24_55,T_24_54};
  assign T_54 = {T_24_57,T_24_56};
  assign T_55 = {T_24_59,T_24_58};
  assign T_56 = {T_24_61,T_24_60};
  assign T_57 = {T_24_63,T_24_62};
  assign T_63_0 = T_26;
  assign T_63_1 = T_27;
  assign T_63_2 = T_28;
  assign T_63_3 = T_29;
  assign T_63_4 = T_30;
  assign T_63_5 = T_31;
  assign T_63_6 = T_32;
  assign T_63_7 = T_33;
  assign T_63_8 = T_34;
  assign T_63_9 = T_35;
  assign T_63_10 = T_36;
  assign T_63_11 = T_37;
  assign T_63_12 = T_38;
  assign T_63_13 = T_39;
  assign T_63_14 = T_40;
  assign T_63_15 = T_41;
  assign T_63_16 = T_42;
  assign T_63_17 = T_43;
  assign T_63_18 = T_44;
  assign T_63_19 = T_45;
  assign T_63_20 = T_46;
  assign T_63_21 = T_47;
  assign T_63_22 = T_48;
  assign T_63_23 = T_49;
  assign T_63_24 = T_50;
  assign T_63_25 = T_51;
  assign T_63_26 = T_52;
  assign T_63_27 = T_53;
  assign T_63_28 = T_54;
  assign T_63_29 = T_55;
  assign T_63_30 = T_56;
  assign T_63_31 = T_57;
  assign T_71 = io_in_ready & io_in_valid;
  assign GEN_0 = io_in_bits;
  assign GEN_164 = {{5'd0}, 1'h0};
  assign GEN_2 = GEN_164 == T_66 ? GEN_0 : T_24_0;
  assign GEN_165 = {{5'd0}, 1'h1};
  assign GEN_3 = GEN_165 == T_66 ? GEN_0 : T_24_1;
  assign GEN_166 = {{4'd0}, 2'h2};
  assign GEN_4 = GEN_166 == T_66 ? GEN_0 : T_24_2;
  assign GEN_167 = {{4'd0}, 2'h3};
  assign GEN_5 = GEN_167 == T_66 ? GEN_0 : T_24_3;
  assign GEN_168 = {{3'd0}, 3'h4};
  assign GEN_6 = GEN_168 == T_66 ? GEN_0 : T_24_4;
  assign GEN_169 = {{3'd0}, 3'h5};
  assign GEN_7 = GEN_169 == T_66 ? GEN_0 : T_24_5;
  assign GEN_170 = {{3'd0}, 3'h6};
  assign GEN_8 = GEN_170 == T_66 ? GEN_0 : T_24_6;
  assign GEN_171 = {{3'd0}, 3'h7};
  assign GEN_9 = GEN_171 == T_66 ? GEN_0 : T_24_7;
  assign GEN_172 = {{2'd0}, 4'h8};
  assign GEN_10 = GEN_172 == T_66 ? GEN_0 : T_24_8;
  assign GEN_173 = {{2'd0}, 4'h9};
  assign GEN_11 = GEN_173 == T_66 ? GEN_0 : T_24_9;
  assign GEN_174 = {{2'd0}, 4'ha};
  assign GEN_12 = GEN_174 == T_66 ? GEN_0 : T_24_10;
  assign GEN_175 = {{2'd0}, 4'hb};
  assign GEN_13 = GEN_175 == T_66 ? GEN_0 : T_24_11;
  assign GEN_176 = {{2'd0}, 4'hc};
  assign GEN_14 = GEN_176 == T_66 ? GEN_0 : T_24_12;
  assign GEN_177 = {{2'd0}, 4'hd};
  assign GEN_15 = GEN_177 == T_66 ? GEN_0 : T_24_13;
  assign GEN_178 = {{2'd0}, 4'he};
  assign GEN_16 = GEN_178 == T_66 ? GEN_0 : T_24_14;
  assign GEN_179 = {{2'd0}, 4'hf};
  assign GEN_17 = GEN_179 == T_66 ? GEN_0 : T_24_15;
  assign GEN_180 = {{1'd0}, 5'h10};
  assign GEN_18 = GEN_180 == T_66 ? GEN_0 : T_24_16;
  assign GEN_181 = {{1'd0}, 5'h11};
  assign GEN_19 = GEN_181 == T_66 ? GEN_0 : T_24_17;
  assign GEN_182 = {{1'd0}, 5'h12};
  assign GEN_20 = GEN_182 == T_66 ? GEN_0 : T_24_18;
  assign GEN_183 = {{1'd0}, 5'h13};
  assign GEN_21 = GEN_183 == T_66 ? GEN_0 : T_24_19;
  assign GEN_184 = {{1'd0}, 5'h14};
  assign GEN_22 = GEN_184 == T_66 ? GEN_0 : T_24_20;
  assign GEN_185 = {{1'd0}, 5'h15};
  assign GEN_23 = GEN_185 == T_66 ? GEN_0 : T_24_21;
  assign GEN_186 = {{1'd0}, 5'h16};
  assign GEN_24 = GEN_186 == T_66 ? GEN_0 : T_24_22;
  assign GEN_187 = {{1'd0}, 5'h17};
  assign GEN_25 = GEN_187 == T_66 ? GEN_0 : T_24_23;
  assign GEN_188 = {{1'd0}, 5'h18};
  assign GEN_26 = GEN_188 == T_66 ? GEN_0 : T_24_24;
  assign GEN_189 = {{1'd0}, 5'h19};
  assign GEN_27 = GEN_189 == T_66 ? GEN_0 : T_24_25;
  assign GEN_190 = {{1'd0}, 5'h1a};
  assign GEN_28 = GEN_190 == T_66 ? GEN_0 : T_24_26;
  assign GEN_191 = {{1'd0}, 5'h1b};
  assign GEN_29 = GEN_191 == T_66 ? GEN_0 : T_24_27;
  assign GEN_192 = {{1'd0}, 5'h1c};
  assign GEN_30 = GEN_192 == T_66 ? GEN_0 : T_24_28;
  assign GEN_193 = {{1'd0}, 5'h1d};
  assign GEN_31 = GEN_193 == T_66 ? GEN_0 : T_24_29;
  assign GEN_194 = {{1'd0}, 5'h1e};
  assign GEN_32 = GEN_194 == T_66 ? GEN_0 : T_24_30;
  assign GEN_195 = {{1'd0}, 5'h1f};
  assign GEN_33 = GEN_195 == T_66 ? GEN_0 : T_24_31;
  assign GEN_34 = 6'h20 == T_66 ? GEN_0 : T_24_32;
  assign GEN_35 = 6'h21 == T_66 ? GEN_0 : T_24_33;
  assign GEN_36 = 6'h22 == T_66 ? GEN_0 : T_24_34;
  assign GEN_37 = 6'h23 == T_66 ? GEN_0 : T_24_35;
  assign GEN_38 = 6'h24 == T_66 ? GEN_0 : T_24_36;
  assign GEN_39 = 6'h25 == T_66 ? GEN_0 : T_24_37;
  assign GEN_40 = 6'h26 == T_66 ? GEN_0 : T_24_38;
  assign GEN_41 = 6'h27 == T_66 ? GEN_0 : T_24_39;
  assign GEN_42 = 6'h28 == T_66 ? GEN_0 : T_24_40;
  assign GEN_43 = 6'h29 == T_66 ? GEN_0 : T_24_41;
  assign GEN_44 = 6'h2a == T_66 ? GEN_0 : T_24_42;
  assign GEN_45 = 6'h2b == T_66 ? GEN_0 : T_24_43;
  assign GEN_46 = 6'h2c == T_66 ? GEN_0 : T_24_44;
  assign GEN_47 = 6'h2d == T_66 ? GEN_0 : T_24_45;
  assign GEN_48 = 6'h2e == T_66 ? GEN_0 : T_24_46;
  assign GEN_49 = 6'h2f == T_66 ? GEN_0 : T_24_47;
  assign GEN_50 = 6'h30 == T_66 ? GEN_0 : T_24_48;
  assign GEN_51 = 6'h31 == T_66 ? GEN_0 : T_24_49;
  assign GEN_52 = 6'h32 == T_66 ? GEN_0 : T_24_50;
  assign GEN_53 = 6'h33 == T_66 ? GEN_0 : T_24_51;
  assign GEN_54 = 6'h34 == T_66 ? GEN_0 : T_24_52;
  assign GEN_55 = 6'h35 == T_66 ? GEN_0 : T_24_53;
  assign GEN_56 = 6'h36 == T_66 ? GEN_0 : T_24_54;
  assign GEN_57 = 6'h37 == T_66 ? GEN_0 : T_24_55;
  assign GEN_58 = 6'h38 == T_66 ? GEN_0 : T_24_56;
  assign GEN_59 = 6'h39 == T_66 ? GEN_0 : T_24_57;
  assign GEN_60 = 6'h3a == T_66 ? GEN_0 : T_24_58;
  assign GEN_61 = 6'h3b == T_66 ? GEN_0 : T_24_59;
  assign GEN_62 = 6'h3c == T_66 ? GEN_0 : T_24_60;
  assign GEN_63 = 6'h3d == T_66 ? GEN_0 : T_24_61;
  assign GEN_64 = 6'h3e == T_66 ? GEN_0 : T_24_62;
  assign GEN_65 = 6'h3f == T_66 ? GEN_0 : T_24_63;
  assign T_73 = T_66 + GEN_165;
  assign T_74 = T_73[5:0];
  assign GEN_67 = T_71 ? GEN_2 : T_24_0;
  assign GEN_68 = T_71 ? GEN_3 : T_24_1;
  assign GEN_69 = T_71 ? GEN_4 : T_24_2;
  assign GEN_70 = T_71 ? GEN_5 : T_24_3;
  assign GEN_71 = T_71 ? GEN_6 : T_24_4;
  assign GEN_72 = T_71 ? GEN_7 : T_24_5;
  assign GEN_73 = T_71 ? GEN_8 : T_24_6;
  assign GEN_74 = T_71 ? GEN_9 : T_24_7;
  assign GEN_75 = T_71 ? GEN_10 : T_24_8;
  assign GEN_76 = T_71 ? GEN_11 : T_24_9;
  assign GEN_77 = T_71 ? GEN_12 : T_24_10;
  assign GEN_78 = T_71 ? GEN_13 : T_24_11;
  assign GEN_79 = T_71 ? GEN_14 : T_24_12;
  assign GEN_80 = T_71 ? GEN_15 : T_24_13;
  assign GEN_81 = T_71 ? GEN_16 : T_24_14;
  assign GEN_82 = T_71 ? GEN_17 : T_24_15;
  assign GEN_83 = T_71 ? GEN_18 : T_24_16;
  assign GEN_84 = T_71 ? GEN_19 : T_24_17;
  assign GEN_85 = T_71 ? GEN_20 : T_24_18;
  assign GEN_86 = T_71 ? GEN_21 : T_24_19;
  assign GEN_87 = T_71 ? GEN_22 : T_24_20;
  assign GEN_88 = T_71 ? GEN_23 : T_24_21;
  assign GEN_89 = T_71 ? GEN_24 : T_24_22;
  assign GEN_90 = T_71 ? GEN_25 : T_24_23;
  assign GEN_91 = T_71 ? GEN_26 : T_24_24;
  assign GEN_92 = T_71 ? GEN_27 : T_24_25;
  assign GEN_93 = T_71 ? GEN_28 : T_24_26;
  assign GEN_94 = T_71 ? GEN_29 : T_24_27;
  assign GEN_95 = T_71 ? GEN_30 : T_24_28;
  assign GEN_96 = T_71 ? GEN_31 : T_24_29;
  assign GEN_97 = T_71 ? GEN_32 : T_24_30;
  assign GEN_98 = T_71 ? GEN_33 : T_24_31;
  assign GEN_99 = T_71 ? GEN_34 : T_24_32;
  assign GEN_100 = T_71 ? GEN_35 : T_24_33;
  assign GEN_101 = T_71 ? GEN_36 : T_24_34;
  assign GEN_102 = T_71 ? GEN_37 : T_24_35;
  assign GEN_103 = T_71 ? GEN_38 : T_24_36;
  assign GEN_104 = T_71 ? GEN_39 : T_24_37;
  assign GEN_105 = T_71 ? GEN_40 : T_24_38;
  assign GEN_106 = T_71 ? GEN_41 : T_24_39;
  assign GEN_107 = T_71 ? GEN_42 : T_24_40;
  assign GEN_108 = T_71 ? GEN_43 : T_24_41;
  assign GEN_109 = T_71 ? GEN_44 : T_24_42;
  assign GEN_110 = T_71 ? GEN_45 : T_24_43;
  assign GEN_111 = T_71 ? GEN_46 : T_24_44;
  assign GEN_112 = T_71 ? GEN_47 : T_24_45;
  assign GEN_113 = T_71 ? GEN_48 : T_24_46;
  assign GEN_114 = T_71 ? GEN_49 : T_24_47;
  assign GEN_115 = T_71 ? GEN_50 : T_24_48;
  assign GEN_116 = T_71 ? GEN_51 : T_24_49;
  assign GEN_117 = T_71 ? GEN_52 : T_24_50;
  assign GEN_118 = T_71 ? GEN_53 : T_24_51;
  assign GEN_119 = T_71 ? GEN_54 : T_24_52;
  assign GEN_120 = T_71 ? GEN_55 : T_24_53;
  assign GEN_121 = T_71 ? GEN_56 : T_24_54;
  assign GEN_122 = T_71 ? GEN_57 : T_24_55;
  assign GEN_123 = T_71 ? GEN_58 : T_24_56;
  assign GEN_124 = T_71 ? GEN_59 : T_24_57;
  assign GEN_125 = T_71 ? GEN_60 : T_24_58;
  assign GEN_126 = T_71 ? GEN_61 : T_24_59;
  assign GEN_127 = T_71 ? GEN_62 : T_24_60;
  assign GEN_128 = T_71 ? GEN_63 : T_24_61;
  assign GEN_129 = T_71 ? GEN_64 : T_24_62;
  assign GEN_130 = T_71 ? GEN_65 : T_24_63;
  assign GEN_131 = T_71 ? T_74 : T_66;
  assign T_75 = io_out_ready & io_out_valid;
  assign GEN_197 = {{4'd0}, 1'h1};
  assign T_77 = T_68 + GEN_197;
  assign T_78 = T_77[4:0];
  assign GEN_132 = T_75 ? T_78 : T_68;
  assign T_81 = T_71 & T_75;
  assign GEN_198 = {{6'd0}, 1'h1};
  assign T_83 = T_70 - GEN_198;
  assign T_84 = T_83[6:0];
  assign T_87 = T_70 + GEN_198;
  assign T_88 = T_87[6:0];
  assign GEN_200 = {{5'd0}, 2'h2};
  assign T_91 = T_70 - GEN_200;
  assign T_92 = T_91[6:0];
  assign T_93 = T_75 ? T_92 : T_70;
  assign T_94 = T_71 ? T_88 : T_93;
  assign T_95 = T_81 ? T_84 : T_94;
  assign T_97 = T_70 >> 1'h1;
  assign T_99 = io_count > GEN_164;
  assign GEN_1 = GEN_163;
  assign GEN_133 = GEN_197 == T_68 ? T_63_1 : T_63_0;
  assign GEN_203 = {{3'd0}, 2'h2};
  assign GEN_134 = GEN_203 == T_68 ? T_63_2 : GEN_133;
  assign GEN_204 = {{3'd0}, 2'h3};
  assign GEN_135 = GEN_204 == T_68 ? T_63_3 : GEN_134;
  assign GEN_205 = {{2'd0}, 3'h4};
  assign GEN_136 = GEN_205 == T_68 ? T_63_4 : GEN_135;
  assign GEN_206 = {{2'd0}, 3'h5};
  assign GEN_137 = GEN_206 == T_68 ? T_63_5 : GEN_136;
  assign GEN_207 = {{2'd0}, 3'h6};
  assign GEN_138 = GEN_207 == T_68 ? T_63_6 : GEN_137;
  assign GEN_208 = {{2'd0}, 3'h7};
  assign GEN_139 = GEN_208 == T_68 ? T_63_7 : GEN_138;
  assign GEN_209 = {{1'd0}, 4'h8};
  assign GEN_140 = GEN_209 == T_68 ? T_63_8 : GEN_139;
  assign GEN_210 = {{1'd0}, 4'h9};
  assign GEN_141 = GEN_210 == T_68 ? T_63_9 : GEN_140;
  assign GEN_211 = {{1'd0}, 4'ha};
  assign GEN_142 = GEN_211 == T_68 ? T_63_10 : GEN_141;
  assign GEN_212 = {{1'd0}, 4'hb};
  assign GEN_143 = GEN_212 == T_68 ? T_63_11 : GEN_142;
  assign GEN_213 = {{1'd0}, 4'hc};
  assign GEN_144 = GEN_213 == T_68 ? T_63_12 : GEN_143;
  assign GEN_214 = {{1'd0}, 4'hd};
  assign GEN_145 = GEN_214 == T_68 ? T_63_13 : GEN_144;
  assign GEN_215 = {{1'd0}, 4'he};
  assign GEN_146 = GEN_215 == T_68 ? T_63_14 : GEN_145;
  assign GEN_216 = {{1'd0}, 4'hf};
  assign GEN_147 = GEN_216 == T_68 ? T_63_15 : GEN_146;
  assign GEN_148 = 5'h10 == T_68 ? T_63_16 : GEN_147;
  assign GEN_149 = 5'h11 == T_68 ? T_63_17 : GEN_148;
  assign GEN_150 = 5'h12 == T_68 ? T_63_18 : GEN_149;
  assign GEN_151 = 5'h13 == T_68 ? T_63_19 : GEN_150;
  assign GEN_152 = 5'h14 == T_68 ? T_63_20 : GEN_151;
  assign GEN_153 = 5'h15 == T_68 ? T_63_21 : GEN_152;
  assign GEN_154 = 5'h16 == T_68 ? T_63_22 : GEN_153;
  assign GEN_155 = 5'h17 == T_68 ? T_63_23 : GEN_154;
  assign GEN_156 = 5'h18 == T_68 ? T_63_24 : GEN_155;
  assign GEN_157 = 5'h19 == T_68 ? T_63_25 : GEN_156;
  assign GEN_158 = 5'h1a == T_68 ? T_63_26 : GEN_157;
  assign GEN_159 = 5'h1b == T_68 ? T_63_27 : GEN_158;
  assign GEN_160 = 5'h1c == T_68 ? T_63_28 : GEN_159;
  assign GEN_161 = 5'h1d == T_68 ? T_63_29 : GEN_160;
  assign GEN_162 = 5'h1e == T_68 ? T_63_30 : GEN_161;
  assign GEN_163 = 5'h1f == T_68 ? T_63_31 : GEN_162;
  assign T_101 = T_70 < 7'h40;
`ifndef SYNTHESIS
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002;
    `endif
  GEN_66 = {1{$random}};
  T_24_0 = GEN_66[15:0];
  GEN_196 = {1{$random}};
  T_24_1 = GEN_196[15:0];
  GEN_199 = {1{$random}};
  T_24_2 = GEN_199[15:0];
  GEN_201 = {1{$random}};
  T_24_3 = GEN_201[15:0];
  GEN_202 = {1{$random}};
  T_24_4 = GEN_202[15:0];
  GEN_217 = {1{$random}};
  T_24_5 = GEN_217[15:0];
  GEN_218 = {1{$random}};
  T_24_6 = GEN_218[15:0];
  GEN_219 = {1{$random}};
  T_24_7 = GEN_219[15:0];
  GEN_220 = {1{$random}};
  T_24_8 = GEN_220[15:0];
  GEN_221 = {1{$random}};
  T_24_9 = GEN_221[15:0];
  GEN_222 = {1{$random}};
  T_24_10 = GEN_222[15:0];
  GEN_223 = {1{$random}};
  T_24_11 = GEN_223[15:0];
  GEN_224 = {1{$random}};
  T_24_12 = GEN_224[15:0];
  GEN_225 = {1{$random}};
  T_24_13 = GEN_225[15:0];
  GEN_226 = {1{$random}};
  T_24_14 = GEN_226[15:0];
  GEN_227 = {1{$random}};
  T_24_15 = GEN_227[15:0];
  GEN_228 = {1{$random}};
  T_24_16 = GEN_228[15:0];
  GEN_229 = {1{$random}};
  T_24_17 = GEN_229[15:0];
  GEN_230 = {1{$random}};
  T_24_18 = GEN_230[15:0];
  GEN_231 = {1{$random}};
  T_24_19 = GEN_231[15:0];
  GEN_232 = {1{$random}};
  T_24_20 = GEN_232[15:0];
  GEN_233 = {1{$random}};
  T_24_21 = GEN_233[15:0];
  GEN_234 = {1{$random}};
  T_24_22 = GEN_234[15:0];
  GEN_235 = {1{$random}};
  T_24_23 = GEN_235[15:0];
  GEN_236 = {1{$random}};
  T_24_24 = GEN_236[15:0];
  GEN_237 = {1{$random}};
  T_24_25 = GEN_237[15:0];
  GEN_238 = {1{$random}};
  T_24_26 = GEN_238[15:0];
  GEN_239 = {1{$random}};
  T_24_27 = GEN_239[15:0];
  GEN_240 = {1{$random}};
  T_24_28 = GEN_240[15:0];
  GEN_241 = {1{$random}};
  T_24_29 = GEN_241[15:0];
  GEN_242 = {1{$random}};
  T_24_30 = GEN_242[15:0];
  GEN_243 = {1{$random}};
  T_24_31 = GEN_243[15:0];
  GEN_244 = {1{$random}};
  T_24_32 = GEN_244[15:0];
  GEN_245 = {1{$random}};
  T_24_33 = GEN_245[15:0];
  GEN_246 = {1{$random}};
  T_24_34 = GEN_246[15:0];
  GEN_247 = {1{$random}};
  T_24_35 = GEN_247[15:0];
  GEN_248 = {1{$random}};
  T_24_36 = GEN_248[15:0];
  GEN_249 = {1{$random}};
  T_24_37 = GEN_249[15:0];
  GEN_250 = {1{$random}};
  T_24_38 = GEN_250[15:0];
  GEN_251 = {1{$random}};
  T_24_39 = GEN_251[15:0];
  GEN_252 = {1{$random}};
  T_24_40 = GEN_252[15:0];
  GEN_253 = {1{$random}};
  T_24_41 = GEN_253[15:0];
  GEN_254 = {1{$random}};
  T_24_42 = GEN_254[15:0];
  GEN_255 = {1{$random}};
  T_24_43 = GEN_255[15:0];
  GEN_256 = {1{$random}};
  T_24_44 = GEN_256[15:0];
  GEN_257 = {1{$random}};
  T_24_45 = GEN_257[15:0];
  GEN_258 = {1{$random}};
  T_24_46 = GEN_258[15:0];
  GEN_259 = {1{$random}};
  T_24_47 = GEN_259[15:0];
  GEN_260 = {1{$random}};
  T_24_48 = GEN_260[15:0];
  GEN_261 = {1{$random}};
  T_24_49 = GEN_261[15:0];
  GEN_262 = {1{$random}};
  T_24_50 = GEN_262[15:0];
  GEN_263 = {1{$random}};
  T_24_51 = GEN_263[15:0];
  GEN_264 = {1{$random}};
  T_24_52 = GEN_264[15:0];
  GEN_265 = {1{$random}};
  T_24_53 = GEN_265[15:0];
  GEN_266 = {1{$random}};
  T_24_54 = GEN_266[15:0];
  GEN_267 = {1{$random}};
  T_24_55 = GEN_267[15:0];
  GEN_268 = {1{$random}};
  T_24_56 = GEN_268[15:0];
  GEN_269 = {1{$random}};
  T_24_57 = GEN_269[15:0];
  GEN_270 = {1{$random}};
  T_24_58 = GEN_270[15:0];
  GEN_271 = {1{$random}};
  T_24_59 = GEN_271[15:0];
  GEN_272 = {1{$random}};
  T_24_60 = GEN_272[15:0];
  GEN_273 = {1{$random}};
  T_24_61 = GEN_273[15:0];
  GEN_274 = {1{$random}};
  T_24_62 = GEN_274[15:0];
  GEN_275 = {1{$random}};
  T_24_63 = GEN_275[15:0];
  GEN_276 = {1{$random}};
  T_66 = GEN_276[5:0];
  GEN_277 = {1{$random}};
  T_68 = GEN_277[4:0];
  GEN_278 = {1{$random}};
  T_70 = GEN_278[6:0];
  end
`endif
  always @(posedge clk) begin
    if(1'h0) begin
    end else begin
      T_24_0 <= GEN_67;
    end
    if(1'h0) begin
    end else begin
      T_24_1 <= GEN_68;
    end
    if(1'h0) begin
    end else begin
      T_24_2 <= GEN_69;
    end
    if(1'h0) begin
    end else begin
      T_24_3 <= GEN_70;
    end
    if(1'h0) begin
    end else begin
      T_24_4 <= GEN_71;
    end
    if(1'h0) begin
    end else begin
      T_24_5 <= GEN_72;
    end
    if(1'h0) begin
    end else begin
      T_24_6 <= GEN_73;
    end
    if(1'h0) begin
    end else begin
      T_24_7 <= GEN_74;
    end
    if(1'h0) begin
    end else begin
      T_24_8 <= GEN_75;
    end
    if(1'h0) begin
    end else begin
      T_24_9 <= GEN_76;
    end
    if(1'h0) begin
    end else begin
      T_24_10 <= GEN_77;
    end
    if(1'h0) begin
    end else begin
      T_24_11 <= GEN_78;
    end
    if(1'h0) begin
    end else begin
      T_24_12 <= GEN_79;
    end
    if(1'h0) begin
    end else begin
      T_24_13 <= GEN_80;
    end
    if(1'h0) begin
    end else begin
      T_24_14 <= GEN_81;
    end
    if(1'h0) begin
    end else begin
      T_24_15 <= GEN_82;
    end
    if(1'h0) begin
    end else begin
      T_24_16 <= GEN_83;
    end
    if(1'h0) begin
    end else begin
      T_24_17 <= GEN_84;
    end
    if(1'h0) begin
    end else begin
      T_24_18 <= GEN_85;
    end
    if(1'h0) begin
    end else begin
      T_24_19 <= GEN_86;
    end
    if(1'h0) begin
    end else begin
      T_24_20 <= GEN_87;
    end
    if(1'h0) begin
    end else begin
      T_24_21 <= GEN_88;
    end
    if(1'h0) begin
    end else begin
      T_24_22 <= GEN_89;
    end
    if(1'h0) begin
    end else begin
      T_24_23 <= GEN_90;
    end
    if(1'h0) begin
    end else begin
      T_24_24 <= GEN_91;
    end
    if(1'h0) begin
    end else begin
      T_24_25 <= GEN_92;
    end
    if(1'h0) begin
    end else begin
      T_24_26 <= GEN_93;
    end
    if(1'h0) begin
    end else begin
      T_24_27 <= GEN_94;
    end
    if(1'h0) begin
    end else begin
      T_24_28 <= GEN_95;
    end
    if(1'h0) begin
    end else begin
      T_24_29 <= GEN_96;
    end
    if(1'h0) begin
    end else begin
      T_24_30 <= GEN_97;
    end
    if(1'h0) begin
    end else begin
      T_24_31 <= GEN_98;
    end
    if(1'h0) begin
    end else begin
      T_24_32 <= GEN_99;
    end
    if(1'h0) begin
    end else begin
      T_24_33 <= GEN_100;
    end
    if(1'h0) begin
    end else begin
      T_24_34 <= GEN_101;
    end
    if(1'h0) begin
    end else begin
      T_24_35 <= GEN_102;
    end
    if(1'h0) begin
    end else begin
      T_24_36 <= GEN_103;
    end
    if(1'h0) begin
    end else begin
      T_24_37 <= GEN_104;
    end
    if(1'h0) begin
    end else begin
      T_24_38 <= GEN_105;
    end
    if(1'h0) begin
    end else begin
      T_24_39 <= GEN_106;
    end
    if(1'h0) begin
    end else begin
      T_24_40 <= GEN_107;
    end
    if(1'h0) begin
    end else begin
      T_24_41 <= GEN_108;
    end
    if(1'h0) begin
    end else begin
      T_24_42 <= GEN_109;
    end
    if(1'h0) begin
    end else begin
      T_24_43 <= GEN_110;
    end
    if(1'h0) begin
    end else begin
      T_24_44 <= GEN_111;
    end
    if(1'h0) begin
    end else begin
      T_24_45 <= GEN_112;
    end
    if(1'h0) begin
    end else begin
      T_24_46 <= GEN_113;
    end
    if(1'h0) begin
    end else begin
      T_24_47 <= GEN_114;
    end
    if(1'h0) begin
    end else begin
      T_24_48 <= GEN_115;
    end
    if(1'h0) begin
    end else begin
      T_24_49 <= GEN_116;
    end
    if(1'h0) begin
    end else begin
      T_24_50 <= GEN_117;
    end
    if(1'h0) begin
    end else begin
      T_24_51 <= GEN_118;
    end
    if(1'h0) begin
    end else begin
      T_24_52 <= GEN_119;
    end
    if(1'h0) begin
    end else begin
      T_24_53 <= GEN_120;
    end
    if(1'h0) begin
    end else begin
      T_24_54 <= GEN_121;
    end
    if(1'h0) begin
    end else begin
      T_24_55 <= GEN_122;
    end
    if(1'h0) begin
    end else begin
      T_24_56 <= GEN_123;
    end
    if(1'h0) begin
    end else begin
      T_24_57 <= GEN_124;
    end
    if(1'h0) begin
    end else begin
      T_24_58 <= GEN_125;
    end
    if(1'h0) begin
    end else begin
      T_24_59 <= GEN_126;
    end
    if(1'h0) begin
    end else begin
      T_24_60 <= GEN_127;
    end
    if(1'h0) begin
    end else begin
      T_24_61 <= GEN_128;
    end
    if(1'h0) begin
    end else begin
      T_24_62 <= GEN_129;
    end
    if(1'h0) begin
    end else begin
      T_24_63 <= GEN_130;
    end
    if(reset) begin
      T_66 <= 6'h0;
    end else begin
      T_66 <= GEN_131;
    end
    if(reset) begin
      T_68 <= 5'h0;
    end else begin
      T_68 <= GEN_132;
    end
    if(reset) begin
      T_70 <= 7'h0;
    end else begin
      T_70 <= T_95;
    end
  end
endmodule
module MultiWidthFifo_1(
  input   clk,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input  [31:0] io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output [15:0] io_out_bits,
  output [5:0] io_count
);
  reg [31:0] T_24_0;
  reg [31:0] GEN_18;
  reg [31:0] T_24_1;
  reg [31:0] GEN_76;
  reg [31:0] T_24_2;
  reg [31:0] GEN_80;
  reg [31:0] T_24_3;
  reg [31:0] GEN_82;
  reg [31:0] T_24_4;
  reg [31:0] GEN_97;
  reg [31:0] T_24_5;
  reg [31:0] GEN_98;
  reg [31:0] T_24_6;
  reg [31:0] GEN_99;
  reg [31:0] T_24_7;
  reg [31:0] GEN_100;
  reg [31:0] T_24_8;
  reg [31:0] GEN_101;
  reg [31:0] T_24_9;
  reg [31:0] GEN_102;
  reg [31:0] T_24_10;
  reg [31:0] GEN_103;
  reg [31:0] T_24_11;
  reg [31:0] GEN_104;
  reg [31:0] T_24_12;
  reg [31:0] GEN_105;
  reg [31:0] T_24_13;
  reg [31:0] GEN_106;
  reg [31:0] T_24_14;
  reg [31:0] GEN_107;
  reg [31:0] T_24_15;
  reg [31:0] GEN_108;
  wire [15:0] T_26;
  wire [15:0] T_27;
  wire [15:0] T_28;
  wire [15:0] T_29;
  wire [15:0] T_30;
  wire [15:0] T_31;
  wire [15:0] T_32;
  wire [15:0] T_33;
  wire [15:0] T_34;
  wire [15:0] T_35;
  wire [15:0] T_36;
  wire [15:0] T_37;
  wire [15:0] T_38;
  wire [15:0] T_39;
  wire [15:0] T_40;
  wire [15:0] T_41;
  wire [15:0] T_42;
  wire [15:0] T_43;
  wire [15:0] T_44;
  wire [15:0] T_45;
  wire [15:0] T_46;
  wire [15:0] T_47;
  wire [15:0] T_48;
  wire [15:0] T_49;
  wire [15:0] T_50;
  wire [15:0] T_51;
  wire [15:0] T_52;
  wire [15:0] T_53;
  wire [15:0] T_54;
  wire [15:0] T_55;
  wire [15:0] T_56;
  wire [15:0] T_57;
  wire [15:0] T_63_0;
  wire [15:0] T_63_1;
  wire [15:0] T_63_2;
  wire [15:0] T_63_3;
  wire [15:0] T_63_4;
  wire [15:0] T_63_5;
  wire [15:0] T_63_6;
  wire [15:0] T_63_7;
  wire [15:0] T_63_8;
  wire [15:0] T_63_9;
  wire [15:0] T_63_10;
  wire [15:0] T_63_11;
  wire [15:0] T_63_12;
  wire [15:0] T_63_13;
  wire [15:0] T_63_14;
  wire [15:0] T_63_15;
  wire [15:0] T_63_16;
  wire [15:0] T_63_17;
  wire [15:0] T_63_18;
  wire [15:0] T_63_19;
  wire [15:0] T_63_20;
  wire [15:0] T_63_21;
  wire [15:0] T_63_22;
  wire [15:0] T_63_23;
  wire [15:0] T_63_24;
  wire [15:0] T_63_25;
  wire [15:0] T_63_26;
  wire [15:0] T_63_27;
  wire [15:0] T_63_28;
  wire [15:0] T_63_29;
  wire [15:0] T_63_30;
  wire [15:0] T_63_31;
  reg [3:0] T_66;
  reg [31:0] GEN_109;
  reg [4:0] T_68;
  reg [31:0] GEN_110;
  reg [5:0] T_70;
  reg [31:0] GEN_111;
  wire  T_71;
  wire [31:0] GEN_0;
  wire [3:0] GEN_68;
  wire [31:0] GEN_2;
  wire [3:0] GEN_69;
  wire [31:0] GEN_3;
  wire [3:0] GEN_70;
  wire [31:0] GEN_4;
  wire [3:0] GEN_71;
  wire [31:0] GEN_5;
  wire [3:0] GEN_72;
  wire [31:0] GEN_6;
  wire [3:0] GEN_73;
  wire [31:0] GEN_7;
  wire [3:0] GEN_74;
  wire [31:0] GEN_8;
  wire [3:0] GEN_75;
  wire [31:0] GEN_9;
  wire [31:0] GEN_10;
  wire [31:0] GEN_11;
  wire [31:0] GEN_12;
  wire [31:0] GEN_13;
  wire [31:0] GEN_14;
  wire [31:0] GEN_15;
  wire [31:0] GEN_16;
  wire [31:0] GEN_17;
  wire [4:0] T_73;
  wire [3:0] T_74;
  wire [31:0] GEN_19;
  wire [31:0] GEN_20;
  wire [31:0] GEN_21;
  wire [31:0] GEN_22;
  wire [31:0] GEN_23;
  wire [31:0] GEN_24;
  wire [31:0] GEN_25;
  wire [31:0] GEN_26;
  wire [31:0] GEN_27;
  wire [31:0] GEN_28;
  wire [31:0] GEN_29;
  wire [31:0] GEN_30;
  wire [31:0] GEN_31;
  wire [31:0] GEN_32;
  wire [31:0] GEN_33;
  wire [31:0] GEN_34;
  wire [3:0] GEN_35;
  wire  T_75;
  wire [4:0] GEN_77;
  wire [5:0] T_77;
  wire [4:0] T_78;
  wire [4:0] GEN_36;
  wire  T_81;
  wire [5:0] GEN_78;
  wire [6:0] T_83;
  wire [5:0] T_84;
  wire [5:0] GEN_79;
  wire [6:0] T_87;
  wire [5:0] T_88;
  wire [6:0] T_91;
  wire [5:0] T_92;
  wire [5:0] T_93;
  wire [5:0] T_94;
  wire [5:0] T_95;
  wire [5:0] GEN_81;
  wire  T_97;
  wire [15:0] GEN_1;
  wire [15:0] GEN_37;
  wire [4:0] GEN_83;
  wire [15:0] GEN_38;
  wire [4:0] GEN_84;
  wire [15:0] GEN_39;
  wire [4:0] GEN_85;
  wire [15:0] GEN_40;
  wire [4:0] GEN_86;
  wire [15:0] GEN_41;
  wire [4:0] GEN_87;
  wire [15:0] GEN_42;
  wire [4:0] GEN_88;
  wire [15:0] GEN_43;
  wire [4:0] GEN_89;
  wire [15:0] GEN_44;
  wire [4:0] GEN_90;
  wire [15:0] GEN_45;
  wire [4:0] GEN_91;
  wire [15:0] GEN_46;
  wire [4:0] GEN_92;
  wire [15:0] GEN_47;
  wire [4:0] GEN_93;
  wire [15:0] GEN_48;
  wire [4:0] GEN_94;
  wire [15:0] GEN_49;
  wire [4:0] GEN_95;
  wire [15:0] GEN_50;
  wire [4:0] GEN_96;
  wire [15:0] GEN_51;
  wire [15:0] GEN_52;
  wire [15:0] GEN_53;
  wire [15:0] GEN_54;
  wire [15:0] GEN_55;
  wire [15:0] GEN_56;
  wire [15:0] GEN_57;
  wire [15:0] GEN_58;
  wire [15:0] GEN_59;
  wire [15:0] GEN_60;
  wire [15:0] GEN_61;
  wire [15:0] GEN_62;
  wire [15:0] GEN_63;
  wire [15:0] GEN_64;
  wire [15:0] GEN_65;
  wire [15:0] GEN_66;
  wire [15:0] GEN_67;
  wire  T_99;
  assign io_in_ready = T_99;
  assign io_out_valid = T_97;
  assign io_out_bits = GEN_1;
  assign io_count = T_70;
  assign T_26 = T_24_0[15:0];
  assign T_27 = T_24_0[31:16];
  assign T_28 = T_24_1[15:0];
  assign T_29 = T_24_1[31:16];
  assign T_30 = T_24_2[15:0];
  assign T_31 = T_24_2[31:16];
  assign T_32 = T_24_3[15:0];
  assign T_33 = T_24_3[31:16];
  assign T_34 = T_24_4[15:0];
  assign T_35 = T_24_4[31:16];
  assign T_36 = T_24_5[15:0];
  assign T_37 = T_24_5[31:16];
  assign T_38 = T_24_6[15:0];
  assign T_39 = T_24_6[31:16];
  assign T_40 = T_24_7[15:0];
  assign T_41 = T_24_7[31:16];
  assign T_42 = T_24_8[15:0];
  assign T_43 = T_24_8[31:16];
  assign T_44 = T_24_9[15:0];
  assign T_45 = T_24_9[31:16];
  assign T_46 = T_24_10[15:0];
  assign T_47 = T_24_10[31:16];
  assign T_48 = T_24_11[15:0];
  assign T_49 = T_24_11[31:16];
  assign T_50 = T_24_12[15:0];
  assign T_51 = T_24_12[31:16];
  assign T_52 = T_24_13[15:0];
  assign T_53 = T_24_13[31:16];
  assign T_54 = T_24_14[15:0];
  assign T_55 = T_24_14[31:16];
  assign T_56 = T_24_15[15:0];
  assign T_57 = T_24_15[31:16];
  assign T_63_0 = T_26;
  assign T_63_1 = T_27;
  assign T_63_2 = T_28;
  assign T_63_3 = T_29;
  assign T_63_4 = T_30;
  assign T_63_5 = T_31;
  assign T_63_6 = T_32;
  assign T_63_7 = T_33;
  assign T_63_8 = T_34;
  assign T_63_9 = T_35;
  assign T_63_10 = T_36;
  assign T_63_11 = T_37;
  assign T_63_12 = T_38;
  assign T_63_13 = T_39;
  assign T_63_14 = T_40;
  assign T_63_15 = T_41;
  assign T_63_16 = T_42;
  assign T_63_17 = T_43;
  assign T_63_18 = T_44;
  assign T_63_19 = T_45;
  assign T_63_20 = T_46;
  assign T_63_21 = T_47;
  assign T_63_22 = T_48;
  assign T_63_23 = T_49;
  assign T_63_24 = T_50;
  assign T_63_25 = T_51;
  assign T_63_26 = T_52;
  assign T_63_27 = T_53;
  assign T_63_28 = T_54;
  assign T_63_29 = T_55;
  assign T_63_30 = T_56;
  assign T_63_31 = T_57;
  assign T_71 = io_in_ready & io_in_valid;
  assign GEN_0 = io_in_bits;
  assign GEN_68 = {{3'd0}, 1'h0};
  assign GEN_2 = GEN_68 == T_66 ? GEN_0 : T_24_0;
  assign GEN_69 = {{3'd0}, 1'h1};
  assign GEN_3 = GEN_69 == T_66 ? GEN_0 : T_24_1;
  assign GEN_70 = {{2'd0}, 2'h2};
  assign GEN_4 = GEN_70 == T_66 ? GEN_0 : T_24_2;
  assign GEN_71 = {{2'd0}, 2'h3};
  assign GEN_5 = GEN_71 == T_66 ? GEN_0 : T_24_3;
  assign GEN_72 = {{1'd0}, 3'h4};
  assign GEN_6 = GEN_72 == T_66 ? GEN_0 : T_24_4;
  assign GEN_73 = {{1'd0}, 3'h5};
  assign GEN_7 = GEN_73 == T_66 ? GEN_0 : T_24_5;
  assign GEN_74 = {{1'd0}, 3'h6};
  assign GEN_8 = GEN_74 == T_66 ? GEN_0 : T_24_6;
  assign GEN_75 = {{1'd0}, 3'h7};
  assign GEN_9 = GEN_75 == T_66 ? GEN_0 : T_24_7;
  assign GEN_10 = 4'h8 == T_66 ? GEN_0 : T_24_8;
  assign GEN_11 = 4'h9 == T_66 ? GEN_0 : T_24_9;
  assign GEN_12 = 4'ha == T_66 ? GEN_0 : T_24_10;
  assign GEN_13 = 4'hb == T_66 ? GEN_0 : T_24_11;
  assign GEN_14 = 4'hc == T_66 ? GEN_0 : T_24_12;
  assign GEN_15 = 4'hd == T_66 ? GEN_0 : T_24_13;
  assign GEN_16 = 4'he == T_66 ? GEN_0 : T_24_14;
  assign GEN_17 = 4'hf == T_66 ? GEN_0 : T_24_15;
  assign T_73 = T_66 + GEN_69;
  assign T_74 = T_73[3:0];
  assign GEN_19 = T_71 ? GEN_2 : T_24_0;
  assign GEN_20 = T_71 ? GEN_3 : T_24_1;
  assign GEN_21 = T_71 ? GEN_4 : T_24_2;
  assign GEN_22 = T_71 ? GEN_5 : T_24_3;
  assign GEN_23 = T_71 ? GEN_6 : T_24_4;
  assign GEN_24 = T_71 ? GEN_7 : T_24_5;
  assign GEN_25 = T_71 ? GEN_8 : T_24_6;
  assign GEN_26 = T_71 ? GEN_9 : T_24_7;
  assign GEN_27 = T_71 ? GEN_10 : T_24_8;
  assign GEN_28 = T_71 ? GEN_11 : T_24_9;
  assign GEN_29 = T_71 ? GEN_12 : T_24_10;
  assign GEN_30 = T_71 ? GEN_13 : T_24_11;
  assign GEN_31 = T_71 ? GEN_14 : T_24_12;
  assign GEN_32 = T_71 ? GEN_15 : T_24_13;
  assign GEN_33 = T_71 ? GEN_16 : T_24_14;
  assign GEN_34 = T_71 ? GEN_17 : T_24_15;
  assign GEN_35 = T_71 ? T_74 : T_66;
  assign T_75 = io_out_ready & io_out_valid;
  assign GEN_77 = {{4'd0}, 1'h1};
  assign T_77 = T_68 + GEN_77;
  assign T_78 = T_77[4:0];
  assign GEN_36 = T_75 ? T_78 : T_68;
  assign T_81 = T_71 & T_75;
  assign GEN_78 = {{5'd0}, 1'h1};
  assign T_83 = T_70 + GEN_78;
  assign T_84 = T_83[5:0];
  assign GEN_79 = {{4'd0}, 2'h2};
  assign T_87 = T_70 + GEN_79;
  assign T_88 = T_87[5:0];
  assign T_91 = T_70 - GEN_78;
  assign T_92 = T_91[5:0];
  assign T_93 = T_75 ? T_92 : T_70;
  assign T_94 = T_71 ? T_88 : T_93;
  assign T_95 = T_81 ? T_84 : T_94;
  assign GEN_81 = {{5'd0}, 1'h0};
  assign T_97 = T_70 > GEN_81;
  assign GEN_1 = GEN_67;
  assign GEN_37 = GEN_77 == T_68 ? T_63_1 : T_63_0;
  assign GEN_83 = {{3'd0}, 2'h2};
  assign GEN_38 = GEN_83 == T_68 ? T_63_2 : GEN_37;
  assign GEN_84 = {{3'd0}, 2'h3};
  assign GEN_39 = GEN_84 == T_68 ? T_63_3 : GEN_38;
  assign GEN_85 = {{2'd0}, 3'h4};
  assign GEN_40 = GEN_85 == T_68 ? T_63_4 : GEN_39;
  assign GEN_86 = {{2'd0}, 3'h5};
  assign GEN_41 = GEN_86 == T_68 ? T_63_5 : GEN_40;
  assign GEN_87 = {{2'd0}, 3'h6};
  assign GEN_42 = GEN_87 == T_68 ? T_63_6 : GEN_41;
  assign GEN_88 = {{2'd0}, 3'h7};
  assign GEN_43 = GEN_88 == T_68 ? T_63_7 : GEN_42;
  assign GEN_89 = {{1'd0}, 4'h8};
  assign GEN_44 = GEN_89 == T_68 ? T_63_8 : GEN_43;
  assign GEN_90 = {{1'd0}, 4'h9};
  assign GEN_45 = GEN_90 == T_68 ? T_63_9 : GEN_44;
  assign GEN_91 = {{1'd0}, 4'ha};
  assign GEN_46 = GEN_91 == T_68 ? T_63_10 : GEN_45;
  assign GEN_92 = {{1'd0}, 4'hb};
  assign GEN_47 = GEN_92 == T_68 ? T_63_11 : GEN_46;
  assign GEN_93 = {{1'd0}, 4'hc};
  assign GEN_48 = GEN_93 == T_68 ? T_63_12 : GEN_47;
  assign GEN_94 = {{1'd0}, 4'hd};
  assign GEN_49 = GEN_94 == T_68 ? T_63_13 : GEN_48;
  assign GEN_95 = {{1'd0}, 4'he};
  assign GEN_50 = GEN_95 == T_68 ? T_63_14 : GEN_49;
  assign GEN_96 = {{1'd0}, 4'hf};
  assign GEN_51 = GEN_96 == T_68 ? T_63_15 : GEN_50;
  assign GEN_52 = 5'h10 == T_68 ? T_63_16 : GEN_51;
  assign GEN_53 = 5'h11 == T_68 ? T_63_17 : GEN_52;
  assign GEN_54 = 5'h12 == T_68 ? T_63_18 : GEN_53;
  assign GEN_55 = 5'h13 == T_68 ? T_63_19 : GEN_54;
  assign GEN_56 = 5'h14 == T_68 ? T_63_20 : GEN_55;
  assign GEN_57 = 5'h15 == T_68 ? T_63_21 : GEN_56;
  assign GEN_58 = 5'h16 == T_68 ? T_63_22 : GEN_57;
  assign GEN_59 = 5'h17 == T_68 ? T_63_23 : GEN_58;
  assign GEN_60 = 5'h18 == T_68 ? T_63_24 : GEN_59;
  assign GEN_61 = 5'h19 == T_68 ? T_63_25 : GEN_60;
  assign GEN_62 = 5'h1a == T_68 ? T_63_26 : GEN_61;
  assign GEN_63 = 5'h1b == T_68 ? T_63_27 : GEN_62;
  assign GEN_64 = 5'h1c == T_68 ? T_63_28 : GEN_63;
  assign GEN_65 = 5'h1d == T_68 ? T_63_29 : GEN_64;
  assign GEN_66 = 5'h1e == T_68 ? T_63_30 : GEN_65;
  assign GEN_67 = 5'h1f == T_68 ? T_63_31 : GEN_66;
  assign T_99 = T_70 < 6'h20;
`ifndef SYNTHESIS
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002;
    `endif
  GEN_18 = {1{$random}};
  T_24_0 = GEN_18[31:0];
  GEN_76 = {1{$random}};
  T_24_1 = GEN_76[31:0];
  GEN_80 = {1{$random}};
  T_24_2 = GEN_80[31:0];
  GEN_82 = {1{$random}};
  T_24_3 = GEN_82[31:0];
  GEN_97 = {1{$random}};
  T_24_4 = GEN_97[31:0];
  GEN_98 = {1{$random}};
  T_24_5 = GEN_98[31:0];
  GEN_99 = {1{$random}};
  T_24_6 = GEN_99[31:0];
  GEN_100 = {1{$random}};
  T_24_7 = GEN_100[31:0];
  GEN_101 = {1{$random}};
  T_24_8 = GEN_101[31:0];
  GEN_102 = {1{$random}};
  T_24_9 = GEN_102[31:0];
  GEN_103 = {1{$random}};
  T_24_10 = GEN_103[31:0];
  GEN_104 = {1{$random}};
  T_24_11 = GEN_104[31:0];
  GEN_105 = {1{$random}};
  T_24_12 = GEN_105[31:0];
  GEN_106 = {1{$random}};
  T_24_13 = GEN_106[31:0];
  GEN_107 = {1{$random}};
  T_24_14 = GEN_107[31:0];
  GEN_108 = {1{$random}};
  T_24_15 = GEN_108[31:0];
  GEN_109 = {1{$random}};
  T_66 = GEN_109[3:0];
  GEN_110 = {1{$random}};
  T_68 = GEN_110[4:0];
  GEN_111 = {1{$random}};
  T_70 = GEN_111[5:0];
  end
`endif
  always @(posedge clk) begin
    if(1'h0) begin
    end else begin
      T_24_0 <= GEN_19;
    end
    if(1'h0) begin
    end else begin
      T_24_1 <= GEN_20;
    end
    if(1'h0) begin
    end else begin
      T_24_2 <= GEN_21;
    end
    if(1'h0) begin
    end else begin
      T_24_3 <= GEN_22;
    end
    if(1'h0) begin
    end else begin
      T_24_4 <= GEN_23;
    end
    if(1'h0) begin
    end else begin
      T_24_5 <= GEN_24;
    end
    if(1'h0) begin
    end else begin
      T_24_6 <= GEN_25;
    end
    if(1'h0) begin
    end else begin
      T_24_7 <= GEN_26;
    end
    if(1'h0) begin
    end else begin
      T_24_8 <= GEN_27;
    end
    if(1'h0) begin
    end else begin
      T_24_9 <= GEN_28;
    end
    if(1'h0) begin
    end else begin
      T_24_10 <= GEN_29;
    end
    if(1'h0) begin
    end else begin
      T_24_11 <= GEN_30;
    end
    if(1'h0) begin
    end else begin
      T_24_12 <= GEN_31;
    end
    if(1'h0) begin
    end else begin
      T_24_13 <= GEN_32;
    end
    if(1'h0) begin
    end else begin
      T_24_14 <= GEN_33;
    end
    if(1'h0) begin
    end else begin
      T_24_15 <= GEN_34;
    end
    if(reset) begin
      T_66 <= 4'h0;
    end else begin
      T_66 <= GEN_35;
    end
    if(reset) begin
      T_68 <= 5'h0;
    end else begin
      T_68 <= GEN_36;
    end
    if(reset) begin
      T_70 <= 6'h0;
    end else begin
      T_70 <= T_95;
    end
  end
endmodule
module NastiIOHostIOConverter(
  input   clk,
  input   reset,
  output  io_nasti_aw_ready,
  input   io_nasti_aw_valid,
  input  [31:0] io_nasti_aw_bits_addr,
  input  [7:0] io_nasti_aw_bits_len,
  input  [2:0] io_nasti_aw_bits_size,
  input  [1:0] io_nasti_aw_bits_burst,
  input   io_nasti_aw_bits_lock,
  input  [3:0] io_nasti_aw_bits_cache,
  input  [2:0] io_nasti_aw_bits_prot,
  input  [3:0] io_nasti_aw_bits_qos,
  input  [3:0] io_nasti_aw_bits_region,
  input  [11:0] io_nasti_aw_bits_id,
  input   io_nasti_aw_bits_user,
  output  io_nasti_w_ready,
  input   io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input   io_nasti_w_bits_last,
  input  [11:0] io_nasti_w_bits_id,
  input  [3:0] io_nasti_w_bits_strb,
  input   io_nasti_w_bits_user,
  input   io_nasti_b_ready,
  output  io_nasti_b_valid,
  output [1:0] io_nasti_b_bits_resp,
  output [11:0] io_nasti_b_bits_id,
  output  io_nasti_b_bits_user,
  output  io_nasti_ar_ready,
  input   io_nasti_ar_valid,
  input  [31:0] io_nasti_ar_bits_addr,
  input  [7:0] io_nasti_ar_bits_len,
  input  [2:0] io_nasti_ar_bits_size,
  input  [1:0] io_nasti_ar_bits_burst,
  input   io_nasti_ar_bits_lock,
  input  [3:0] io_nasti_ar_bits_cache,
  input  [2:0] io_nasti_ar_bits_prot,
  input  [3:0] io_nasti_ar_bits_qos,
  input  [3:0] io_nasti_ar_bits_region,
  input  [11:0] io_nasti_ar_bits_id,
  input   io_nasti_ar_bits_user,
  input   io_nasti_r_ready,
  output  io_nasti_r_valid,
  output [1:0] io_nasti_r_bits_resp,
  output [31:0] io_nasti_r_bits_data,
  output  io_nasti_r_bits_last,
  output [11:0] io_nasti_r_bits_id,
  output  io_nasti_r_bits_user,
  input   io_host_clk,
  input   io_host_clk_edge,
  input   io_host_in_ready,
  output  io_host_in_valid,
  output [15:0] io_host_in_bits,
  output  io_host_out_ready,
  input   io_host_out_valid,
  input  [15:0] io_host_out_bits,
  output  io_reset
);
  wire [4:0] raddr;
  wire [4:0] waddr;
  reg  fifo_ren;
  reg [31:0] GEN_24;
  reg  fifo_wen;
  reg [31:0] GEN_27;
  reg [7:0] fifo_rd_len;
  reg [31:0] GEN_28;
  reg [11:0] fifo_rd_id;
  reg [31:0] GEN_29;
  reg [11:0] fifo_wr_id;
  reg [31:0] GEN_30;
  reg  fifo_wr_ack;
  reg [31:0] GEN_31;
  reg  rd_count;
  reg [31:0] GEN_32;
  reg  wr_reset;
  reg [31:0] GEN_33;
  wire  T_373;
  wire [4:0] GEN_21;
  wire  T_375;
  wire  GEN_0;
  wire [4:0] GEN_22;
  wire  T_378;
  wire  T_380;
  wire  T_381;
  wire  GEN_1;
  wire [7:0] GEN_2;
  wire [11:0] GEN_3;
  wire  GEN_4;
  wire  GEN_5;
  wire  T_383;
  wire  GEN_6;
  wire  GEN_7;
  wire  T_387;
  wire [7:0] GEN_23;
  wire [8:0] T_389;
  wire [7:0] T_390;
  wire [7:0] GEN_8;
  wire  GEN_9;
  wire  GEN_10;
  wire [7:0] GEN_11;
  wire  T_391;
  wire  T_393;
  wire  GEN_12;
  wire  T_396;
  wire  T_398;
  wire  T_399;
  wire  GEN_13;
  wire [11:0] GEN_14;
  wire  GEN_15;
  wire  GEN_16;
  wire  T_401;
  wire  T_402;
  wire  GEN_17;
  wire  GEN_18;
  wire  GEN_19;
  wire  T_406;
  wire  GEN_20;
  wire  T_409;
  wire  T_411;
  wire  T_413;
  wire  T_414;
  wire [1:0] T_420_resp;
  wire [11:0] T_420_id;
  wire  T_420_user;
  wire  T_425;
  wire  hn_fifo_clk;
  wire  hn_fifo_reset;
  wire  hn_fifo_io_in_ready;
  wire  hn_fifo_io_in_valid;
  wire [15:0] hn_fifo_io_in_bits;
  wire  hn_fifo_io_out_ready;
  wire  hn_fifo_io_out_valid;
  wire [31:0] hn_fifo_io_out_bits;
  wire [5:0] hn_fifo_io_count;
  wire  T_426;
  wire  T_427;
  wire  T_428;
  wire [31:0] T_429;
  wire [7:0] GEN_25;
  wire  T_431;
  wire [1:0] T_439_resp;
  wire [31:0] T_439_data;
  wire  T_439_last;
  wire [11:0] T_439_id;
  wire  T_439_user;
  wire  nh_fifo_clk;
  wire  nh_fifo_reset;
  wire  nh_fifo_io_in_ready;
  wire  nh_fifo_io_in_valid;
  wire [31:0] nh_fifo_io_in_bits;
  wire  nh_fifo_io_out_ready;
  wire  nh_fifo_io_out_valid;
  wire [15:0] nh_fifo_io_out_bits;
  wire [5:0] nh_fifo_io_count;
  wire  T_446;
  wire  T_447;
  wire  T_448;
  wire  T_450;
  wire [3:0] T_451;
  wire [3:0] GEN_26;
  wire  T_453;
  wire  T_454;
  wire  T_455;
  wire  T_457;
  wire  T_459;
  wire  T_461;
  wire  T_462;
  wire  T_470;
  wire  T_471;
  wire  T_472;
  wire  T_474;
  wire  T_476;
  wire  T_478;
  wire  T_479;
  wire  T_480;
  wire  T_481;
  wire  T_482;
  wire  T_484;
  MultiWidthFifo hn_fifo (
    .clk(hn_fifo_clk),
    .reset(hn_fifo_reset),
    .io_in_ready(hn_fifo_io_in_ready),
    .io_in_valid(hn_fifo_io_in_valid),
    .io_in_bits(hn_fifo_io_in_bits),
    .io_out_ready(hn_fifo_io_out_ready),
    .io_out_valid(hn_fifo_io_out_valid),
    .io_out_bits(hn_fifo_io_out_bits),
    .io_count(hn_fifo_io_count)
  );
  MultiWidthFifo_1 nh_fifo (
    .clk(nh_fifo_clk),
    .reset(nh_fifo_reset),
    .io_in_ready(nh_fifo_io_in_ready),
    .io_in_valid(nh_fifo_io_in_valid),
    .io_in_bits(nh_fifo_io_in_bits),
    .io_out_ready(nh_fifo_io_out_ready),
    .io_out_valid(nh_fifo_io_out_valid),
    .io_out_bits(nh_fifo_io_out_bits),
    .io_count(nh_fifo_io_count)
  );
  assign io_nasti_aw_ready = T_414;
  assign io_nasti_w_ready = T_448;
  assign io_nasti_b_valid = fifo_wr_ack;
  assign io_nasti_b_bits_resp = T_420_resp;
  assign io_nasti_b_bits_id = T_420_id;
  assign io_nasti_b_bits_user = T_420_user;
  assign io_nasti_ar_ready = T_409;
  assign io_nasti_r_valid = T_428;
  assign io_nasti_r_bits_resp = T_439_resp;
  assign io_nasti_r_bits_data = T_439_data;
  assign io_nasti_r_bits_last = T_439_last;
  assign io_nasti_r_bits_id = T_439_id;
  assign io_nasti_r_bits_user = T_439_user;
  assign io_host_in_valid = nh_fifo_io_out_valid;
  assign io_host_in_bits = nh_fifo_io_out_bits;
  assign io_host_out_ready = hn_fifo_io_in_ready;
  assign io_reset = T_425;
  assign raddr = io_nasti_ar_bits_addr[6:2];
  assign waddr = io_nasti_aw_bits_addr[6:2];
  assign T_373 = io_nasti_ar_ready & io_nasti_ar_valid;
  assign GEN_21 = {{4'd0}, 1'h1};
  assign T_375 = raddr == GEN_21;
  assign GEN_0 = T_375 ? 1'h1 : fifo_ren;
  assign GEN_22 = {{4'd0}, 1'h0};
  assign T_378 = raddr == GEN_22;
  assign T_380 = T_375 == 1'h0;
  assign T_381 = T_380 & T_378;
  assign GEN_1 = T_381 ? 1'h1 : rd_count;
  assign GEN_2 = T_373 ? io_nasti_ar_bits_len : fifo_rd_len;
  assign GEN_3 = T_373 ? io_nasti_ar_bits_id : fifo_rd_id;
  assign GEN_4 = T_373 ? GEN_0 : fifo_ren;
  assign GEN_5 = T_373 ? GEN_1 : rd_count;
  assign T_383 = io_nasti_r_ready & io_nasti_r_valid;
  assign GEN_6 = io_nasti_r_bits_last ? 1'h0 : GEN_4;
  assign GEN_7 = io_nasti_r_bits_last ? 1'h0 : GEN_5;
  assign T_387 = io_nasti_r_bits_last == 1'h0;
  assign GEN_23 = {{7'd0}, 1'h1};
  assign T_389 = fifo_rd_len - GEN_23;
  assign T_390 = T_389[7:0];
  assign GEN_8 = T_387 ? T_390 : GEN_2;
  assign GEN_9 = T_383 ? GEN_6 : GEN_4;
  assign GEN_10 = T_383 ? GEN_7 : GEN_5;
  assign GEN_11 = T_383 ? GEN_8 : GEN_2;
  assign T_391 = io_nasti_aw_ready & io_nasti_aw_valid;
  assign T_393 = waddr == GEN_22;
  assign GEN_12 = T_393 ? 1'h1 : fifo_wen;
  assign T_396 = waddr == 5'h1f;
  assign T_398 = T_393 == 1'h0;
  assign T_399 = T_398 & T_396;
  assign GEN_13 = T_399 ? 1'h1 : wr_reset;
  assign GEN_14 = T_391 ? io_nasti_aw_bits_id : fifo_wr_id;
  assign GEN_15 = T_391 ? GEN_12 : fifo_wen;
  assign GEN_16 = T_391 ? GEN_13 : wr_reset;
  assign T_401 = io_nasti_w_ready & io_nasti_w_valid;
  assign T_402 = T_401 & io_nasti_w_bits_last;
  assign GEN_17 = T_402 ? 1'h0 : GEN_15;
  assign GEN_18 = T_402 ? 1'h0 : GEN_16;
  assign GEN_19 = T_402 ? 1'h1 : fifo_wr_ack;
  assign T_406 = io_nasti_b_ready & io_nasti_b_valid;
  assign GEN_20 = T_406 ? 1'h0 : GEN_19;
  assign T_409 = fifo_ren == 1'h0;
  assign T_411 = fifo_wen == 1'h0;
  assign T_413 = fifo_wr_ack == 1'h0;
  assign T_414 = T_411 & T_413;
  assign T_420_resp = {{1'd0}, 1'h0};
  assign T_420_id = fifo_wr_id;
  assign T_420_user = 1'h0;
  assign T_425 = io_nasti_w_valid & wr_reset;
  assign hn_fifo_clk = clk;
  assign hn_fifo_reset = reset;
  assign hn_fifo_io_in_valid = io_host_out_valid;
  assign hn_fifo_io_in_bits = io_host_out_bits;
  assign hn_fifo_io_out_ready = T_426;
  assign T_426 = fifo_ren & io_nasti_r_ready;
  assign T_427 = fifo_ren & hn_fifo_io_out_valid;
  assign T_428 = T_427 | rd_count;
  assign T_429 = fifo_ren ? hn_fifo_io_out_bits : {{26'd0}, hn_fifo_io_count};
  assign GEN_25 = {{7'd0}, 1'h0};
  assign T_431 = fifo_rd_len == GEN_25;
  assign T_439_resp = {{1'd0}, 1'h0};
  assign T_439_data = T_429;
  assign T_439_last = T_431;
  assign T_439_id = fifo_rd_id;
  assign T_439_user = 1'h0;
  assign nh_fifo_clk = clk;
  assign nh_fifo_reset = reset;
  assign nh_fifo_io_in_valid = T_446;
  assign nh_fifo_io_in_bits = io_nasti_w_bits_data;
  assign nh_fifo_io_out_ready = io_host_in_ready;
  assign T_446 = fifo_wen & io_nasti_w_valid;
  assign T_447 = fifo_wen & nh_fifo_io_in_ready;
  assign T_448 = T_447 | wr_reset;
  assign T_450 = io_nasti_w_valid == 1'h0;
  assign T_451 = ~ io_nasti_w_bits_strb;
  assign GEN_26 = {{3'd0}, 1'h0};
  assign T_453 = T_451 == GEN_26;
  assign T_454 = T_450 | T_453;
  assign T_455 = T_454 | reset;
  assign T_457 = T_455 == 1'h0;
  assign T_459 = io_nasti_ar_valid == 1'h0;
  assign T_461 = io_nasti_ar_bits_len == GEN_25;
  assign T_462 = T_459 | T_461;
  assign T_470 = io_nasti_ar_bits_burst == 2'h0;
  assign T_471 = T_462 | T_470;
  assign T_472 = T_471 | reset;
  assign T_474 = T_472 == 1'h0;
  assign T_476 = io_nasti_aw_valid == 1'h0;
  assign T_478 = io_nasti_aw_bits_len == GEN_25;
  assign T_479 = T_476 | T_478;
  assign T_480 = io_nasti_aw_bits_burst == 2'h0;
  assign T_481 = T_479 | T_480;
  assign T_482 = T_481 | reset;
  assign T_484 = T_482 == 1'h0;
`ifndef SYNTHESIS
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002;
    `endif
  GEN_24 = {1{$random}};
  fifo_ren = GEN_24[0:0];
  GEN_27 = {1{$random}};
  fifo_wen = GEN_27[0:0];
  GEN_28 = {1{$random}};
  fifo_rd_len = GEN_28[7:0];
  GEN_29 = {1{$random}};
  fifo_rd_id = GEN_29[11:0];
  GEN_30 = {1{$random}};
  fifo_wr_id = GEN_30[11:0];
  GEN_31 = {1{$random}};
  fifo_wr_ack = GEN_31[0:0];
  GEN_32 = {1{$random}};
  rd_count = GEN_32[0:0];
  GEN_33 = {1{$random}};
  wr_reset = GEN_33[0:0];
  end
`endif
  always @(posedge clk) begin
    if(reset) begin
      fifo_ren <= 1'h0;
    end else begin
      fifo_ren <= GEN_9;
    end
    if(reset) begin
      fifo_wen <= 1'h0;
    end else begin
      fifo_wen <= GEN_17;
    end
    if(1'h0) begin
    end else begin
      fifo_rd_len <= GEN_11;
    end
    if(1'h0) begin
    end else begin
      fifo_rd_id <= GEN_3;
    end
    if(1'h0) begin
    end else begin
      fifo_wr_id <= GEN_14;
    end
    if(reset) begin
      fifo_wr_ack <= 1'h0;
    end else begin
      fifo_wr_ack <= GEN_20;
    end
    if(reset) begin
      rd_count <= 1'h0;
    end else begin
      rd_count <= GEN_10;
    end
    if(reset) begin
      wr_reset <= 1'h0;
    end else begin
      wr_reset <= GEN_18;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_457) begin
          $fwrite(32'h80000002,"Assertion failed: Nasti to HostIO converter cannot take partial writes\n    at htif.scala:316 assert(!io.nasti.w.valid || io.nasti.w.bits.strb.andR,\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_457) begin
          $fdisplay(32'h80000002,"1");$finish;
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_474) begin
          $fwrite(32'h80000002,"Assertion failed: Nasti to HostIO converter can only take fixed bursts\n    at htif.scala:318 assert(!io.nasti.ar.valid ||\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_474) begin
          $fdisplay(32'h80000002,"1");$finish;
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_484) begin
          $fwrite(32'h80000002,"Assertion failed: Nasti to HostIO converter can only take fixed bursts\n    at htif.scala:322 assert(!io.nasti.aw.valid ||\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_484) begin
          $fdisplay(32'h80000002,"1");$finish;
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
  end
endmodule
module ZynqAdapter(
  input   clk,
  input   reset,
  output  io_nasti_aw_ready,
  input   io_nasti_aw_valid,
  input  [31:0] io_nasti_aw_bits_addr,
  input  [7:0] io_nasti_aw_bits_len,
  input  [2:0] io_nasti_aw_bits_size,
  input  [1:0] io_nasti_aw_bits_burst,
  input   io_nasti_aw_bits_lock,
  input  [3:0] io_nasti_aw_bits_cache,
  input  [2:0] io_nasti_aw_bits_prot,
  input  [3:0] io_nasti_aw_bits_qos,
  input  [3:0] io_nasti_aw_bits_region,
  input  [11:0] io_nasti_aw_bits_id,
  input   io_nasti_aw_bits_user,
  output  io_nasti_w_ready,
  input   io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input   io_nasti_w_bits_last,
  input  [11:0] io_nasti_w_bits_id,
  input  [3:0] io_nasti_w_bits_strb,
  input   io_nasti_w_bits_user,
  input   io_nasti_b_ready,
  output  io_nasti_b_valid,
  output [1:0] io_nasti_b_bits_resp,
  output [11:0] io_nasti_b_bits_id,
  output  io_nasti_b_bits_user,
  output  io_nasti_ar_ready,
  input   io_nasti_ar_valid,
  input  [31:0] io_nasti_ar_bits_addr,
  input  [7:0] io_nasti_ar_bits_len,
  input  [2:0] io_nasti_ar_bits_size,
  input  [1:0] io_nasti_ar_bits_burst,
  input   io_nasti_ar_bits_lock,
  input  [3:0] io_nasti_ar_bits_cache,
  input  [2:0] io_nasti_ar_bits_prot,
  input  [3:0] io_nasti_ar_bits_qos,
  input  [3:0] io_nasti_ar_bits_region,
  input  [11:0] io_nasti_ar_bits_id,
  input   io_nasti_ar_bits_user,
  input   io_nasti_r_ready,
  output  io_nasti_r_valid,
  output [1:0] io_nasti_r_bits_resp,
  output [31:0] io_nasti_r_bits_data,
  output  io_nasti_r_bits_last,
  output [11:0] io_nasti_r_bits_id,
  output  io_nasti_r_bits_user,
  input   io_host_clk,
  input   io_host_clk_edge,
  input   io_host_in_ready,
  output  io_host_in_valid,
  output [15:0] io_host_in_bits,
  output  io_host_out_ready,
  input   io_host_out_valid,
  input  [15:0] io_host_out_bits,
  output  io_reset
);
  wire  conv_clk;
  wire  conv_reset;
  wire  conv_io_nasti_aw_ready;
  wire  conv_io_nasti_aw_valid;
  wire [31:0] conv_io_nasti_aw_bits_addr;
  wire [7:0] conv_io_nasti_aw_bits_len;
  wire [2:0] conv_io_nasti_aw_bits_size;
  wire [1:0] conv_io_nasti_aw_bits_burst;
  wire  conv_io_nasti_aw_bits_lock;
  wire [3:0] conv_io_nasti_aw_bits_cache;
  wire [2:0] conv_io_nasti_aw_bits_prot;
  wire [3:0] conv_io_nasti_aw_bits_qos;
  wire [3:0] conv_io_nasti_aw_bits_region;
  wire [11:0] conv_io_nasti_aw_bits_id;
  wire  conv_io_nasti_aw_bits_user;
  wire  conv_io_nasti_w_ready;
  wire  conv_io_nasti_w_valid;
  wire [31:0] conv_io_nasti_w_bits_data;
  wire  conv_io_nasti_w_bits_last;
  wire [11:0] conv_io_nasti_w_bits_id;
  wire [3:0] conv_io_nasti_w_bits_strb;
  wire  conv_io_nasti_w_bits_user;
  wire  conv_io_nasti_b_ready;
  wire  conv_io_nasti_b_valid;
  wire [1:0] conv_io_nasti_b_bits_resp;
  wire [11:0] conv_io_nasti_b_bits_id;
  wire  conv_io_nasti_b_bits_user;
  wire  conv_io_nasti_ar_ready;
  wire  conv_io_nasti_ar_valid;
  wire [31:0] conv_io_nasti_ar_bits_addr;
  wire [7:0] conv_io_nasti_ar_bits_len;
  wire [2:0] conv_io_nasti_ar_bits_size;
  wire [1:0] conv_io_nasti_ar_bits_burst;
  wire  conv_io_nasti_ar_bits_lock;
  wire [3:0] conv_io_nasti_ar_bits_cache;
  wire [2:0] conv_io_nasti_ar_bits_prot;
  wire [3:0] conv_io_nasti_ar_bits_qos;
  wire [3:0] conv_io_nasti_ar_bits_region;
  wire [11:0] conv_io_nasti_ar_bits_id;
  wire  conv_io_nasti_ar_bits_user;
  wire  conv_io_nasti_r_ready;
  wire  conv_io_nasti_r_valid;
  wire [1:0] conv_io_nasti_r_bits_resp;
  wire [31:0] conv_io_nasti_r_bits_data;
  wire  conv_io_nasti_r_bits_last;
  wire [11:0] conv_io_nasti_r_bits_id;
  wire  conv_io_nasti_r_bits_user;
  wire  conv_io_host_clk;
  wire  conv_io_host_clk_edge;
  wire  conv_io_host_in_ready;
  wire  conv_io_host_in_valid;
  wire [15:0] conv_io_host_in_bits;
  wire  conv_io_host_out_ready;
  wire  conv_io_host_out_valid;
  wire [15:0] conv_io_host_out_bits;
  wire  conv_io_reset;
  NastiIOHostIOConverter conv (
    .clk(conv_clk),
    .reset(conv_reset),
    .io_nasti_aw_ready(conv_io_nasti_aw_ready),
    .io_nasti_aw_valid(conv_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(conv_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(conv_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_size(conv_io_nasti_aw_bits_size),
    .io_nasti_aw_bits_burst(conv_io_nasti_aw_bits_burst),
    .io_nasti_aw_bits_lock(conv_io_nasti_aw_bits_lock),
    .io_nasti_aw_bits_cache(conv_io_nasti_aw_bits_cache),
    .io_nasti_aw_bits_prot(conv_io_nasti_aw_bits_prot),
    .io_nasti_aw_bits_qos(conv_io_nasti_aw_bits_qos),
    .io_nasti_aw_bits_region(conv_io_nasti_aw_bits_region),
    .io_nasti_aw_bits_id(conv_io_nasti_aw_bits_id),
    .io_nasti_aw_bits_user(conv_io_nasti_aw_bits_user),
    .io_nasti_w_ready(conv_io_nasti_w_ready),
    .io_nasti_w_valid(conv_io_nasti_w_valid),
    .io_nasti_w_bits_data(conv_io_nasti_w_bits_data),
    .io_nasti_w_bits_last(conv_io_nasti_w_bits_last),
    .io_nasti_w_bits_id(conv_io_nasti_w_bits_id),
    .io_nasti_w_bits_strb(conv_io_nasti_w_bits_strb),
    .io_nasti_w_bits_user(conv_io_nasti_w_bits_user),
    .io_nasti_b_ready(conv_io_nasti_b_ready),
    .io_nasti_b_valid(conv_io_nasti_b_valid),
    .io_nasti_b_bits_resp(conv_io_nasti_b_bits_resp),
    .io_nasti_b_bits_id(conv_io_nasti_b_bits_id),
    .io_nasti_b_bits_user(conv_io_nasti_b_bits_user),
    .io_nasti_ar_ready(conv_io_nasti_ar_ready),
    .io_nasti_ar_valid(conv_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(conv_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(conv_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_size(conv_io_nasti_ar_bits_size),
    .io_nasti_ar_bits_burst(conv_io_nasti_ar_bits_burst),
    .io_nasti_ar_bits_lock(conv_io_nasti_ar_bits_lock),
    .io_nasti_ar_bits_cache(conv_io_nasti_ar_bits_cache),
    .io_nasti_ar_bits_prot(conv_io_nasti_ar_bits_prot),
    .io_nasti_ar_bits_qos(conv_io_nasti_ar_bits_qos),
    .io_nasti_ar_bits_region(conv_io_nasti_ar_bits_region),
    .io_nasti_ar_bits_id(conv_io_nasti_ar_bits_id),
    .io_nasti_ar_bits_user(conv_io_nasti_ar_bits_user),
    .io_nasti_r_ready(conv_io_nasti_r_ready),
    .io_nasti_r_valid(conv_io_nasti_r_valid),
    .io_nasti_r_bits_resp(conv_io_nasti_r_bits_resp),
    .io_nasti_r_bits_data(conv_io_nasti_r_bits_data),
    .io_nasti_r_bits_last(conv_io_nasti_r_bits_last),
    .io_nasti_r_bits_id(conv_io_nasti_r_bits_id),
    .io_nasti_r_bits_user(conv_io_nasti_r_bits_user),
    .io_host_clk(conv_io_host_clk),
    .io_host_clk_edge(conv_io_host_clk_edge),
    .io_host_in_ready(conv_io_host_in_ready),
    .io_host_in_valid(conv_io_host_in_valid),
    .io_host_in_bits(conv_io_host_in_bits),
    .io_host_out_ready(conv_io_host_out_ready),
    .io_host_out_valid(conv_io_host_out_valid),
    .io_host_out_bits(conv_io_host_out_bits),
    .io_reset(conv_io_reset)
  );
  assign io_nasti_aw_ready = conv_io_nasti_aw_ready;
  assign io_nasti_w_ready = conv_io_nasti_w_ready;
  assign io_nasti_b_valid = conv_io_nasti_b_valid;
  assign io_nasti_b_bits_resp = conv_io_nasti_b_bits_resp;
  assign io_nasti_b_bits_id = conv_io_nasti_b_bits_id;
  assign io_nasti_b_bits_user = conv_io_nasti_b_bits_user;
  assign io_nasti_ar_ready = conv_io_nasti_ar_ready;
  assign io_nasti_r_valid = conv_io_nasti_r_valid;
  assign io_nasti_r_bits_resp = conv_io_nasti_r_bits_resp;
  assign io_nasti_r_bits_data = conv_io_nasti_r_bits_data;
  assign io_nasti_r_bits_last = conv_io_nasti_r_bits_last;
  assign io_nasti_r_bits_id = conv_io_nasti_r_bits_id;
  assign io_nasti_r_bits_user = conv_io_nasti_r_bits_user;
  assign io_host_in_valid = conv_io_host_in_valid;
  assign io_host_in_bits = conv_io_host_in_bits;
  assign io_host_out_ready = conv_io_host_out_ready;
  assign io_reset = conv_io_reset;
  assign conv_clk = clk;
  assign conv_reset = reset;
  assign conv_io_nasti_aw_valid = io_nasti_aw_valid;
  assign conv_io_nasti_aw_bits_addr = io_nasti_aw_bits_addr;
  assign conv_io_nasti_aw_bits_len = io_nasti_aw_bits_len;
  assign conv_io_nasti_aw_bits_size = io_nasti_aw_bits_size;
  assign conv_io_nasti_aw_bits_burst = io_nasti_aw_bits_burst;
  assign conv_io_nasti_aw_bits_lock = io_nasti_aw_bits_lock;
  assign conv_io_nasti_aw_bits_cache = io_nasti_aw_bits_cache;
  assign conv_io_nasti_aw_bits_prot = io_nasti_aw_bits_prot;
  assign conv_io_nasti_aw_bits_qos = io_nasti_aw_bits_qos;
  assign conv_io_nasti_aw_bits_region = io_nasti_aw_bits_region;
  assign conv_io_nasti_aw_bits_id = io_nasti_aw_bits_id;
  assign conv_io_nasti_aw_bits_user = io_nasti_aw_bits_user;
  assign conv_io_nasti_w_valid = io_nasti_w_valid;
  assign conv_io_nasti_w_bits_data = io_nasti_w_bits_data;
  assign conv_io_nasti_w_bits_last = io_nasti_w_bits_last;
  assign conv_io_nasti_w_bits_id = io_nasti_w_bits_id;
  assign conv_io_nasti_w_bits_strb = io_nasti_w_bits_strb;
  assign conv_io_nasti_w_bits_user = io_nasti_w_bits_user;
  assign conv_io_nasti_b_ready = io_nasti_b_ready;
  assign conv_io_nasti_ar_valid = io_nasti_ar_valid;
  assign conv_io_nasti_ar_bits_addr = io_nasti_ar_bits_addr;
  assign conv_io_nasti_ar_bits_len = io_nasti_ar_bits_len;
  assign conv_io_nasti_ar_bits_size = io_nasti_ar_bits_size;
  assign conv_io_nasti_ar_bits_burst = io_nasti_ar_bits_burst;
  assign conv_io_nasti_ar_bits_lock = io_nasti_ar_bits_lock;
  assign conv_io_nasti_ar_bits_cache = io_nasti_ar_bits_cache;
  assign conv_io_nasti_ar_bits_prot = io_nasti_ar_bits_prot;
  assign conv_io_nasti_ar_bits_qos = io_nasti_ar_bits_qos;
  assign conv_io_nasti_ar_bits_region = io_nasti_ar_bits_region;
  assign conv_io_nasti_ar_bits_id = io_nasti_ar_bits_id;
  assign conv_io_nasti_ar_bits_user = io_nasti_ar_bits_user;
  assign conv_io_nasti_r_ready = io_nasti_r_ready;
  assign conv_io_host_clk = io_host_clk;
  assign conv_io_host_clk_edge = io_host_clk_edge;
  assign conv_io_host_in_ready = io_host_in_ready;
  assign conv_io_host_out_valid = io_host_out_valid;
  assign conv_io_host_out_bits = io_host_out_bits;
endmodule
