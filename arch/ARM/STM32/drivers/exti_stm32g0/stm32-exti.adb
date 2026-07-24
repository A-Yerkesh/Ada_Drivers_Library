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

with STM32_SVD.EXTI; use STM32_SVD.EXTI;

package body STM32.EXTI is

   Line_Index : constant array (External_Line_Number) of Natural :=
     (EXTI_Line_0  => 0,
      EXTI_Line_1  => 1,
      EXTI_Line_2  => 2,
      EXTI_Line_3  => 3,
      EXTI_Line_4  => 4,
      EXTI_Line_5  => 5,
      EXTI_Line_6  => 6,
      EXTI_Line_7  => 7,
      EXTI_Line_8  => 8,
      EXTI_Line_9  => 9,
      EXTI_Line_10 => 10,
      EXTI_Line_11 => 11,
      EXTI_Line_12 => 12,
      EXTI_Line_13 => 13,
      EXTI_Line_14 => 14,
      EXTI_Line_15 => 15,
      EXTI_Line_19 => 19,
      EXTI_Line_21 => 21,
      EXTI_Line_23 => 23,
      EXTI_Line_25 => 25,
      EXTI_Line_26 => 26,
      EXTI_Line_31 => 31);

   ----------------------------
   -- Arm_External_Interrupt --
   ----------------------------

   procedure Arm_External_Interrupt (Line : External_Line_Number) is
   begin
      EXTI_Periph.IMR1.Arr (Line_Index (Line)) := True;
   end Arm_External_Interrupt;

   ------------------------
   -- Arm_External_Event --
   ------------------------

   procedure Arm_External_Event (Line : External_Line_Number) is
   begin
      case Line is
         when EXTI_Line_0 .. EXTI_Line_15 | EXTI_Line_19 =>
            EXTI_Periph.EMR1.EM.Arr (Line_Index (Line)) := True;
         when EXTI_Line_21 =>
            EXTI_Periph.EMR1.EM21 := True;
         when EXTI_Line_23 =>
            EXTI_Periph.EMR1.EM23 := True;
         when EXTI_Line_25 | EXTI_Line_26 | EXTI_Line_31 =>
            EXTI_Periph.EMR1.EM_1.Arr (Line_Index (Line)) := True;
      end case;
   end Arm_External_Event;

   -------------------------------
   -- Enable_External_Interrupt --
   -------------------------------

   procedure Enable_External_Interrupt
     (Line    : External_Line_Number;
      Trigger : Interrupt_Triggers)
   is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and cannot be enabled. Use Arm_External_Interrupt" &
           " instead.";
      end if;

      EXTI_Periph.RTSR1.RT.Arr (Line_Index (Line)) :=
        Trigger in Interrupt_Rising_Edge | Interrupt_Rising_Falling_Edge;
      EXTI_Periph.FTSR1.FT.Arr (Line_Index (Line)) :=
        Trigger in Interrupt_Falling_Edge | Interrupt_Rising_Falling_Edge;

      Arm_External_Interrupt (Line);
   end Enable_External_Interrupt;

   ---------------------------
   -- Enable_External_Event --
   ---------------------------

   procedure Enable_External_Event
     (Line    : External_Line_Number;
      Trigger : Event_Triggers)
   is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and cannot be enabled. Use Arm_External_Event" &
           " instead.";
      end if;

      EXTI_Periph.RTSR1.RT.Arr (Line_Index (Line)) :=
        Trigger in Event_Rising_Edge | Event_Rising_Falling_Edge;
      EXTI_Periph.FTSR1.FT.Arr (Line_Index (Line)) :=
        Trigger in Event_Falling_Edge | Event_Rising_Falling_Edge;

      Arm_External_Event (Line);
   end Enable_External_Event;

   ------------------
   -- Generate_SWI --
   ------------------

   procedure Generate_SWI (Line : External_Line_Number) is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and cannot generate a software interrupt.";
      end if;

      EXTI_Periph.SWIER1.SWI.Arr (Line_Index (Line)) := True;
   end Generate_SWI;

   -------------------------------------
   -- Any_External_Interrupt_Pending --
   -------------------------------------

   function Any_External_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
   is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and has no pending flag in EXTI.";
      end if;

      return EXTI_Periph.RPR1.RPIF.Arr (Line_Index (Line))
        or else EXTI_Periph.FPR1.FPIF.Arr (Line_Index (Line));
   end Any_External_Interrupt_Pending;

   ------------------------------
   -- Rising_Interrupt_Pending --
   ------------------------------

   function Rising_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
   is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and has no pending flag in EXTI.";
      end if;

      return EXTI_Periph.RPR1.RPIF.Arr (Line_Index (Line));
   end Rising_Interrupt_Pending;

   -------------------------------
   -- Falling_Interrupt_Pending --
   -------------------------------

   function Falling_Interrupt_Pending (Line : External_Line_Number)
     return Boolean
   is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and has no pending flag in EXTI.";
      end if;

      return EXTI_Periph.FPR1.FPIF.Arr (Line_Index (Line));
   end Falling_Interrupt_Pending;

   -------------------------------------
   -- Clear_Both_External_Interrupts --
   -------------------------------------

   procedure Clear_Both_External_Interrupts (Line : External_Line_Number) is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and has no pending flag in EXTI to clear.";
      end if;

      EXTI_Periph.RPR1.RPIF.Arr (Line_Index (Line)) := True;
      EXTI_Periph.FPR1.FPIF.Arr (Line_Index (Line)) := True;
   end Clear_Both_External_Interrupts;

   ----------------------------
   -- Clear_Rising_Interrupt --
   ----------------------------

   procedure Clear_Rising_Interrupt (Line : External_Line_Number) is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and has no pending flag in EXTI to clear.";
      end if;

      EXTI_Periph.RPR1.RPIF.Arr (Line_Index (Line)) := True;
   end Clear_Rising_Interrupt;

   -----------------------------
   -- Clear_Falling_Interrupt --
   -----------------------------

   procedure Clear_Falling_Interrupt (Line : External_Line_Number) is
   begin
      if Line_Types (Line) /= Configurable then
         raise Line_Type_Error with
           External_Line_Number'Image (Line) &
           " is direct and has no pending flag in EXTI to clear.";
      end if;

      EXTI_Periph.FPR1.FPIF.Arr (Line_Index (Line)) := True;
   end Clear_Falling_Interrupt;

   --------------------------------
   -- Disable_External_Interrupt --
   --------------------------------

   procedure Disable_External_Interrupt (Line : External_Line_Number) is
   begin
      if Line_Types (Line) = Configurable then
         EXTI_Periph.RTSR1.RT.Arr (Line_Index (Line)) := False;
         EXTI_Periph.FTSR1.FT.Arr (Line_Index (Line)) := False;
      end if;

      EXTI_Periph.IMR1.Arr (Line_Index (Line)) := False;
   end Disable_External_Interrupt;

   ----------------------------
   -- Disable_External_Event --
   ----------------------------

   procedure Disable_External_Event (Line : External_Line_Number) is
   begin
      if Line_Types (Line) = Configurable then
         EXTI_Periph.RTSR1.RT.Arr (Line_Index (Line)) := False;
         EXTI_Periph.FTSR1.FT.Arr (Line_Index (Line)) := False;
      end if;

      case Line is
         when EXTI_Line_0 .. EXTI_Line_15 | EXTI_Line_19 =>
            EXTI_Periph.EMR1.EM.Arr (Line_Index (Line)) := False;
         when EXTI_Line_21 =>
            EXTI_Periph.EMR1.EM21 := False;
         when EXTI_Line_23 =>
            EXTI_Periph.EMR1.EM23 := False;
         when EXTI_Line_25 | EXTI_Line_26 | EXTI_Line_31 =>
            EXTI_Periph.EMR1.EM_1.Arr (Line_Index (Line)) := False;
      end case;
   end Disable_External_Event;

end STM32.EXTI;
