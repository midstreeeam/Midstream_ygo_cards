--大学新生的形式主义
function c66660006.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_ATKCHANGE)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetTarget(c66660006.target)
	e1:SetOperation(c66660006.activate)
	c:RegisterEffect(e1)
end
function c66660006.filter(c)
	return c:IsFaceup() and c:IsSetCard(0x770)
end
function c66660006.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c66660006.filter,tp,LOCATION_MZONE,0,1,nil) end
end
function c66660006.activate(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(c66660006.filter,tp,LOCATION_MZONE,0,nil)
	local tc=g:GetFirst()
	while tc do
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_UPDATE_ATTACK)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_BATTLE_STEP)
		e1:SetValue(1000)
		tc:RegisterEffect(e1)
		tc=g:GetNext()
	end
end