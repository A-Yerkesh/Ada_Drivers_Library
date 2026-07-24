------------------------------------------------------------------------------
--                                                                          --
--                    Copyright (C) 2026, AdaCore                           --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of STMicroelectronics nor the names of its       --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

--  This file provides register definitions for the STM32G0 (ARM Cortex M0+)
--  microcontrollers from ST Microelectronics.

package STM32.EXTI is

   Line_Type_Error : exception;

   type External_Line_Number is
     (EXTI_Line_0,
      EXTI_Line_1,
      EXTI_Line_2,
      EXTI_Line_3,
      EXTI_Line_4,
      EXTI_Line_5,
      EXTI_Line_6,
      EXTI_Line_7,
      EXTI_Line_8,
      EXTI_Line_9,
      EXTI_Line_10,
      EXTI_Line_11,
      EXTI_Line_12,
      EXTI_Line_13,
      EXTI_Line_14,
      EXTI_Line_15,
      EXTI_Line_19,
      EXTI_Line_21,
      EXTI_Line_23,
      EXTI_Line_25,
      EXTI_Line_26,
      EXTI_Line_31);

   type External_Line_Type is (Configurable, Direct);

   Line_Types : constant array (External_Line_Number) of External_Line_Type :=
     (EXTI_Line_0 .. EXTI_Line_15 => Configurable,
      others                      => Direct);

   type External_Triggers is
     (Interrupt_Rising_Edge,
      Interrupt_Falling_Edge,
      Interrupt_Rising_Falling_Edge,
      Event_Rising_Edge,
      Event_Falling_Edge,
      Event_Rising_Falling_Edge);

   subtype Interrupt_Triggers is External_Triggers
      range Interrupt_Rising_Edge .. Interrupt_Rising_Falling_Edge;

   subtype Event_Triggers is External_Triggers
      range Event_Rising_Edge .. Event_Rising_Falling_Edge;

   --  Available for direct lines

   procedure Arm_External_Interrupt (Line : External_Line_Number)
     with Inline;

   procedure Arm_External_Event (Line : External_Line_Number)
     with Inline;

   --  Available for configurable lines

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
     with Inline;

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
     with Inline;

   procedure Generate_SWI (Line : External_Line_Number)
     with Inline;

   function External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
     with Inline;

   procedure Clear_External_Interrupt (Line : External_Line_Number)
     with Inline;

   --  Available to all lines

   procedure Disable_External_Interrupt (Line : External_Line_Number)
     with Inline;

   procedure Disable_External_Event (Line : External_Line_Number)
     with Inline;

end STM32.EXTI;
